package goods.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.model.Goods;
import goods.service.GoodsNotFoundException;
import goods.service.ReadGoodsService;
import mvc.command.CommandHandler;

public class ReadGoodsHandler implements CommandHandler {

	private ReadGoodsService readService = new ReadGoodsService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String noVal = req.getParameter("no");
		int goodsNum = Integer.parseInt(noVal);
		try {
			Goods goods = readService.getGoods(goodsNum);
			req.setAttribute("goods", goods);
			return "/WEB-INF/view/readGoods.jsp";
		} catch (GoodsNotFoundException e) {
			req.getServletContext().log("no goods", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
