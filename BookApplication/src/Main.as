package {

import be.devine.cp3.ibook.Application;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.text.TextField;

import starling.core.Starling;

public class Main extends Sprite {
    private var app:Sprite;
    private var starling:Starling;
    private var regular:Application;
    private var useStarling:Boolean = true;

    public function Main() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 800;
        stage.nativeWindow.height = 600;

        if(useStarling){
            starling = new Starling(Application, stage);
            starling.start();
        }else{
            regular = new Application();
            addChild(regular)
        }

    }
}
}
