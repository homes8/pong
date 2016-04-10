package server.http;


import haxe.ds.StringMap;
import haxe.Constraints.IMap;

import server.IRequest;
import server.IResponse;
import server.IRequestQueue;


/**
 * ...
 * @author Dmitry Velichkevich
 */
private class QueueItem {
    private var next: QueueItem = null;
    private var data: IRequest = null;


    public inline function new(data: IRequest) {
        this.data = data;
    }

    public inline function getData(): IRequest {
        return data;
    }

    public inline function getNext(): QueueItem {
        return next;
    }

    public inline function isLast(): Bool {
        return null == next;
    }

    public inline function setNext(next: QueueItem): Void {
        this.next = next;
    }
}


/**
 * ...
 * @author Dmitry Velichkevich
 */
private class Queue implements IRequestCompletionObserver {
    private static inline var THREAD_NO = -1;
    private static inline var THREAD_MAIN = 0;
    private static inline var THREAD_ANOTHER = 1;


    private var head: QueueItem = null;
    private var tail: QueueItem = null;

    private var size: Int = 0;

    private var blocker: Int = THREAD_NO;


    public inline function new() {
    }

    private function cas(expectedOldValue: Int, newValue: Int): Bool {
        var oldValue: Int = blocker;
        if(expectedOldValue != oldValue) {
            return false;
        }

        if(expectedOldValue == oldValue) {
            blocker = newValue;
            return true;
        }

        return false;
    }

    public inline function add(request: IRequest): Void {
        while(!cas(THREAD_NO, THREAD_MAIN)) {
        }

        if(null == request) {
            cas(THREAD_MAIN, THREAD_NO);
            return;
        }

        size++;

        if(null == head) {
            head = new QueueItem(request);
            tail = head;
            cas(THREAD_MAIN, THREAD_NO);
            return;
        }

        tail.setNext(new QueueItem(request));
        tail = tail.getNext();
        cas(THREAD_MAIN, THREAD_NO);
    }

    public inline function clear(): Void {
        while(!cas(THREAD_NO, THREAD_MAIN)) {
        }

        size = 0;
        head = null;
        tail = null;

        cas(THREAD_MAIN, THREAD_NO);
    }

    private inline function pop(): IRequest {
        while(!cas(THREAD_NO, THREAD_ANOTHER)) {
        }

        if(null == head) {
            cas(THREAD_ANOTHER, THREAD_NO);
            return null;
        }

        size--;
        var resultItem: QueueItem = head;
        head = head.getNext();

        if(null == head) {
            tail = null;
        }

        cas(THREAD_ANOTHER, THREAD_NO);

        var result: IRequest = resultItem.getData();
        resultItem.setNext(null);
        return result;
    }

    public function isEmpty(): Bool {
        return 0 == size;
    }

    public function getSize(): Int {
        return size;
    }

    @override
    public function handleCompletion(response: IResponse): Void {
        var request: IRequest = pop();
        if(null == request) {
            return;
        }

        request.addRequestCompletionObserver(this);
        request.lock();
        var network: HttpNetwork = new HttpNetwork();
        network.send(request);
    }
}


/**
 * ...
 * @author Dmitry Velichkevich
 */
class HttpRequestQueue implements IRequestQueue {
    private static inline var INVALID_INDEX: Int = -1;
    private static inline var MAXIMUM_ACTIVE_REQUESTS: Int = 4;


    private var requestQueues: Array<Queue> = new Array<Queue>();
    private var queueRequestIndexMap: IMap<String, Int> = new StringMap<Int>();


    public function new() {
        var i: Int = 0;
        for(i in 0...MAXIMUM_ACTIVE_REQUESTS) {
            requestQueues.push(new Queue());
        }
    }

    private function getMappedIndex(key: String): Int {
        if(!queueRequestIndexMap.exists(key)) {
            var index: Int = getLeastLoadedIndex();
            queueRequestIndexMap.set(key, index);
        }

        return queueRequestIndexMap.get(key);
    }

    private function getLeastLoadedIndex(): Int {
        var i: Int = 0;
        var result: Int = 0;
        for(i in 1...MAXIMUM_ACTIVE_REQUESTS) {
            if(requestQueues[i].getSize() < requestQueues[result].getSize()) {
                result = i;
            }
        }
        return result;
    }

    private function getQueueIndexKey(url: URL): String {
        var result: String = url.getSource();
        var query: String = url.getQuery();
        if((null != query) && (query.length > 0)) {
            result = result.substring(0, (result.indexOf(query) - 1));
        }
        return result;
    }

    public function sendRequest(request: IRequest): Void {
        if(null == request) {
            return null;
        }

        var key: String = getQueueIndexKey(request.getUrl());
        var queueIndex: Int = (!request.canBeParallel() || queueRequestIndexMap.exists(key)) ? (getMappedIndex(key)):(getLeastLoadedIndex());
        var queue: Queue = requestQueues[queueIndex];
        var queueWasEmpty: Bool = queue.isEmpty();
        queue.add(request);
        if(queueWasEmpty) {
            queue.handleCompletion(null);
        }
    }

    public function createRequest(url: String, ?contentType: String, ?method: ERequestMethod, ?parallel: Bool = true): IRequest {
        return new HttpRequest(url, contentType, method);
    }    

    public function release(): Void {
        var i: Int = 0;
        for(i in 0...MAXIMUM_ACTIVE_REQUESTS) {
            requestQueues[i].clear();
        }
        var key: String = null;
        for(key in queueRequestIndexMap.keys()) {
            queueRequestIndexMap.remove(key);
        }
    }
}
