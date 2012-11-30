/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.display.Sprite;
import flash.events.Event;

public class Application extends Sprite{

    private var appModel:AppModel;
    private var _xmlParser:XMLParser;
    public var loadedXML:XML;

    public function Application() {

        appModel = AppModel.getInstance();

        _xmlParser = new XMLParser("assets/book.xml");

        _xmlParser.addEventListener(XMLParser.XML_LOADED, xmlLoadedHandler);


    }

    private function xmlLoadedHandler(e:Event):void {
        loadedXML = _xmlParser.geladenXML;
        trace(loadedXML);
    }
}
}
