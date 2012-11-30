/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.xmlParser {
import be.devine.cp3.ibook.model.AppModel;

import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLParser extends Sprite{

    private var _xmlLoader:URLLoader = new URLLoader();
    private var _appModel:AppModel;
    public var geladenXML:XML;

    public static const XML_LOADED:String = "xmlLoaded";


    public function XMLParser(path:String) {

        _appModel = AppModel.getInstance();
        var xmlPath:String = path;
        _xmlLoader.load(new URLRequest(xmlPath));
        _xmlLoader.addEventListener(Event.COMPLETE, completeHandler);
    }

    private function completeHandler(e:Event):void {
        geladenXML = new XML(e.currentTarget.data);
        dispatchEvent(new Event(XML_LOADED));

    }
}
}
