/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 16/12/12
 * Time: 21:30
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import starling.display.Quad;
import starling.display.Sprite;

public class Controls extends Sprite{

    private var BG:Quad = new Quad(115,115,0xffffff, true);
    private var bookmarkButton:BookmarkButton;
    private var fullscreenButton:FullscreenButton;

    public function Controls() {
        addChild(BG);
        BG.alpha = .01;
        bookmarkButton = new BookmarkButton();
        addChild(bookmarkButton);
        bookmarkButton.alpha = 1;
        bookmarkButton.x = 10;

        fullscreenButton = new FullscreenButton();
        addChild(fullscreenButton);
        fullscreenButton.x = 42;
        fullscreenButton.y = 87;
        fullscreenButton.scaleX = scaleY = .5;



    }
}
}
