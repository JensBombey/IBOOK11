/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 22:50
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;

public class PageContainer extends Sprite{

    private var appmodel:AppModel;
    private var pages:Vector.<PageVO>;
    private var currentPage:Page;
    private var currentPageIndex:uint;
    private var container:Sprite;
    private var bg:starling.display.Quad;
    private var menu:Menu;
    private var menuAdded:Boolean = false;

    public function PageContainer() {
        trace("[PAGECONTAINER CONSTRUCT]");
        appmodel = AppModel.getInstance();
        appmodel.addEventListener(AppModel.PAGE_INDEX_CHANGED, pageIndexChangedHandler);
        currentPageIndex = appmodel.pageIndex = 0;

        container = new Sprite();
        this.addChild(container);

        showPages();


        menu = new Menu();
        this.addChild(menu);
        menu.x = 29;
        menu.y = 597;
        menuAdded = true;
    }

    // METHODS
    private function showPages():void{
        trace("[PAGECONTAINER] Showpages function");
        container.removeChildren();
        container.dispose();



        bg = new Quad(964,624,0xffffff);
        bg.x = appmodel.appWidth/2 - bg.width/2;
        bg.y = appmodel.appHeight/2 - bg.height/2;
        container.addChild(bg);

        pages = appmodel.pages;
        currentPage = new Page(pages[currentPageIndex]);
        if(menuAdded)
        {
            menu.indicator.textfield.text = currentPageIndex + 1 + "";
        }
        container.addChild(currentPage);


    }

    private function pageIndexChangedHandler(e:Event):void{
        // telkens als de pagina verandert de showPages functie aanroepen --> verwijdert de huidige pagina en voegt de nieuwe toe adhv currentPageIndex
        currentPageIndex = appmodel.pageIndex;
        showPages();


    }
}
}
