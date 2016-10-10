package goods.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.service.GoodsPage;
import goods.service.ListGoodsService;
import mvc.command.CommandHandler;

public class ListGoodsHandler implements CommandHandler {

	private ListGoodsService listService = new ListGoodsService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String sep=req.getParameter("sep");
		
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if(pageNoVal != null){
			pageNo = Integer.parseInt(pageNoVal);
		}
		GoodsPage BestGoodsPage = listService.getGoodsPage(pageNo, sep, 5);		//판매량기준 best5 : 판매량 역순 추출, 위에서 5개 단위로 페이지 구분.
		req.setAttribute("BestGoodsPage", BestGoodsPage);
		GoodsPage goodsPage = listService.getGoodsPage(pageNo, sep, 20);		//판매량기준 역순, 20개 단위로 페이지 구분.
		req.setAttribute("goodsPage", goodsPage);
		return "/WEB-INF/view/listGoods.jsp";
	}

}
