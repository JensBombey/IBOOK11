/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.Elements {
import be.devine.cp3.ibook.vo.ElementVO;

import starling.display.Sprite;

public class Element extends Sprite {
    protected var _elementVO:ElementVO;

    public function Element(elementVO:ElementVO) {
        _elementVO = elementVO;
    }
}
}
