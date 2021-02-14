package co.mask.cart.web;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mask.cart.dao.CartDao;
import co.mask.cart.vo.CartVo;
import co.mask.common.Command;

public class BootPay implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 부트페이 결제 시스템
		CartDao dao = new CartDao();
		CartVo vo = new CartVo();
		
		HttpSession session = request.getSession();
		vo.setCartProduct(Integer.parseInt(request.getParameter("productNum")));
		
		vo.setCartUser((String) session.getAttribute("memberId"));
		vo.setCartNumber(Integer.parseInt(request.getParameter("cartNumber")));
		vo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
		
		//System.out.println(vo.getCartProduct());
		//System.out.println(vo.getCartUser());
		
		dao.select(vo);
		request.setAttribute("vo", vo);
		
		return "view/cart/bootPay";
	}

}

