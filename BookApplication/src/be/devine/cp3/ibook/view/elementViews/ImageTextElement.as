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

import flash.data.SQLTriggerSchema;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ImageTextElement extends Element{

    private var imageLoader:Loader;
    private var titel:starling.text.TextField;
    private var paragraafEen:TextField

    public function ImageTextElement(imageTextVO:ImageTextVO) {
        super(imageTextVO);

        var imagePath:String = imageTextVO.imagePath.toString();

        imageLoader = new Loader();
        imageLoader.load(new URLRequest(imagePath));
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageElementLoaded);

        titel = new TextField(864,38,imageTextVO.titel,Style.FONT,38,0x656565);
        trace("titel x = " + titel.x);
        trace("titel height = " + titel.height);

        titel.hAlign = HAlign.LEFT;
        addChild(titel);

        paragraafEen = new TextField(392,421,imageTextVO.paragraafEen,Style.FONT,14,0x656565);
        paragraafEen.hAlign = HAlign.LEFT;
        paragraafEen.vAlign = VAlign.TOP;
    }

    // METHODS
    private function imageElementLoaded(e:Event):void{
        trace("imageElementLoaded");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(imageLoader.content as Bitmap);
        var image:Image = new Image(texture);
        paragraafEen.x = image.width + 30;
        image.y = titel.height*2;
        paragraafEen.y = image.y;
        addChild(paragraafEen);
        addChild(image);
    }


}
}
