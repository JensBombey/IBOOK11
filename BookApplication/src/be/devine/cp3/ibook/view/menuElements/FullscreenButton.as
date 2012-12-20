/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 19/12/12
 * Time: 21:45
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import flash.display.StageDisplayState;

import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class FullscreenButton extends Sprite {

    private var fullscreenButton:Image;
    private var fullscreenOffButton:Image;
    [Embed(source="/assets/design/fullscreen.png")] private static const Fullscreen:Class;
    [Embed(source="/assets/design/fullscreenOff.png")] private static const FullscreenOff:Class;

    public function FullscreenButton() {

        var texture:starling.textures.Texture = starling.textures.Texture.fromBitmap(new Fullscreen());
        fullscreenButton = new Image(texture);
        var texture2:starling.textures.Texture = starling.textures.Texture.fromBitmap(new FullscreenOff());
        fullscreenOffButton = new Image(texture2);
        this.addChild(fullscreenButton);
        this.addChild(fullscreenOffButton);
        //trace("NATHALIE IS LELIJK");
        fullscreenOffButton.alpha = 0;

        this.addEventListener(TouchEvent.TOUCH, onTouch);

    }

    private function onTouch(te:TouchEvent):void {

        if (te.getTouch(this, TouchPhase.ENDED))
        {

           if (Starling.current.nativeStage.displayState !== StageDisplayState.FULL_SCREEN_INTERACTIVE)
           {
               Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

               fullscreenButton.alpha = 0;
               fullscreenOffButton.alpha = 1;

           }else
           {
               Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
               fullscreenButton.alpha = 1;
               fullscreenOffButton.alpha = 0;
           }
        }
    }


}
}
