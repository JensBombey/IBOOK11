/**
 * Created with IntelliJ IDEA.
 * User: jensbombey
 * Date: 06/12/12
 * Time: 23:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

import starling.display.Sprite;

public class Page extends Sprite{

    private var pageVO:PageVO;

    public function Page(pageVO:PageVO) {
        this.pageVO = pageVO;

        var yPos:uint = 0;
        for each(var elementVO:ElementVO in pageVO.element) {

            //TODO:Elementen overlopen en als textfield/image in de pagina plaatsen

        }
    }
}
}
