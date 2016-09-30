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
		GoodsPage goodsPage = listService.getGoodsPage(pageNo, sep);
		req.setAttribute("goodsPage", goodsPage);
		return "/WEB-INF/view/listGoods.jsp";
	}

}
