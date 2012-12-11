/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 14:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageTextVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitleSubtitleVO;
import be.devine.cp3.ibook.vo.TitleTextVO;

public class ElementVOFactory {

    public static function createFromXML(elementXML:XML):ElementVO{

        switch("" + elementXML.@type){
            case "titleSubtitle":
                return createTitleSubtitleElementVO(elementXML);
                break;
            case "titleText":
                return createTitleTextElementVO(elementXML);
                break;
            case "image":
                return createImageElementVO(elementXML);
                break;
            case "text":
                return createTextElementVO(elementXML);
                break;
            case "imageText":
                return createImageTextElementVO(elementXML);
                break;
        }


        return null;
    }



    private static function createTitleSubtitleElementVO(elementXML:XML):TitleSubtitleVO{

        var elementVO:TitleSubtitleVO = new TitleSubtitleVO(elementXML);

        return elementVO;

    }

    private static function createTitleTextElementVO(elementXML:XML):TitleTextVO{

        var elementVO:TitleTextVO = new TitleTextVO(elementXML);

        return elementVO;

    }

    private static function createImageElementVO(elementXML:XML):ImageVO{

        var elementVO:ImageVO = new ImageVO(elementXML);

        return elementVO;

    }
    private static function createTextElementVO(elementXML:XML):TextVO {
        var elementVO:TextVO = new TextVO(elementXML);

        return elementVO;
    }
    private static function createImageTextElementVO(elementXML:XML):ImageTextVO {
        var elementVO:ImageTextVO = new ImageTextVO(elementXML);

        return elementVO;
    }
}
}
