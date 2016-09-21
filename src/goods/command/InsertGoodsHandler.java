package goods.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import goods.service.InsertGoodsService;
import goods.service.InsertReuqest;
import mvc.command.CommandHandler;

public class InsertGoodsHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/insertGoodsForm.jsp";
	private InsertGoodsService insertService = new InsertGoodsService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")){
			return processForm(req,res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res){
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		User user = (User)req.getSession(false).getAttribute("authUser"); //세션에서 로그인한 사용자 정보를 구한다.
		InsertReuqest insertReq = createGoodsRequest(user, req);
		insertReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		
		int newGoodsNo = insertService.write(insertReq);
		req.setAttribute("newGoodsNo", newGoodsNo);
		
		return "/WEB-INF/view/insertGoodsSuccess.jsp";
	}
	
	private InsertReuqest createGoodsRequest(User user, HttpServletRequest req){
		return new InsertReuqest(Integer.parseInt(req.getParameter("goodsamount")), 
						Integer.parseInt(req.getParameter("unitprice")), 
						req.getParameter("goodsname"), 
						req.getParameter("seperator"),
						req.getParameter("comment"));
	}
}
