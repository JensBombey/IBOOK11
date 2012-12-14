/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 14/12/12
 * Time: 01:58
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.style.Style;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import flash.text.TextField;

import starling.core.Starling;

import starling.display.Image;
import starling.display.Sprite;
import starling.text.TextField;
import starling.textures.Texture;

public class Menu extends Sprite{

    private var currentPageButton:Image;
    private var currentPageButtonLoader:Loader;
    private var previousButton:Image;
    private var previousButtonLoader:Loader;
    private var nextButton:Image;
    private var nextButtonLoader:Loader;
    private var appmodel:AppModel;


    public function Menu() {

        trace("MENU construct");

        appmodel = AppModel.getInstance();
        appmodel.pageIndex = 2;
        previousButtonLoader = new Loader();
        previousButtonLoader.load(new URLRequest("assets/design/previous_arrow.png"));
        previousButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, previousButtonLoaded);
        nextButtonLoader = new Loader();
        nextButtonLoader.load(new URLRequest("assets/design/next_arrow.png"));
        nextButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, nextButtonLoaded);
        currentPageButtonLoader = new Loader();
        currentPageButtonLoader.load(new URLRequest("assets/design/currentpage.png"));
        currentPageButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, currentPageButtonLoaded);

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

    private function currentPageButtonLoaded(e:Event):void{
        trace("current page button");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(currentPageButtonLoader.content as Bitmap);
        currentPageButton = new Image(texture);
        currentPageButton.x = 100;
        addChild(currentPageButton);
        var pageIndex:Number = appmodel.pageIndex;
        var pageIndexString:String = (pageIndex + 1).toString();
        var textfield:starling.text.TextField = new starling.text.TextField(200,40,pageIndexString,Style.FONT,14,0x656565,true)
        addChild(textfield);
        trace("[MENU] " + pageIndexString);
    }
}
}
