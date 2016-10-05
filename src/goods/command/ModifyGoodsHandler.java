package goods.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import goods.model.Goods;
import goods.service.GoodsNotFoundException;
import goods.service.ModifyGoodsService;
import goods.service.ModifyRequest;
import goods.service.ReadGoodsService;
import mvc.command.CommandHandler;

public class ModifyGoodsHandler implements CommandHandler{

	private static final String FORM_VIEW = "/WEB-INF/view/modifyGoodsForm.jsp";
	
	private ModifyGoodsService modifyService = new ModifyGoodsService();
	private ReadGoodsService readGoods = new ReadGoodsService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")){
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		try{
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			Goods goods = readGoods.getGoods(no);

			ModifyRequest modReq = new ModifyRequest(goods.getGoodscode(), goods.getGoodsamount(), goods.getUnitprice(), goods.getGoodsname(), goods.getSeperator(), goods.getComment());
			
			req.setAttribute("modReq", modReq);
			return FORM_VIEW;			
		} catch (GoodsNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);
		
		ModifyRequest modReq = new ModifyRequest(no, Integer.parseInt(req.getParameter("goodsamount")), 
												Integer.parseInt(req.getParameter("unitprice")), req.getParameter("goodsname"), 
												req.getParameter("seperator"), req.getParameter("comment"));
		req.setAttribute("modReq", modReq);
		
		try{
			modifyService.modify(modReq);
			return "/WEB-INF/view/modifyGoodsSuccess.jsp";
		} catch (GoodsNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
}
