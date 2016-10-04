package order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import order.model.Order;
import order.service.NotFoundedGoodsExcpetion;
import order.service.OrderService;

public class OrderHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/newOrderForm.jsp";
	private OrderService orderService = new OrderService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")){
			return processFrom(req, res);
		} else if(req.getMethod().equalsIgnoreCase("POST")){
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processFrom(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Integer goodscode = Integer.parseInt(req.getParameter("goodscode"));
		Integer orderamount = Integer.parseInt(req.getParameter("orderamount"));
		String goodsname = req.getParameter("goodsname");
		Integer unitprice = Integer.parseInt(req.getParameter("unitprice"));
		Integer orderprice = null;
		Integer extendedprice = null;
		String seperator = req.getParameter("seperator");
		
		try{
			Order order = orderService.save(goodscode, orderamount, goodsname, unitprice, orderprice, extendedprice, seperator);
			req.getSession().setAttribute("savedGoods", order);
			res.sendRedirect(req.getContextPath() + "/order/wish.do");
			return null;
		} catch (NotFoundedGoodsExcpetion e) {
			return FORM_VIEW;
		}
	}
}
