/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 04/12/12
 * Time: 18:02
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class TitleTextVO extends ElementVO{

    public var content:String;
    public var title:String;

    public function TitleTextVO (elementXML:XML) {

        content = elementXML.paragraph;
        title = elementXML.title;

    }
}
}
