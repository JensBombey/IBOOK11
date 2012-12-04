/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 13:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.service {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class PageService extends EventDispatcher{

    public var pages:Array;

    public function PageService() {

    }

    public function load():void{
        var pagesXMLLoader:URLLoader = new URLLoader();
        pagesXMLLoader.addEventListener(Event.COMPLETE, pagesXMLLoadedHandler);
        pagesXMLLoader.load(new URLRequest("assets/book.xml"));
    }

    private function pagesXMLLoadedHandler(e:Event):void {
        var pagesXML:XML = new XML(e.target.data);
        var pages:Array = [];
        for each(var pageXML:XML in pagesXML.page){
            pages.push()
        }

    }
}
}
