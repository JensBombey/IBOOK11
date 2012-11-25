package {

import be.devine.cp3.ibook.IBook;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.text.TextField;

public class BookApplication extends Sprite {
    private var app:Sprite;

    public function BookApplication() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 800;
        stage.nativeWindow.height = 600;

        app = new IBook();
        addChild(app);
    }
}
}
