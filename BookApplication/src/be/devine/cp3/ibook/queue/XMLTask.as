/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 14:29
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.queue {
import avmplus.USE_ITRAITS;

import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLTask extends URLLoader implements IQueue{

    private var _path:String;

    public function XMLTask(path:String) {
        this._path = path;
    }

    public function start():void{
        this.load(new URLRequest(_path));
    }
}
}
