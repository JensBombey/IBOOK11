/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 06/12/12
 * Time: 23:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.factory.vo.ElementViewFactory;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.Elements.Element;
import be.devine.cp3.ibook.view.Elements.TitleSubtitleElement;
import be.devine.cp3.ibook.view.Elements.TitleTextElement;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

import starling.display.Sprite;

public class Page extends Sprite{

    private var pageVO:PageVO;
    private var appModel:AppModel;
    public var pageNumber:int;

    public function Page(pageVO:PageVO) {
        this.appModel = AppModel.getInstance();
        this.pageVO = pageVO;
        this.pageNumber = pageVO.pageNumber;
        trace("[PAGE_CONSTRUCT]");

        for each(var elementVO:ElementVO in pageVO.element) {
            trace("[PAGE] elementen aanmaken en plaatsen");
            var element:Element = ElementViewFactory.createElementFromVO(elementVO);
            if(element!=null){
                if(element is TitleSubtitleElement){
                    element.x = appModel.appWidth/2 - element.width/2;
                    element.y = appModel.appHeight/2 - element.height/2;
                        /*titel.x = appmodel.appWidth/2 - titel.width/2;
                         titel.y = appmodel.appHeight/2 - titel.height/2;*/
                    trace("[PAGE] het is een titel subtitel element");
                }
                if(element is TitleTextElement){
                    element.x = 50;
                    element.y = 52;
                    trace("[PAGE] het is een titel en tekst element");
                }
                addChild(element);
            }

        }
    }
}
}
