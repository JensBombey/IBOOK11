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
    public var thumbsContainer:ThumbsContainer;
    private var arrThumbs:Vector.<Thumbnail>;
    private var line:Quad = new Quad(1,105,0x888888, true);
    private var controls:Controls;



    [Embed(source="/assets/design/thumbsBarSlice.png")] private static const ThumbsBarSlice:Class;


    public function ThumbsBar() {
        appModel = AppModel.getInstance();
        thumbsContainer = new ThumbsContainer();
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
        addChild(line);

        line.x = 120;
        line.y = 5;

        appModel.addEventListener(AppModel.THUMB_PATHS_CHANGED,thumbPathsChangedHandler);
        appModel.addEventListener(AppModel.PAGE_INDEX_CHANGED,pageIndexChangedHandler);



    }


    private function thumbPathsChangedHandler():void{
        var xPos:uint = 0;
        var i:uint = 0;
        removeChild(thumbsContainer);
        arrThumbs = new Vector.<Thumbnail>();
        for each(var path:String in appModel.arrThumbPaths)
        {
            i++;
            var thumbnail:Thumbnail = new Thumbnail(path);
            arrThumbs.push(thumbnail);
            thumbsContainer.addChild(thumbnail);
            thumbnail.textfield.text = i +"";
            thumbnail.x = xPos;
            xPos +=120;
            thumbnail.addEventListener(TouchEvent.TOUCH, touchHandler);
        }
        addChild(thumbsContainer);
        thumbsContainer.x = 125;
        thumbsContainer.y = 5;

        //controls moet uitgemaskte thumbs bedekken zodat er niet op geklikt kan worden
        controls = new Controls();
        addChild(controls);
    }

    private function pageIndexChangedHandler():void{
        for each(var thumb:Thumbnail in arrThumbs)
        {
            thumb.active = false;
        }
        arrThumbs[appModel.pageIndex].active = true;

        //verschuif thumbnails
        if(appModel.pageIndex >= 4)
        {
            thumbsContainer.x = -((appModel.pageIndex-4)*120) + 5;
        }else{

            thumbsContainer.x = 125;
        }

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
