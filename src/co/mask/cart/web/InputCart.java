package co.mask.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mask.cart.dao.CartDao;
import co.mask.cart.vo.CartVo;
import co.mask.common.Command;
import co.mask.product.dao.ProductDao;
import co.mask.product.vo.ProductVo;

public class InputCart implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// InputCart.do 처리 메소드
		CartDao dao = new CartDao();
		CartVo vo = new CartVo();
		
		//재고 수량 감소
		ProductDao pDao = new ProductDao();
		ProductVo pVo = new ProductVo();
		
		
		HttpSession session = request.getSession();
		/*
		 * System.out.println((String) session.getAttribute("memberId"));
		 * System.out.println(request.getParameter("amount"));
		 * System.out.println(Integer.parseInt(request.getParameter("productNum")));
		 */
		
		String viewPage = "";
		
		if((String) session.getAttribute("memberId") == null) {
			viewPage = "loginForm.do";
		}
		
		else {
			//input cart
			vo.setCartUser((String) session.getAttribute("memberId"));
			vo.setCartSelect(Integer.parseInt(request.getParameter("amount")));
			vo.setCartProduct(Integer.parseInt(request.getParameter("productNum")));
			
		
			dao.insert(vo);
			request.setAttribute("vo", vo);
			
			//재고 수량 감소
			pVo.setAmount(Integer.parseInt(request.getParameter("amount")));
			pVo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
			pDao.amountMinus(pVo);
			request.setAttribute("pVo", pVo);
			
			viewPage = "cartView.do";
			
		}
		
		
	
		
		//return "view/product/showListForm";
		return viewPage;
	}

}
