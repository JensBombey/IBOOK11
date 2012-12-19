/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 04/12/12
 * Time: 18:02
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class TitleTextVO extends ElementVO{

    public var title:String;
    public var paragraafEen:String;
    public var paragaraafTwee:String;
    public var tfontSize:uint;
    public var subtitle:String;
    public var info:String;

    public function TitleTextVO (elementXML:XML) {

        paragraafEen = elementXML.paragraph[0];
        trace("p1  = " + paragraafEen);
        paragaraafTwee = elementXML.paragraph[1];
        trace("p2 = " + paragaraafTwee);
        subtitle = elementXML.subTitle;
        title = elementXML.title;
        tfontSize = elementXML.title.@fontSize;
        info = elementXML.info;

    }
}
}
