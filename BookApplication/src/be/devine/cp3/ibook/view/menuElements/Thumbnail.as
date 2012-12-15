/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 15/12/12
 * Time: 11:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Thumbnail extends Sprite{

    private var imageLoader:Loader;

    public function Thumbnail(path:String) {

        imageLoader = new Loader();
        imageLoader.load(new URLRequest(path));
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, thumbLoaded);

    }

    // METHODS
    private function thumbLoaded(e:Event):void{
        trace("imageElementLoaded");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(imageLoader.content as Bitmap);
        var image:Image = new Image(texture);
        addChild(image);
    }
}
}
