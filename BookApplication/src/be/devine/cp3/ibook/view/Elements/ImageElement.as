/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.Elements {
import be.devine.cp3.ibook.vo.ImageVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.textures.Texture;

public class ImageElement extends Element{

    private var imageLoader:Loader;

    public function ImageElement(imageVO:ImageVO) {
        super(imageVO);

        trace("imagepath " + imageVO.imagePath);

        var imagePath:String = imageVO.imagePath.toString();

        imageLoader = new Loader();
        imageLoader.load(new URLRequest(imagePath));
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageElementLoaded);

    }

    // METHODS
    private function imageElementLoaded(e:Event):void{
        trace("imageElementLoaded");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(imageLoader.content as Bitmap);
        var image:Image = new Image(texture);
        addChild(image);
    }
}
}
