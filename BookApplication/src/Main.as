package {

import be.devine.cp3.ibook.Application;
import be.devine.cp3.ibook.model.AppModel;

import flash.display.Screen;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;

import starling.core.Starling;
import starling.events.Event;
import starling.events.KeyboardEvent;

public class Main extends Sprite {
    private var app:Sprite;
    private var starling:Starling;
    private var regular:Application;
    private var useStarling:Boolean = true;

    public function Main() {


        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 1024;
        stage.nativeWindow.height = 768;

        stage.nativeWindow.bounds = new Rectangle(
                (Screen.mainScreen.bounds.width - stage.nativeWindow.width) *.5,
                (Screen.mainScreen.bounds.height - stage.nativeWindow.height) *.5,
                stage.nativeWindow.width,
                stage.nativeWindow.height
        );

        stage.nativeWindow.minSize = new Point(1024,768);

        stage.addEventListener(flash.events.Event.RESIZE, resizeHandler);
        startApplication();
    }

    private function startApplication():void{
        if(useStarling){
            starling = new Starling(Application, stage);
            AppModel.getInstance();
            AppModel.getInstance().appWidth = stage.stageWidth;
            AppModel.getInstance().appHeight = stage.stageHeight;
            starling.start();
        }else{
            /*
             regular = new Application();
             addChild(regular);*/
        }
    }

    private function resizeHandler(e:flash.events.Event):void{
            trace("[MAIN] resizeHandler");
        AppModel.getInstance().appHeight = stage.stageHeight;
        AppModel.getInstance().appWidth = stage.stageWidth;
        display();
    }

    private function display():void{
        var rectangle:Rectangle = new Rectangle(0,0,stage.stageWidth,stage.stageHeight);
        starling.viewPort = rectangle;
        starling.stage.stageWidth = stage.stageWidth;
        starling.stage.stageHeight = stage.stageHeight;
    }

}
}
