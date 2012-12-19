/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.service.PageService;
import be.devine.cp3.ibook.view.Home;
import be.devine.cp3.ibook.view.Page;
import be.devine.cp3.ibook.vo.PageVO;
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.text.Font;

import starling.core.Starling;
import starling.display.Sprite;
import starling.events.KeyboardEvent;

public class Application extends starling.display.Sprite{

    private var appModel:AppModel;
    private var pageService:PageService;
    private var pageContainer:starling.display.Sprite;
    private var home:Home;

    [Embed(source="/assets/font/HelveticaNeueLTStd-Roman.otf",embedAsCFF="false",fontFamily="HelveticaNeue")]
    private static const HelveticaNeue:Class;


    public function Application() {
        trace("[Application] constructor");
        appModel = AppModel.getInstance();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
/*
        appModel.addEventListener(AppModel.XML_CHANGED, pagesChangedHandler);
*/
        pageService = new PageService();
        pageService.addEventListener(Event.COMPLETE, pagesCompleted);
        pageService.load();
        //stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);

    }

    private function addedToStageHandler(e:starling.events.Event):void{
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
    }

    private function pagesCompleted(e:Event):void {
        //trace(appModel.pages);
        //create page views

        trace("[APPLICATION] pages completed, alles tonen");

        // home aanmaken die achtergrond plaatst etc
        home = new Home();
        addChild(home);
        showFonts();
        // pagecontainer in het midden plaatsen
        home.x = stage.width/2;
        home.y = stage.height/2;

    }

    private function showFonts():void{
        trace("embedded fonts");
        var fonts:Array = Font.enumerateFonts();
        fonts.sortOn("fontName",Array.CASEINSENSITIVE);
        for(var i:uint = 0; i<fonts.length;i++){
            trace(fonts[i].fontName + ", " + fonts[i].fontStyle);
        }
    }

    private function keyboardHandler(e:KeyboardEvent):void {
        //trace(e.keyCode);
        if(e.keyCode == 39)
        {
            appModel.pageIndex ++;
        }
        if(e.keyCode == 37)
        {
            appModel.pageIndex --;
        }
        if(e.keyCode == 32)
        {

            appModel.showThumbs = !appModel.showThumbs;
        }
    }


}
}
