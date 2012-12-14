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
/*    public var loadedXML:XML;
    private var _xmlParser:XMLParser;
    public static const XML_CHANGED:String = "xmlChanged";
    private var _pages:Vector.<PageVO>;*/

    public static const PAGE_CHANGED:String = "pageChanged";
    public static const PAGE_INDEX_CHANGED:String = "pageIndexChanged";

    private var _pages:Vector.<PageVO>;
    private var _appWidth:Number;
    private var _appHeight:Number;
    private var _pageIndex:uint;


    //=====CONSTRUCTOR=====
    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }



/*
        this.load("assets/book.xml");*/
    }


    //=====APPMODEL IS A SINGLETON=====
    public static function getInstance():AppModel {
    if(instance == null) {
        instance = new AppModel(new Enforcer());
    }
    return instance;
    }

    //=====METHODS=====



    //=====GETTERS & SETTERS=====
    public function get pages():Vector.<PageVO> {
        return _pages;
    }

    public function set pages(value:Vector.<PageVO>):void {
        if(_pages != value){
            _pages = value;
            trace("[APPMODEL_PAGES_SETTER] pages array " + this.pages[pageIndex].element);
            dispatchEvent(new Event(PAGE_CHANGED));
        }

    }

    public function get appHeight():Number {
        return _appHeight;
    }

    public function set appHeight(value:Number):void {
        _appHeight = value;
        trace(appHeight);
    }

    public function get appWidth():Number {
        return _appWidth;
    }

    public function set appWidth(value:Number):void {
        _appWidth = value;
        trace(appWidth);
    }

    public function get pageIndex():uint {
        return _pageIndex;
    }

    public function set pageIndex(value:uint):void {
        if(_pageIndex != value){
            if(value == pages.length){
                _pageIndex = pages.length-1;
            }else if(value == 4294967295){

                _pageIndex = 0;
            }else{
                _pageIndex = value;
            }
            trace("[APPMODEL] pageIndex = " + _pageIndex);
                dispatchEvent(new Event(PAGE_INDEX_CHANGED));
        }
    }
}
}
internal class Enforcer{}