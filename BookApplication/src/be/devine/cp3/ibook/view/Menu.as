/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 14/12/12
 * Time: 01:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.service.ThumbnailService;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.menuElements.Arrow;
import be.devine.cp3.ibook.view.menuElements.PageIndicator;
import be.devine.cp3.ibook.view.menuElements.ThumbsBar;

import com.greensock.TweenLite;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Menu extends Sprite{

    private var appModel:AppModel;

    private var prevButton:Arrow;
    private var nextButton:Arrow;
    public var indicator:PageIndicator;

    private var thumbsBar:ThumbsBar;
    private var blackOverlay:Quad;
    private var thumbService:ThumbnailService;



    public function Menu() {
        this.appModel = AppModel.getInstance();

        indicator = new PageIndicator();
        addChild(indicator);
        indicator.y = 659;
        indicator.x = 380;

        prevButton = new Arrow();
        addChild(prevButton);
        prevButton.y = 659;

        nextButton = new Arrow();
        addChild(nextButton);
        nextButton.scaleX = -1;
        nextButton.x = 966;
        nextButton.y = 659;

        thumbsBar = new ThumbsBar();
        thumbsBar.y = -thumbsBar.height;

        blackOverlay = new Quad(964,624,0x000000);
        blackOverlay.x = appModel.appWidth/2 - blackOverlay.width/2;
        blackOverlay.y = appModel.appHeight/2 - blackOverlay.height/2;
        blackOverlay.x = 0;
        blackOverlay.alpha = 0;


        prevButton.addEventListener(TouchEvent.TOUCH, prevPage);
        nextButton.addEventListener(TouchEvent.TOUCH, nextPage);

        appModel.addEventListener(AppModel.PAGE_INDEX_CHANGED, pageIndexChangedHandler);
        appModel.addEventListener(AppModel.SHOW_THUMBS_CHANGED, showThumbsChangedHandler);

        appModel.addEventListener(AppModel.PAGE_CHANGED, pagesChangedHandler);
        pagesChangedHandler();

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

    private function showThumbsChangedHandler():void {
        if(appModel.showThumbs)
        {
            addChild(blackOverlay);
            addChild(thumbsBar);

            TweenLite.to(blackOverlay,1, {alpha:.5});
            TweenLite.to(thumbsBar,1, {y:0});

        }else{
            TweenLite.to(blackOverlay,1, {alpha:0, onComplete:toggleVisibility});
            TweenLite.to(thumbsBar,1, {y:-thumbsBar.height, onComplete:toggleVisibility});

        }

    }

    private function toggleVisibility():void{
        removeChild(blackOverlay);
        removeChild(thumbsBar);
    }

    private function pagesChangedHandler():void{
        thumbService = new ThumbnailService(appModel.pages);


    }







}
}
