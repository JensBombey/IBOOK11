/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.display.Sprite;

public class IBook extends Sprite{

    private var appModel:AppModel;

    public function IBook() {

        appModel = AppModel.getInstance();

        appModel.load("assets/book.xml");
    }
}
}
