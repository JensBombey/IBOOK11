/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 14/12/12
 * Time: 00:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.view.Elements.ImageElement;
import be.devine.cp3.ibook.view.Elements.TitleSubtitleElement;
import be.devine.cp3.ibook.view.Elements.TitleTextElement;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.TitleSubtitleVO;
import be.devine.cp3.ibook.vo.TitleTextVO;

public class ElementViewFactory {
    public static function createElementFromVO(elementVO:ElementVO){
        if(elementVO is TitleSubtitleVO){
            trace("[ELEMENTVIEWFACTORY] titelsubtitelvo");
            return new TitleSubtitleElement(elementVO as TitleSubtitleVO);
        }
        if(elementVO is TitleTextVO){
            trace("[ELEMENTVIEWFACTORY] titeltextvo");
            return new TitleTextElement(elementVO as TitleTextVO);
        }
        if(elementVO is ImageVO){
            trace("[ELEMENTVIEWFACTORY] imageVo");
            return new ImageElement(elementVO as ImageVO);
        }
        return null;
    }
}
}
