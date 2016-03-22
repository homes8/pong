package game.server;

/**
 * ...
 * @author vova
 */
class Request
{
	private var mUrl:String;
	private var mMethod:String;
	private var mShouldCache:Bool = true;
	private var mCanceled:Bool = false;
	private var mResponseDelivered:Bool = false;
	
	private var mRequestQueue:RequestQueue;
	
	public function new()
	{
		
	}
	
	public void setRequestQueue(RequestQueue requestQueue) {
        mRequestQueue = requestQueue;
    }
	
}