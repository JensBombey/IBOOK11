/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 14/12/12
 * Time: 01:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.menuElements.Arrow;
import be.devine.cp3.ibook.view.menuElements.PageIndicator;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.KeyboardEvent;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class Menu extends Sprite{

    private var appModel:AppModel;

    private var prevButton:Arrow;
    private var nextButton:Arrow;
    public var indicator:PageIndicator;



    public function Menu() {
        this.appModel = AppModel.getInstance();

        indicator = new PageIndicator();
        addChild(indicator);

        prevButton = new Arrow();
        addChild(prevButton);

        nextButton = new Arrow();
        addChild(nextButton);
        nextButton.scaleX = -1;
        nextButton.x = prevButton.x + 200;


        prevButton.addEventListener(TouchEvent.TOUCH, prevPage);
        nextButton.addEventListener(TouchEvent.TOUCH, nextPage);

        appModel.addEventListener(AppModel.PAGE_INDEX_CHANGED, pageIndexChangedHandler);


    }


    // METHODS
    private function prevPage(te:TouchEvent):void{
        if (te.getTouch(this, TouchPhase.ENDED))
        {

            appModel.pageIndex --;
        }
    }

    private function nextPage(te:TouchEvent):void{
        if (te.getTouch(this, TouchPhase.ENDED))
        {

            appModel.pageIndex ++;
        }
    }

    private function pageIndexChangedHandler():void{
        trace("pageIndex: " + appModel.pageIndex);
        if(appModel.pageIndex == 0)
        {
            removeChild(prevButton);
        }else{
            addChild(prevButton);
        }
        if(appModel.pageIndex == appModel.pages.length - 1)
        {
            removeChild(nextButton);
        }else{
            addChild(nextButton);
        }
    }







}
}
