/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.model {
import be.devine.cp3.ibook.Application;
import be.devine.cp3.ibook.factory.vo.PageVOFactory;
import be.devine.cp3.ibook.vo.PageVO;
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class AppModel extends EventDispatcher{

    private static var instance:AppModel;
    public var loadedXML:XML;
    private var _xmlParser:XMLParser;
    public static const XML_CHANGED:String = "xmlChanged";
    private var _pages:Vector.<PageVO>;


    //=====CONSTRUCTOR=====
    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }




        this.load("assets/book.xml");
    }


    //=====APPMODEL IS A SINGLETON=====
    public static function getInstance():AppModel {
    if(instance == null) {
        instance = new AppModel(new Enforcer());
    }
    return instance;
    }

    //=====METHODS=====
    public function load(path:String):void{
        _xmlParser = new XMLParser(path);
        _xmlParser.addEventListener(XMLParser.XML_LOADED, xmlLoadedHandler);
    }

    private function xmlLoadedHandler(e:Event):void {
        loadedXML = _xmlParser.geladenXML;

        dispatchEvent(new Event(XML_CHANGED));
        var contentXML:XML = new XML(e.target.data);
        var pages:Vector.<PageVO> = new Vector.<PageVO>();
        var pageFactory = new PageVOFactory();
        for each(var pageXML:XML in loadedXML.page) {
            pages.push(PageVOFactory.createPageVOFromXML(pageXML));
        }
        this.pages = pages;
    }


    public function get pages():Vector.<PageVO> {
        return _pages;
    }

    public function set pages(value:Vector.<PageVO>):void {
        if(_pages != value) {
            _pages = value;
            dispatchEvent(new Event(XML_CHANGED));
        }
    }


}
}
internal class Enforcer{}