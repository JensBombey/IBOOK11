/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 16/12/12
 * Time: 14:05
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.menuElements {
import flash.geom.Rectangle;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.Sprite;

public class ThumbsContainer extends Sprite{
    public function ThumbsContainer() {

    }


    public override function render(support:RenderSupport, alpha:Number):void
    {
        support.finishQuadBatch();

        Starling.context.setScissorRectangle(new Rectangle(140,0,854,133));
        super.render(support,alpha);
        support.finishQuadBatch();
        Starling.context.setScissorRectangle(null);
    }
}
}
