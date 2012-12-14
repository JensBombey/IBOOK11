package {

import be.devine.cp3.ibook.Application;
import be.devine.cp3.ibook.model.AppModel;

import flash.display.Screen;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.Rectangle;
import flash.text.TextField;

import starling.core.Starling;
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


}
}
