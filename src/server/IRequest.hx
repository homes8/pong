package server;


/**
 * 
 * @author vova
 * @author Dmitry Velichkevich
 */
interface IRequest {
    public function setRequestQueue(requestQueue: IRequestQueue): Void;

    public function setRetryPolicy(retryPolicy: IRetryPolicy): Void;

    public function getRetryPolicy(): IRetryPolicy;

    public function getUrl(): URL;

    public function getCacheKey(): String;

    public function canBeParallel(): Bool;

    public function setCacheEntry(): Void;

    public function addHeader(header: String, value: String): Void;

    public function setHeaders(headers: List<NetworkHeader>): Void;

    public function getHeaders(): List<NetworkHeader>;

    public function getMethod(): String;

    public function getContentType(): String;

    public function getData(): Dynamic;

    public function setData(data: Dynamic): Void;

    public function lock(): Void;

    public function addRequestCompletionObserver(observer: IRequestCompletionObserver): Void;

    public function getRequestCompletedObservers(): List<IRequestCompletionObserver>;
}
