/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.model {
import be.devine.cp3.ibook.Config;
import be.devine.cp3.ibook.service.ThumbnailService;
import be.devine.cp3.ibook.vo.PageVO;

import flash.net.SharedObject;

import starling.events.Event;
import starling.events.EventDispatcher;

public class AppModel extends EventDispatcher{

    private static var instance:AppModel;
/*    public var loadedXML:XML;
    private var _xmlParser:XMLParser;
    public static const XML_CHANGED:String = "xmlChanged";
    private var _pages:Vector.<PageVO>;*/

    public static const PAGE_CHANGED:String = "pageChanged";
    public static const PAGE_INDEX_CHANGED:String = "pageIndexChanged";
    public static const SHOW_THUMBS_CHANGED:String = "showThumbsChanged";
    public static const THUMB_PATHS_CHANGED:String = "thumbPathsChanged";
    public static const THUMBS_MADE:String = "thumbsMade";

    private var _pages:Vector.<PageVO>;
    private var _appWidth:Number;
    private var _appHeight:Number;
    private var _pageIndex:uint;
    private var _showThumbs:Boolean = false;
    private var _arrThumbPaths:Vector.<String>;
    private var _thumbsMade:Boolean = false;
    private var _config:Config = new Config();


    public var prevPageIndex:uint = 0;
    public var _bookmarkIndex:uint;
    public var makeThumbs:Boolean;


    //=====CONSTRUCTOR=====
    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }

        var sharedObject:SharedObject = SharedObject.getLocal("bookmarkInfo");
        bookmarkIndex = sharedObject.data.bookMarkIndex ;
        trace("BOOKMARKINDEX: " + bookmarkIndex);
        makeThumbs = _config.thumbnailGenerator;
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
        if(_thumbsMade)
        {
            if(_pageIndex != value){
                prevPageIndex = _pageIndex;
                if(value == pages.length){
                    _pageIndex = pages.length-1;
                }else if(value == uint.MAX_VALUE){

                    _pageIndex = 0;
                }else{
                    _pageIndex = value;
                }
                trace("[APPMODEL] pageIndex = " + _pageIndex);
                    dispatchEvent(new Event(PAGE_INDEX_CHANGED));
            }

        }
    }

    public function get showThumbs():Boolean {
        return _showThumbs;
    }

    public function set showThumbs(value:Boolean):void {
        _showThumbs = value;
        dispatchEvent(new Event(SHOW_THUMBS_CHANGED));

    }

    public function get arrThumbPaths():Vector.<String> {
        return _arrThumbPaths;
    }

    public function set arrThumbPaths(value:Vector.<String>):void {
        _arrThumbPaths = value;
        dispatchEvent(new Event(THUMB_PATHS_CHANGED));
    }

    public function get bookmarkIndex():uint {
        return _bookmarkIndex;
    }

    public function set bookmarkIndex(value:uint):void {
        _bookmarkIndex = value;
    }

    public function get thumbsMade():Boolean {
        return _thumbsMade;
    }

    public function set thumbsMade(value:Boolean):void {
        _thumbsMade = value;
        dispatchEvent(new Event(THUMBS_MADE));
    }
}
}
internal class Enforcer{}