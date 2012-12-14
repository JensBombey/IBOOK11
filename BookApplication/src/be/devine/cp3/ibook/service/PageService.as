/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 13:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.service {
import be.devine.cp3.ibook.factory.vo.PageVOFactory;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.queue.Queue;
import be.devine.cp3.ibook.queue.XMLTask;
import be.devine.cp3.ibook.vo.PageVO;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class PageService extends EventDispatcher{

    private var xmlTask:XMLTask;
    private var queue:Queue;
    private var appModel:AppModel;

    public function PageService() {
        appModel = AppModel.getInstance();
    }

    public function load():void{
        trace("[PAGESERVICE] load function");
        queue = new Queue();
        xmlTask = new XMLTask("assets/book.xml");

        queue.add(xmlTask);
        queue.start();
        queue.addEventListener(Event.COMPLETE, pagesXMLLoadedHandler);

/*        var pagesXMLLoader:URLLoader = new URLLoader();
        pagesXMLLoader.addEventListener(Event.COMPLETE, pagesXMLLoadedHandler);
        pagesXMLLoader.load(new URLRequest("assets/book.xml"));*/
    }

    private function pagesXMLLoadedHandler(e:Event):void {
        var xmlTask:XMLTask = queue.completedTasks[0] as XMLTask;
        trace("[PageService] pagesXMLLoadedHandler");

        var pagesXML:XML = new XML(xmlTask.data);

        /*var pages:Array = [];
        for each(var pageXML:XML in pagesXML.page){
            pages.push();
        }*/

        var pages:Vector.<PageVO> = new Vector.<PageVO>();
        var pageFactory = new PageVOFactory();
        var i:uint = 1;
        for each(var pageXML:XML in pagesXML.page){
            pages.push(PageVOFactory.createPageVOFromXML(pageXML, i));
            i++;
        }
        appModel.pages = pages;
        trace("[PAGESERVICE_pagesXMLLoadedHandler] DONE");
        dispatchEvent(new Event(Event.COMPLETE));

    }


}
}
