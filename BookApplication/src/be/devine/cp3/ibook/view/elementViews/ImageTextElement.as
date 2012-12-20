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
    private var paragraafEen:TextField;
    private var infoBoven:starling.text.TextField;
    private var infoOnder:TextField;
    private var subtitel:starling.text.TextField

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
        infoBoven = new TextField(392,16,imageTextVO.infoBoven,Style.FONT,12,0x656565);
        infoBoven.hAlign = HAlign.LEFT;
        infoBoven.vAlign = VAlign.TOP;
        addChild(infoBoven);

        infoOnder = new TextField(392,16,imageTextVO.infoOnder,Style.FONT,12,0x656565);
        infoOnder.hAlign = HAlign.RIGHT;
        addChild(infoOnder);

        subtitel = new TextField(864,16,imageTextVO.subtitel,Style.FONT,14,0xe16565);
        subtitel.hAlign = HAlign.LEFT;
        subtitel.italic = true;
        subtitel.y = titel.height;

    }

    // METHODS
    private function imageElementLoaded(e:Event):void{
        trace("imageElementLoaded");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(imageLoader.content as Bitmap);
        var image:Image = new Image(texture);
        paragraafEen.x = 420;
        image.y = titel.height*2;
        paragraafEen.y = image.y;
        addChild(paragraafEen);
        addChild(image);

        infoBoven.x = paragraafEen.x;
        infoBoven.y = infoBoven.height + 20;
        trace("INFOBOVENJEJEJJEJE---------- " + infoBoven);
        infoOnder.x = paragraafEen.x;
        infoOnder.y = paragraafEen.height + infoOnder.height + 40;
        addChild(infoOnder);

        subtitel.x = image.x;
        subtitel.y = titel.y + subtitel.height*3;
        addChild(subtitel);
    }


}
}
