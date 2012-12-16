/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 16/12/12
 * Time: 21:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import be.devine.cp3.ibook.model.AppModel;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class BookmarkButton extends Sprite{

    private var bookmark:Image;
    private var appModel:AppModel;
    [Embed(source="/assets/design/bookmarkButton.png")] private static const bookmarkButtonPng:Class;

    public function BookmarkButton() {

        appModel = AppModel.getInstance();
        var texture:Texture = Texture.fromBitmap(new bookmarkButtonPng());
        bookmark = new Image(texture);
        addChild(bookmark);
        bookmark.alpha = .5;
        bookmark.addEventListener(TouchEvent.TOUCH, onTouch);
    }

    private function onTouch(te:TouchEvent):void
    {
        if (te.getTouch(this, TouchPhase.HOVER))
        {
            this.alpha=.25;
        }
        else
        {
            this.alpha=.5;
        }

        if (te.getTouch(this, TouchPhase.ENDED))
        {
            this.alpha=.5;
            appModel.pageIndex = appModel.bookmarkIndex;
            trace("PAGEINDEX: " + appModel.pageIndex);
            trace("BOOKMARKINDEX: " + appModel.bookmarkIndex);
        }
    }
}
}
