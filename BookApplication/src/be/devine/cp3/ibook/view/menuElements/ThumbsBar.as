/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 14/12/12
 * Time: 21:06
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import be.devine.cp3.ibook.model.AppModel;

import flash.geom.Point;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class ThumbsBar extends Sprite{

    private var bgBar:Image;
    private var appModel:AppModel;
    public var thumbsContainer:Sprite;
    private var arrThumbs:Vector.<Thumbnail>;

    [Embed(source="/assets/design/thumbsBarSlice.png")] private static const ThumbsBarSlice:Class;

    public function ThumbsBar() {
        appModel = AppModel.getInstance();
        thumbsContainer = new Sprite();
        addChild(thumbsContainer);

        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(new ThumbsBarSlice());

        texture.repeat = true;
        bgBar = new Image(texture);
        //horizontal = breedte van container gedeeld door breedte afbeelding (964 / 13)
        //vertical = hoogte van afbeelding
        var horizontal:Number = 74.2;
        var vertical:Number = 115;
        bgBar.setTexCoords(1,new Point(horizontal,0));
        bgBar.setTexCoords(2, new Point(0, vertical));
        bgBar.setTexCoords(3, new Point(horizontal,vertical));

        bgBar.width *= horizontal;
        bgBar.height = vertical;
        addChild(bgBar);

        appModel.addEventListener(AppModel.THUMB_PATHS_CHANGED,thumbPathsChangedHandler);
        appModel.addEventListener(AppModel.PAGE_INDEX_CHANGED,pageIndexChangedHandler);

    }

    private function thumbPathsChangedHandler():void{
        var xPos:uint = 0;
        removeChild(thumbsContainer);
        arrThumbs = new Vector.<Thumbnail>();
        for each(var path:String in appModel.arrThumbPaths)
        {
            var thumbnail:Thumbnail = new Thumbnail(path);
            arrThumbs.push(thumbnail);
            thumbsContainer.addChild(thumbnail);
            thumbnail.x = xPos;
            xPos +=120;
            thumbnail.addEventListener(TouchEvent.TOUCH, touchHandler);
        }
        addChild(thumbsContainer);
        thumbsContainer.x = 5;
        thumbsContainer.y = 5;

    }

    private function pageIndexChangedHandler():void{
        for each(var thumb:Thumbnail in arrThumbs)
        {
            thumb.active = false;
        }
        arrThumbs[appModel.pageIndex].active = true;
    }

    private function touchHandler(te:TouchEvent):void
    {

        if (te.getTouch(this, TouchPhase.ENDED))
        {
            for(var i:uint=0; i<arrThumbs.length; i++)
            {
                if(te.currentTarget == arrThumbs[i])
                {
                    appModel.pageIndex = i;
                }
            }
        }
    }
}
}
