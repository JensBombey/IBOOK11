/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elementViews {
import be.devine.cp3.ibook.style.Style;
import be.devine.cp3.ibook.vo.ImageTextVO;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.text.TextField;
import starling.textures.Texture;

public class ImageTextElement extends Element{

    private var imageLoader:Loader;

    public function ImageTextElement(imageTextVO:ImageTextVO) {
        super(imageTextVO);

        var imagePath:String = imageTextVO.imagePath.toString();

        imageLoader = new Loader();
        imageLoader.load(new URLRequest(imagePath));
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageElementLoaded);

        var paragraaf:TextField = new TextField(392,421,imageTextVO.content,Style.FONT,14,0x656565);
        addChild(paragraaf);
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
