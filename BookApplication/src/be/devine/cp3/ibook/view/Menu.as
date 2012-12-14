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

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class Menu extends Sprite{

    private var appModel:AppModel;

    private var prevButton:Arrow;

    private var nextButton:Arrow;


    public function Menu() {
        this.appModel = AppModel.getInstance();

        prevButton = new Arrow();
        addChild(prevButton);

        nextButton = new Arrow();
        addChild(nextButton);
        nextButton.scaleX = -1;
        nextButton.x = prevButton.x + 200;


        prevButton.addEventListener(TouchEvent.TOUCH, prevPage);
        nextButton.addEventListener(TouchEvent.TOUCH, nextPage);
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



}
}
