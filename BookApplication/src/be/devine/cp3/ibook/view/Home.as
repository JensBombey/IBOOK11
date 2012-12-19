/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 21:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.style.Style;

import com.greensock.TweenLite;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.net.URLRequest;

import starling.core.RenderSupport;
import starling.core.Starling;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;

public class Home extends starling.display.Sprite {

    public static const BACKGROUNDLOADING_COMPLETE:String = "backgroundLoadingComplete";

    private var backgroundImage:Image;
    private var backgroundLoader:Loader;
    private var appModel:AppModel;
    private var pageContainer:PageContainer;
    private var loadingContainer:Sprite;
    private var blackOverlay:Quad;
    private var originalHeight:int;
    private var originalWidth:int;

    public function Home() {
        trace("Home [CONSTRUCT]");

        appModel = AppModel.getInstance();
        loadingContainer = new Sprite();
        blackOverlay = new Quad(appModel.appWidth,appModel.appHeight,0x000000);
        loadingContainer.addChild(blackOverlay);
        blackOverlay.alpha = .8;
        var textfield = new TextField(600,400,"",Style.FONT,35,0xffffff,true);
        loadingContainer.addChild(textfield);
        textfield.text = "LOADING THUMBNAILS";
        textfield.x = appModel.appWidth/2 - textfield.width/2;
        textfield.y = 100;

        pageContainer = new PageContainer();

        backgroundLoader = new Loader();
        backgroundLoader.load(new URLRequest("assets/design/bg_pattern.png"));
        backgroundLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, backgroundLoadedHandler);
        this.addEventListener(BACKGROUNDLOADING_COMPLETE, backgroundLoadingCompleteHandler);

        appModel.addEventListener(AppModel.SIZE_CHANGED, resizeHandler);
    }


    // METHODS

    private function resizeHandler(e:starling.events.Event):void{
        trace("[HOME] resizeHandler");
        display();

    }

    private function backgroundLoadedHandler(e:flash.events.Event):void{
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(backgroundLoader.content as Bitmap);
        texture.repeat = true;
        backgroundImage = new Image(texture);
        originalHeight = backgroundImage.height;
        originalWidth = backgroundImage.width;

        addChild(backgroundImage);

        display();
        dispatchEvent(new starling.events.Event(BACKGROUNDLOADING_COMPLETE));
    }

    private function display():void{
        var horizontal:Number = appModel.appWidth/originalWidth;
        var vertical:Number = appModel.appHeight/originalHeight;
        backgroundImage.setTexCoords(1,new Point(horizontal,0));
        backgroundImage.setTexCoords(2, new Point(0, vertical));
        backgroundImage.setTexCoords(3, new Point(horizontal,vertical));
        backgroundImage.width = originalWidth*horizontal;
        backgroundImage.height = originalHeight*vertical;


        // pagecontainer in het midden plaatsen
        /*pageContainer.x = appModel.appWidth/2 - pageContainer.width/2;
        pageContainer.y = appModel.appHeight/2 - pageContainer.height/2;*/

    }

    private function backgroundLoadingCompleteHandler(e:starling.events.Event):void{
        trace("[HOME] pagecontainer aanmaken");

        addChild(pageContainer);
        if(appModel.makeThumbs)
        {
            addChild(loadingContainer);
            appModel.addEventListener(AppModel.THUMBS_MADE, thumbsMadeHandler);
        }

        display();
    }

    private function thumbsMadeHandler():void {

        TweenLite.to(loadingContainer,1, {alpha:0, onComplete:toggleVisibility});
    }

    private function toggleVisibility():void{
        removeChild(loadingContainer);

    }

}
}
