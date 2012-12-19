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


import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.events.TimerEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.geom.Rectangle;
import flash.utils.ByteArray;
import flash.utils.Timer;

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
    private var arrPages:Vector.<PageVO>;
    private var timer:Timer;
    private var i:uint=0;

    public function ThumbnailService(pages:Vector.<PageVO>) {

        appModel = AppModel.getInstance();

        arrPaths = new Vector.<String>;

        arrPages = pages;

        container = new Sprite();
        this.addChild(container);
        container.width = container.height = 500;

        if(appModel.makeThumbs)
        {
            timer = new Timer(200, appModel.pages.length);
            timer.addEventListener(TimerEvent.TIMER, tickHandler);
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, thumbsCompleteHandler);
            timer.start();
        }else{
            for(var i:uint = 1; i<= appModel.pages.length; i++)
            {
                var file:File = File.applicationStorageDirectory.resolvePath("thumbs"+ "/" + "thumb" + i + ".jpg");
                var fileStream:FileStream = new FileStream();
                trace("FILEPATH " + file.url);
                fileStream.open(file, FileMode.READ);
                var path:String = file.url;

                arrPaths.push(path);
                appModel.arrThumbPaths= arrPaths;
                appModel.thumbsMade = true;

            }
            trace("ARRPATHS: " +arrPaths);
        }
        /*
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
        */

    }

    private function thumbsCompleteHandler(e:TimerEvent):void {
        appModel.thumbsMade = true;
    }

    private function tickHandler(e:TimerEvent):void {
        //Inhoud van de pagina in container steken
        container.removeChildren();
        tempPage = new Page(arrPages[i]);
        i++;
        whiteOverlay = new Quad(964,964,0xffffff);

        container.addChild(whiteOverlay);
        whiteOverlay.y = 0;
        container.addChild(tempPage);

        //Bitmap maken van de container

        container.scaleY = 0.207;
        container.scaleX = 0.325;

        var loadingTimer:Timer = new Timer(100, 1);
        loadingTimer.addEventListener(TimerEvent.TIMER, loadingTickHandler);
        loadingTimer.start();
    }

    private function loadingTickHandler(e:TimerEvent):void {
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

        //Functie die Starling Sprite omzet naar BitmapData
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
