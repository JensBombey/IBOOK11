/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 14:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.TitleSubtitleVO;

public class ElementVOFactory {

    public static function createFromXML(elementXML:XML):ElementVO{

        switch("" + elementXML.@type){
            case "titelSubtitle":
                return createTitelSubtitleElementVO();
                break;
            case "titleText":
                break;
            case "image":
                break;
            case "text":
                break;
            case "imageText":
                break;
        }


        return null;
    }

    public static function createTitelSubtitleElementVO(elementXML:XML):TitleSubtitleVO{

        var elementVO:TitleSubtitleVO = new TitleSubtitleVO(elementXML);
        return elementVO;

    }
}
}
