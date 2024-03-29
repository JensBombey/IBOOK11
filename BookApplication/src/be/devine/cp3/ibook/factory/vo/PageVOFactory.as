/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 4/12/12
 * Time: 14:02
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factory.vo {
import be.devine.cp3.ibook.vo.PageVO;

public class PageVOFactory {
    public static function createPageVOFromXML(pageXML:XML, pageNumber:uint):PageVO
    {
        var pageVO:PageVO = new PageVO();
        for each(var elementXML:XML in pageXML.element){
            pageVO.element.push(ElementVOFactory.createFromXML(elementXML));
            pageVO.pageNumber = pageNumber;
        }
        trace("[PAGEVO FACTORY] paginanummer: " + pageVO.pageNumber);
        trace("[PAGEVO FACTORY] test:" + pageVO.element);
        return pageVO;
    }
}
}
