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
import starling.display.Sprite;
import starling.textures.Texture;

public class ThumbsBar extends Sprite{

    private var bgBar:Image;
    private var appModel:AppModel;
    public var thumbsContainer:Sprite;

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

        appModel.addEventListener(AppModel.THUMB_PATHS_CHANGED,thumbPathsChangedHandler)

    }

    private function thumbPathsChangedHandler():void{
        var xPos:uint = 0;
        removeChild(thumbsContainer);
        for each(var path:String in appModel.arrThumbPaths)
        {
            var thumbnail:Thumbnail = new Thumbnail(path);
            thumbsContainer.addChild(thumbnail);
            thumbnail.x = xPos;
            xPos +=200;
            trace("THUMBNAIL XPOS "+ thumbnail.width);
        }

        addChild(thumbsContainer);

    }
}
}
