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
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextElement extends Element{
    public function TextElement(textVO:TextVO) {
        super(textVO);


        var infoBoven:TextField = new TextField(392,16,textVO.infoBoven,Style.FONT,12,0x656565);
        infoBoven.hAlign = HAlign.LEFT;
        infoBoven.vAlign = VAlign.TOP;
        infoBoven.y = infoBoven.height + 20;
        addChild(infoBoven);

        var infoOnder:TextField = new TextField(392,16,textVO.infoOnder,Style.FONT,12,0x656565);
        infoOnder.hAlign = HAlign.RIGHT;
        infoOnder.vAlign = VAlign.TOP;
        addChild(infoOnder);

        var paragraafEen:TextField = new TextField(392,421,textVO.paragraafEen,Style.FONT,14,0x656565);
        paragraafEen.hAlign = HAlign.LEFT;
        paragraafEen.vAlign = VAlign.TOP;
        paragraafEen.y = infoBoven.y + 40;
        addChild(paragraafEen);

        infoBoven.x = paragraafEen.x;

        var paragraafTwee:TextField = new TextField(392,421,textVO.paragraafTwee,Style.FONT,14,0x656565);
        paragraafTwee.hAlign = HAlign.LEFT;
        paragraafTwee.vAlign = VAlign.TOP;
        paragraafTwee.x = paragraafEen.width + 40;
        paragraafTwee.y = paragraafEen.y;
        addChild(paragraafTwee);

        infoOnder.x = paragraafTwee.x;
        infoOnder.y = paragraafTwee.height + infoOnder.height + 40;
    }
}
}
