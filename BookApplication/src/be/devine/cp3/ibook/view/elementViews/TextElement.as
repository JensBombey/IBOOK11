/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elementViews {
import be.devine.cp3.ibook.style.Style;
import be.devine.cp3.ibook.vo.TextVO;

import starling.text.TextField;

public class TextElement extends Element{
    public function TextElement(textVO:TextVO) {
        super(textVO);

        var paragraaf:TextField = new TextField(392,421,textVO.content,Style.FONT,14,0x656565);
        addChild(paragraaf);

    }
}
}
