/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 16/12/12
 * Time: 18:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.pageElements {
import be.devine.cp3.ibook.model.AppModel;

import flash.net.SharedObject;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class Bookmark extends Sprite{

    private var bookmark:Image;
    private var _active:Boolean = false;
    private var appModel:AppModel;
    private var currentPageIndex:uint;

    [Embed(source="/assets/design/bookmark.png")] private static const BookmarkPng:Class;

    public function Bookmark(currentPageIndex:uint) {
        appModel = AppModel.getInstance();
        this.currentPageIndex = currentPageIndex;
        var texture:Texture = Texture.fromBitmap(new BookmarkPng());
        bookmark = new Image(texture);
        addChild(bookmark);
        bookmark.addEventListener(TouchEvent.TOUCH, onTouch);
        bookmark.scaleY = .5;
    }

    // METHODS

    private function onTouch(te:TouchEvent):void
    {
        if (te.getTouch(this, TouchPhase.HOVER))
        {
            if(!_active)
            {
                this.alpha=.5;
            }
        }
        else
        {
            if(!_active)
            {
                this.alpha=.25;
            }
        }

        if (te.getTouch(this, TouchPhase.ENDED))
        {
            this.alpha=1;
            active = true;
            appModel._bookmarkIndex = currentPageIndex;
            var sharedObject:SharedObject = SharedObject.getLocal("bookmarkInfo");
            sharedObject.data.bookMarkIndex = appModel.pageIndex;
            sharedObject.flush();
        }
    }

    //GETTERS & SETTERS
    public function get active():Boolean {
        return _active;
    }

    public function set active(value:Boolean):void {
        _active = value;
        if(value)
        {
            bookmark.alpha = 1;
            bookmark.scaleY = 1;
        }
        else
        {

        }
    }
}
}
