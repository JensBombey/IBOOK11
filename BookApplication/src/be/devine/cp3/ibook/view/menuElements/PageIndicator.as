/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 14/12/12
 * Time: 10:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.style.Style;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;

import starling.display.Sprite;
import starling.text.TextField;
import starling.textures.Texture;

public class PageIndicator extends Sprite{

    private var currentPageButtonLoader:Loader;
    private var currentPageButton:Image;
    private var appModel:AppModel;

    public function PageIndicator() {

        this.appModel = AppModel.getInstance();
        currentPageButtonLoader = new Loader();
        currentPageButtonLoader.load(new URLRequest("assets/design/currentpage.png"));
        currentPageButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, currentPageButtonLoaded);

    }

    private function currentPageButtonLoaded(e:Event):void{
        trace("current page button");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(currentPageButtonLoader.content as Bitmap);
        currentPageButton = new Image(texture);
        currentPageButton.x = 100;
        addChild(currentPageButton);
        var pageIndex:Number = appModel.pageIndex;
        var pageIndexString:String = (pageIndex + 1).toString();
        var textfield:starling.text.TextField = new starling.text.TextField(200,40,pageIndexString,Style.FONT,14,0x656565,true)
        addChild(textfield);
        trace("[MENU] " + pageIndexString);
    }
}
}