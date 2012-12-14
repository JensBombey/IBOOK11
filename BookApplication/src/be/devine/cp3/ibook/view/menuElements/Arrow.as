/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 14/12/12
 * Time: 09:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class Arrow extends Sprite{

    private var previousButton:Image;
    private var previousButtonLoader:Loader;

    public function Arrow() {

        previousButtonLoader = new Loader();
        previousButtonLoader.load(new URLRequest("assets/design/previous_arrow.png"));
        previousButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, previousButtonLoaded);
    }

    private function previousButtonLoaded(e:Event):void{
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(previousButtonLoader.content as Bitmap);
        previousButton = new Image(texture);
        addChild(previousButton);
        previousButton.addEventListener(TouchEvent.TOUCH, onTouch);
    }

    private function onTouch(te:TouchEvent):void
    {
        if (te.getTouch(this, TouchPhase.HOVER))
        {
            this.alpha=0.7;
            trace(this);
        }
        else
        {
            this.alpha=1;
        }

        if (te.getTouch(this, TouchPhase.ENDED))
        {
            this.alpha = 0.5;
        }
    }
}
}
