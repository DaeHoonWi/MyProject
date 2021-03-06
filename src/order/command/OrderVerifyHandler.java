package order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import order.service.OrderData;
import order.service.OrderService;

public class OrderVerifyHandler implements CommandHandler {

	private OrderService orderService = new OrderService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Integer ordercode = Integer.parseInt(req.getParameter("oc"));
		Integer oc = null;
		if(ordercode != null){
			oc = ordercode;
		}	
		OrderData orderData = orderService.getVerify(oc);
		req.setAttribute("orderData", orderData);
		
		return "/WEB-INF/view/verifyOrder.jsp";
	}

}
