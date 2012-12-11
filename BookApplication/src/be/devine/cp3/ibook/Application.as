/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.Page;
import be.devine.cp3.ibook.vo.PageVO;
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import starling.core.Starling;
import starling.display.Sprite;

public class Application extends starling.display.Sprite{

    private var starling:Starling;

    private var appModel:AppModel;
    private var pageContainer:starling.display.Sprite;


    public function Application() {

        appModel = AppModel.getInstance();

        appModel.addEventListener(AppModel.XML_CHANGED, pagesChangedHandler);

    }

    private function pagesChangedHandler(event:Event):void {
        //trace(appModel.pages);
        //create page views
        var xPos:uint = 0;
        for each(var pageVO:PageVO in appModel.pages) {
            var page:Page = new Page(pageVO);
            page.x = xPos;
            //TODO:Pagina's in de container plaatsen en showen
            //pageContainer.addChild(page);
            xPos += 600;
        }
    }


}
}
