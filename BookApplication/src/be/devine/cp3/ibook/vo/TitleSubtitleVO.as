/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 14:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class TitleSubtitleVO extends ElementVO{

    public var title:String;
    public var fontSize:uint;
    public var subtitle:String;


    public function TitleSubtitleVO(elementXML:XML) {
        title = elementXML.title;
        fontSize = elementXML.title.@fontSize;
        subtitle = elementXML.subTitle;


    }
}
}
