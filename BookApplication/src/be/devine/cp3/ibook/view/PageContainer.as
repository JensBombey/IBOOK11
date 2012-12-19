/**
 * Created with IntelliJ IDEA.
 * User: Eve
 * Date: 13/12/12
 * Time: 22:50
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view {
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.pageElements.Bookmark;
import be.devine.cp3.ibook.vo.PageVO;

import com.greensock.TweenLite;

import flash.geom.Rectangle;

import starling.core.RenderSupport;
import starling.core.Starling;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;

public class PageContainer extends Sprite{

    private var appmodel:AppModel;
    private var pages:Vector.<PageVO>;
    private var currentPage:Page;
    private var tempPage:Page;
    private var currentPageIndex:uint;
    private var container:Sprite;
    private var bg:starling.display.Quad;
    private var menu:Menu;
    private var menuAdded:Boolean = false;
    private var bookmark:Bookmark;

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
        menu.y = 0;
        menuAdded = true;
    }

    public override function render(support:RenderSupport, alpha:Number):void
    {
        support.finishQuadBatch();
        Starling.context.setScissorRectangle(new Rectangle(30, 0, 934, 900));
        super.render(support,alpha);
        support.finishQuadBatch()
        Starling.context.setScissorRectangle(null);
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


        //Links of rechts plaatsen voor transitie
        if(appmodel.pageIndex > appmodel.prevPageIndex)
        {
            if(currentPageIndex<appmodel.pages.length)
            {
                currentPage.alpha = 0;
                tempPage = new Page(pages[currentPageIndex - 1]);
                container.addChild(tempPage);
                TweenLite.to(tempPage,.5, {x:-container.width, alpha:0});
                currentPage.x = container.width;
                TweenLite.to(currentPage,.5, {x:0, alpha:1});
            }
        }else if(appmodel.pageIndex < appmodel.prevPageIndex)
        {
            if(currentPageIndex>0)
            {
                currentPage.alpha = 0;
                tempPage = new Page(pages[currentPageIndex + 1]);
                container.addChild(tempPage);
                TweenLite.to(tempPage,.5, {x:+container.width, alpha:0});
                currentPage.x = -container.width;
                TweenLite.to(currentPage,.5, {x:0, alpha:1});
            }
        }


        trace("currentpage: " +currentPage);

        bookmark = new Bookmark(currentPageIndex);
        container.addChild(bookmark);
        bookmark.x = 40;
        bookmark.y = 60;
        if(currentPageIndex == appmodel.bookmarkIndex)
        {
            bookmark.active = true;
            bookmark.alpha = 1;
        }else{
            bookmark.active = false;
            bookmark.alpha = .25;
        }


    }

    private function pageIndexChangedHandler(e:Event):void{
        // telkens als de pagina verandert de showPages functie aanroepen --> verwijdert de huidige pagina en voegt de nieuwe toe adhv currentPageIndex

        currentPageIndex = appmodel.pageIndex;
        showPages();


    }
}
}
