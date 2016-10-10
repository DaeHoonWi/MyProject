package order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import order.service.OrderData;
import order.service.OrderService;

public class OrderListHandler implements CommandHandler {

	private OrderService orderService = new OrderService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String reqId = req.getParameter("id");
		String id = null;
		if(reqId != null){
			id = reqId;
		}	
		OrderData orderData = orderService.getOrder(id);
		req.setAttribute("orderData", orderData);
		
		return "/WEB-INF/view/listOrder.jsp";
	}	
}
