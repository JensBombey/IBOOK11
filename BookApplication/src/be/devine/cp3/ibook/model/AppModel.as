/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 25/11/12
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.model {
import be.devine.cp3.ibook.xmlParser.XMLParser;

import flash.events.Event;

import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher{

    private static var instance:AppModel;

    public static const XMLCHANGED:String = "xmlChanged";

    //=====CONSTRUCTOR=====
    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }

    }

    //=====APPMODEL IS A SINGLETON=====
    public static function getInstance():AppModel {
    if(instance == null) {
        instance = new AppModel(new Enforcer());
    }
    return instance;
    }

    //=====METHODS=====



}
}
internal class Enforcer{}