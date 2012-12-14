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


public class TitleTextElement extends Element{
    public function TitleTextElement(titleTextVO:TitleTextVO) {
        super(titleTextVO);

        trace("[TitelTextElement]");

        var titel:TextField = new TextField(600,80,titleTextVO.title,Style.FONT,60,0x656565);
        addChild(titel);

        var paragraaf:TextField = new TextField(392,421,titleTextVO.content,Style.FONT,14,0x656565);
        addChild(paragraaf);
    }
}
}
