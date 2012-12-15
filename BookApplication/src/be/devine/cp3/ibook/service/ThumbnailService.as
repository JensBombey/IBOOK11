/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 15/12/12
 * Time: 11:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.service {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.Page;
import be.devine.cp3.ibook.vo.PageVO;

import com.adobe.images.JPGEncoder;


import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import starling.core.RenderSupport;

import starling.core.Starling;
import starling.display.Quad;


import starling.display.Sprite;
import starling.events.Event;
import starling.utils.getNextPowerOfTwo;


public class ThumbnailService extends Sprite{

    private var tempPage:Page;
    private var container:Sprite;
    private var whiteOverlay:Quad;
    public static const THUMBS_MADE:String = "thumbsMade";
    private var appModel:AppModel;
    private var arrPaths:Vector.<String>;

    public function ThumbnailService(pages:Vector.<PageVO>) {

        appModel = AppModel.getInstance();

        arrPaths = new Vector.<String>;

        container = new Sprite();
        this.addChild(container);
        container.width = container.height = 500;

        for each(var page:PageVO in pages)
        {
            //Inhoud van de pagina in container steken
            container.removeChildren();
            tempPage = new Page(page);
            trace(tempPage);
            whiteOverlay = new Quad(964,964,0xffffff);

            container.addChild(whiteOverlay);
            whiteOverlay.y = 0;
            container.addChild(tempPage);

            //Bitmap maken van de container
            /*var bmpData:BitmapData = new BitmapData(container.width, container.height, false, 0xffffff);
            bmpData.draw(container);*/
            container.scaleY = 0.207;
            container.scaleX = 0.325;
            var bmpData:BitmapData = copyAsBitmapData(container);

            //Bitmap encoderen naar een jpg
            var encoder:JPGEncoder = new JPGEncoder();
            var jpgBytes:ByteArray = encoder.encode(bmpData);

            var file:File = File.applicationStorageDirectory.resolvePath("thumbs"+ "/" + "thumb" + tempPage.pageNumber + ".jpg");
            var fileStream:FileStream = new FileStream();

            fileStream.open(file, FileMode.WRITE);
            fileStream.writeBytes(jpgBytes);
            fileStream.close();
            var path:String = file.url;

            arrPaths.push(path);
            appModel.arrThumbPaths= arrPaths;
        }

    }


    public static function copyAsBitmapData(sprite:starling.display.DisplayObject):BitmapData {
        if (sprite == null) return null;

        var resultRect:Rectangle = new Rectangle();
        sprite.getBounds(sprite, resultRect);

        var context:Context3D = Starling.context;
        var scale:Number = .32;
        var nativeWidth:Number = getNextPowerOfTwo(Starling.current.stage.stageWidth  * scale);
        var nativeHeight:Number = getNextPowerOfTwo(Starling.current.stage.stageHeight * scale);

        var support:RenderSupport = new RenderSupport();
        RenderSupport.clear();
        support.setOrthographicProjection(nativeWidth/scale, nativeHeight/scale);
        support.applyBlendMode(true);
        //support.transformMatrix(sprite.root);
        support.translateMatrix( -resultRect.x, -resultRect.y);

        if(resultRect.width == 0 || resultRect.height == 0)
        {
            var result:BitmapData = new BitmapData(50, 50, false, 0xffffff);

        }else
        {
            var result:BitmapData = new BitmapData(200, 133, false, 0xffffff);

        }
        trace("Bitmaptest: " + sprite);
        support.pushMatrix();
        support.pushBlendMode();

        support.blendMode = sprite.blendMode;
        support.transformMatrix(sprite);
        sprite.render(support, 1.0);
        support.popMatrix();
        support.popBlendMode();

        support.finishQuadBatch();

        context.drawToBitmapData(result);

        return result;
    }
}
}
