/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 15/12/12
 * Time: 11:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {

import be.devine.cp3.ibook.style.Style;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.display.Image;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;

public class Thumbnail extends Sprite{

    private var imageLoader:Loader;
    private var thumbHolder:Sprite;
    private var image:Image;
    private var border:Quad;
    public var textfield:TextField;
    private var _active:Boolean = false;

    public function Thumbnail(path:String) {

        imageLoader = new Loader();
        imageLoader.load(new URLRequest(path));
        imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, thumbLoaded);
        textfield = new starling.text.TextField(60,40,"",Style.FONT,35,0x999999,true);

    }

    // METHODS
    private function thumbLoaded(e:Event):void{
        trace("imageElementLoaded");
        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(imageLoader.content as Bitmap);
        image = new Image(texture);
        border = new Quad(105,105, 0x555555, true);
        thumbHolder = new Sprite();
        addChild(thumbHolder);
        thumbHolder.addChild(border);
        thumbHolder.addChild(image);
        thumbHolder.addChild(textfield);
        image.x = 5;
        image.y = 5;
        textfield.alpha=0;
        textfield.x = 20;
        textfield.y = 30;

        image.width = 95;
        image.height = 95;
        thumbHolder.addEventListener(TouchEvent.TOUCH, onTouch);
    }

    private function onTouch(te:TouchEvent):void
    {

        if (te.getTouch(this, TouchPhase.HOVER))
        {
            this.border.color=0xe16565;
            textfield.alpha=.5;
        }
        else
        {
            if(this.active == false)
            {
                this.border.color=0x555555;
                textfield.alpha=0;
            }
        }

    }

    public function get active():Boolean {
        return _active;
    }

    public function set active(value:Boolean):void {
        _active = value;
        if(value)
        {
            this.border.color=0xe16565;
            textfield.alpha=.5;
        }
        else
        {
            this.border.color=0x555555;
            textfield.alpha=0;
        }
    }
}
}
