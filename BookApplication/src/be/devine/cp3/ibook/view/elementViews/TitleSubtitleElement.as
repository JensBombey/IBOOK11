/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 23:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.elementViews {
import be.devine.cp3.ibook.Application;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.style.Style;
import be.devine.cp3.ibook.vo.TitleSubtitleVO;

import starling.text.TextField;

public class TitleSubtitleElement extends Element {

    public function TitleSubtitleElement(titleSubtitleVo:TitleSubtitleVO) {
        super(titleSubtitleVo);

/*
        var fontSize:String = titleSubtitleVo.title.@fontSize;
*/
        trace(titleSubtitleVo.fontSize);

        var titel:TextField = new TextField(600,80,titleSubtitleVo.title,Style.FONT,titleSubtitleVo.fontSize,0x656565,true);
        addChild(titel);

        var subtitel:TextField = new TextField(200,40,titleSubtitleVo.subtitle,Style.FONT,14,0xe16565,true);
        subtitel.x = titel.x + 200;
        subtitel.y = titel.y + titel.height - 10;
        addChild(subtitel);
    }
}
}
