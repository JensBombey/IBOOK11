/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 06/12/12
 * Time: 17:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class TextVO extends ElementVO{

    public var paragraafEen:String;
    public var paragraafTwee:String;
    public var infoBoven:String;
    public var infoOnder:String;

    public function TextVO(elementXML:XML) {
        paragraafEen = elementXML.paragraph[0];
        paragraafTwee = elementXML.paragraph[1];
        infoBoven = elementXML.infoBoven;
        infoOnder = elementXML.infoOnder;
    }
}
}
