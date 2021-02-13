package co.mask.cart.web;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mask.cart.dao.CartDao;
import co.mask.cart.vo.CartVo;
import co.mask.common.Command;

public class BootPayImm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 부트페이 결제 시스템
		CartDao dao = new CartDao();
		CartVo vo = new CartVo();
		
		HttpSession session = request.getSession();
		
		String viewPage = "";
		
		if((String) session.getAttribute("memberId") == null) {
			viewPage = "loginForm.do";
//			System.out.println((String) session.getAttribute("memberId"));
//			System.out.println(request.getParameter("amount"));
//			System.out.println(Integer.parseInt(request.getParameter("productNum")));
//			System.out.println(Integer.parseInt(request.getParameter("productPrice")));
//			System.out.println(request.getParameter("productName"));
		}
		
		else {

			System.out.println((String) session.getAttribute("memberId"));
			System.out.println(request.getParameter("amount"));
			System.out.println(Integer.parseInt(request.getParameter("productNum")));
			System.out.println(Integer.parseInt(request.getParameter("productPrice")));
			//System.out.println(request.getParameter("productName"));
			
			
			
			  vo.setCartUser((String) session.getAttribute("memberId"));
			  vo.setCartSelect(Integer.parseInt(request.getParameter("amount")));
			  vo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
			  //vo.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
			  
			  //System.out.println(vo.getCartProduct());
			  
			  dao.selectImm(vo);
			  
			  
			  
			  //vo.setCartProduct(Integer.parseInt(request.getParameter("productNum")));
			 // System.out.println(vo.getCartProduct()); dao.select(vo);
			  request.setAttribute("vo", vo); 
			  //System.out.println(vo.getCartProduct());
			  
			 
			  viewPage = "view/cart/bootPayImm";
			 
			
		}
		
		
	
		
		
		return viewPage;
		
		
		
	}

}

