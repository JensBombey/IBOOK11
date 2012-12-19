/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 06/12/12
 * Time: 17:59
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class ImageTextVO extends ElementVO{

    public var titel:String;
    public var imagePath:String;
    public var paragraafEen:String;

    public function ImageTextVO(elementXML:XML) {
        titel = elementXML.title;
        imagePath = elementXML.photo;
        paragraafEen = elementXML.paragraph[0];
    }
}
}
