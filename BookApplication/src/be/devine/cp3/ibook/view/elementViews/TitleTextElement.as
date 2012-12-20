/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elementViews {
import be.devine.cp3.ibook.style.Style;
import be.devine.cp3.ibook.vo.TitleTextVO;

import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;


public class TitleTextElement extends Element{
    public function TitleTextElement(titleTextVO:TitleTextVO) {
        super(titleTextVO);

        trace("[TitelTextElement]");

        var titel:TextField = new TextField(864,40,titleTextVO.title,Style.FONT,38,0x656565);
        titel.hAlign = HAlign.LEFT;
        addChild(titel);

        var subtitel:TextField = new TextField(864,16,titleTextVO.subtitle,Style.FONT,14,0xe16565);
        subtitel.hAlign = HAlign.LEFT;
        subtitel.italic = true;
        subtitel.y = titel.y + subtitel.height*3;
        addChild(subtitel);

        var paragraafEen:TextField = new TextField(392,421,titleTextVO.paragraafEen,Style.FONT,14,0x656565);
        paragraafEen.hAlign = HAlign.LEFT;
        paragraafEen.vAlign = VAlign.TOP;
        paragraafEen.y = subtitel.y + 40;
        addChild(paragraafEen);
        var paragraafTwee:TextField = new TextField(392,421,titleTextVO.paragaraafTwee,Style.FONT,14,0x656565);
        paragraafTwee.hAlign = HAlign.LEFT;
        paragraafTwee.vAlign = VAlign.TOP;
        paragraafTwee.x = paragraafEen.width + 40;
        paragraafTwee.y = paragraafEen.y;
        addChild(paragraafTwee);

        var info:TextField = new TextField(392,16,titleTextVO.info,Style.FONT,12,0x656565);
        info.hAlign = HAlign.RIGHT;
        info.vAlign = VAlign.TOP;
        info.x = paragraafTwee.x;
        info.y = 460 + info.height;
        addChild(info);
    }
}
}
