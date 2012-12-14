/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 14/12/12
 * Time: 01:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

public class Menu extends Sprite{

    private var previousButton:Image;
    private var previousButtonLoader:Loader;
    private var nextButton:Image;
    private var nextButtonLoader:Loader;


    public function Menu() {
        trace("MENU construct");
        previousButtonLoader = new Loader();
        previousButtonLoader.load(new URLRequest("assets/design/previous_arrow.png"));
        previousButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, previousButtonLoaded);
        nextButtonLoader = new Loader();
        nextButtonLoader.load(new URLRequest("assets/design/next_arrow.png"));
        nextButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, nextButtonLoaded);

    }

    // METHODS
    private function previousButtonLoaded(e:Event):void{
        trace("previous button");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(previousButtonLoader.content as Bitmap);
        previousButton = new Image(texture);
        addChild(previousButton);
    }

    private function nextButtonLoaded(e:Event):void{
        trace("next button");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(nextButtonLoader.content as Bitmap);
        nextButton = new Image(texture);
        nextButton.x = 200;
        addChild(nextButton);
    }
}
}
