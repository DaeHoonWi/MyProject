package goods.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.service.GoodsPage;
import goods.service.IndexService;
import goods.service.ListGoodsService;
import mvc.command.CommandHandler;

public class IndexHandler implements CommandHandler {

	private IndexService listService = new IndexService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if(pageNoVal != null){
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		GoodsPage bestPage = listService.getBestGoodsPage(pageNo);	
		req.setAttribute("bestPage", bestPage);
		
		GoodsPage winePage = listService.getWinePage(pageNo);	
		req.setAttribute("winePage", winePage);
		GoodsPage whiskyPage = listService.getWhiskyPage(pageNo);		
		req.setAttribute("whiskyPage", whiskyPage);
		GoodsPage brandyPage = listService.getBrandyPage(pageNo);		
		req.setAttribute("brandyPage", brandyPage);
		
		
		
		return "/index.jsp";
	}

}
