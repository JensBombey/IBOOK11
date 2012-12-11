/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 06/12/12
 * Time: 17:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class TextVO extends ElementVO{

    public var content:String;

    public function TextVO(elementXML:XML) {
        content = elementXML.paragraph;
    }
}
}
