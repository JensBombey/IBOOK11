/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 04/12/12
 * Time: 18:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo {
public class ImageVO extends ElementVO{

    public var imagePath:String;
    public function ImageVO(elementXML:XML) {

        imagePath = elementXML.photo;
    }
}
}
