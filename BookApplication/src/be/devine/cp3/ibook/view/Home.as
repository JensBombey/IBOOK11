/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 21:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.geom.Point;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Home extends starling.display.Sprite {

    public static const BACKGROUNDLOADING_COMPLETE:String = "backgroundLoadingComplete";

    private var backgroundImage:Image;
    private var backgroundLoader:Loader;
    private var appmodel:AppModel;
    private var pageContainer:PageContainer;

    public function Home() {
        trace("Home [CONSTRUCT]");

        backgroundLoader = new Loader();
        backgroundLoader.load(new URLRequest("assets/design/bg_pattern.png"));
        backgroundLoader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, backgroundLoadedHandler);
        this.addEventListener(BACKGROUNDLOADING_COMPLETE, backgroundLoadingCompleteHandler);
    }


    // METHODS

    private function backgroundLoadedHandler(e:flash.events.Event):void{
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(backgroundLoader.content as Bitmap);
        texture.repeat = true;
        backgroundImage = new Image(texture);
        var horizontal:Number = stage.stageWidth/backgroundImage.width;
        var vertical:Number = stage.stageHeight/backgroundImage.height;
        backgroundImage.setTexCoords(1,new Point(horizontal,0));
        backgroundImage.setTexCoords(2, new Point(0, vertical));
        backgroundImage.setTexCoords(3, new Point(horizontal,vertical));
        backgroundImage.width *= horizontal;
        backgroundImage.height *= vertical;
        addChild(backgroundImage);

        dispatchEvent(new starling.events.Event(BACKGROUNDLOADING_COMPLETE));
    }

    private function backgroundLoadingCompleteHandler(e:starling.events.Event):void{
        trace("[HOME] pagecontainer aanmaken");
        pageContainer = new PageContainer();
        addChild(pageContainer);
    }
}
}
