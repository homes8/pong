package server;
import openfl.errors.Error;


/**
 * Taken from http://old.haxe.org/doc/snip/uri_parser
 * 
 * @author Mike Cann
 * @author Dmitry Velichkevich
 */
class URL {
    private static inline function URL_PARTS(): Array<String> {
        return ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"];
    }


    private var url: String = null;
    private var source: String = null;
    private var protocol: String = null;
    private var authority: String = null;
    private var userInfo: String = null;
    private var user: String = null;
    private var password: String = null;
    private var host: String = null;
    private var port: String = null;
    private var relative: String = null;
    private var path: String = null;
    private var directory: String = null;
    private var file: String = null;
    private var service: String = null;
    private var query: String = null;
    private var anchor: String = null;


    public function new(url: String) {
        if((null == url) || (0 == url.length)) {
            throw new Error("URL.new(url: String): Invalid URL! It must not be NULL or empty");
        }

        // Save for 'ron
        this.url = url;

        // The almighty regexp (courtesy of http://blog.stevenlevithan.com/archives/parseuri)
        var r: EReg = ~/^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/;

        // Match the regexp to the url
        r.match(url);

        // Use reflection to set each part
        for(i in 0...URL_PARTS().length) {
            Reflect.setField(this, URL_PARTS()[i],  r.matched(i));
        }

        if((null != path) && (path.length > 0) && (path.lastIndexOf("/") >= 0)) {
            service = path.substring(path.lastIndexOf("/") + 1);
        }
    }

    public function getUrl(): String {
        return url;
    }

    public function getSource(): String {
        return source;
    }

    public function getProtocol(): String {
        return protocol;
    }

    public function getAuthority(): String {
        return authority;
    }

    public function getUserInfo(): String {
        return userInfo;
    }

    public function getUser(): String {
        return user;
    }

    public function getPassword(): String {
        return password;
    }

    public function getHost(): String {
        return host;
    }

    public function getPort(): String {
        return port;
    }

    public function getRelative(): String {
        return relative;
    }

    public function getPath(): String {
        return path;
    }

    public function getDirectory(): String {
        return directory;
    }

    public function getFile(): String {
        return file;
    }

    public function getService(): String {
        return service;
    }

    public function getQuery(): String {
        return query;
    }

    public function getAnchor(): String {
        return anchor;
    }

    public function toString(): String {
        var result: String = "For Url -> " + url + "\n";
        for(i in 0...URL_PARTS().length) {
            result += URL_PARTS()[i] + ": " + Reflect.field(this, URL_PARTS()[i]) + ((URL_PARTS().length - 1 == i) ? (""):("\n"));
        }
        result += "\nservice: " + service;
        return result;
    }
}
