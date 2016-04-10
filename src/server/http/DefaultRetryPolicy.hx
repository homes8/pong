package server.http;


import flash.events.HTTPStatusEvent;
import openfl.net.URLRequest;

import server.INetwork;
import server.IRetryPolicy;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class DefaultRetryPolicy implements IRetryPolicy {
    private static inline var DEFAULT_RETRIES_AMOUNT: Int = 1;


    private var retries: Int = 0;
    private var retriesAmount: Int = DEFAULT_RETRIES_AMOUNT;


    public function new(retriesAmount: Int = DEFAULT_RETRIES_AMOUNT) {
        this.retriesAmount = retriesAmount;
    }

    public function retry(): Bool {
        if(retries >= retriesAmount) {
            return false;
        }

        retries++;
        return true;
    }
}
