package server.http;


import server.IRequest;
import server.IResponse;
import server.IRequestQueue;
import server.http.HttpRequestQueue.QueueItem;


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
	private var head: QueueItem = null;
	private var tail: QueueItem = null;


	public inline function new() {
		
	}

	public inline function add(request: IRequest): Void {
		if(null == request) {
			retrun;
		}

		if(null == head) {
			
		}
	}

	public inline function pop(): IRequest {
		
	}

	@override
	public function handleCompletion(response: IResponse): Void {
		
	}
}


/**
 * ...
 * @author Dmitry Velichkevich
 */
class HttpRequestQueue implements IRequestQueue {
	private static inline var MAXIMUM_ACTIVE_REQUESTS: Int = 4;


	private var requestQueues: List<Queue> = new List<Queue>();


    public function new() {
        for(i: Int in 1...MAXIMUM_ACTIVE_REQUESTS) {
			requestQueues.add(new Queue());
		}
    }

    public function sendRequest(request: IRequest): IResponse {
        
    }

    public function createRequest(url: String, ?contentType: String, ?method: ERequestMethod): IRequest {
        return new HttpRequest(url, contentType, method);
    }    

	public function release(): Void {
		
	}
}
