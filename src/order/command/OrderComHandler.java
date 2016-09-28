package order.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import mvc.command.CommandHandler;
import order.service.OrderRequest;
import order.service.OrderService;

public class OrderComHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/orderComFail.jsp";
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
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		User user = (User)req.getSession(false).getAttribute("authUser");
		OrderRequest orderReq = createOrderRequest(user, req); 
		orderReq.validate(errors);
		
		if(!errors.isEmpty()){
			return FORM_VIEW;
		}
		
		int newOrderNo = orderService.write(orderReq);
		req.setAttribute("newOrderNo", newOrderNo);
		
		return "/WEB-INF/view/orderComSuccess.jsp";
	}
	
	private OrderRequest createOrderRequest(User user, HttpServletRequest req){
		return new OrderRequest(user.getId(),
				Integer.parseInt(req.getParameter("extendedprice")),
				Integer.parseInt(req.getParameter("goodscode")),
				Integer.parseInt(req.getParameter("orderamount")),
				Integer.parseInt(req.getParameter("orderprice")),
				req.getParameter("destination"));
	}

}
