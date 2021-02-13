package co.mask.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.cart.dao.CartDao;
import co.mask.cart.vo.CartVo;
import co.mask.common.Command;
import co.mask.product.dao.ProductDao;
import co.mask.product.vo.ProductVo;

public class CartDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 장바구니 삭제
		CartDao dao = new CartDao();
		CartVo vo = new CartVo();
		vo.setCartNumber(Integer.parseInt(request.getParameter("cartNumber")));
		
		dao.delete(vo);
		
		//재고수량 증가
		ProductDao pDao = new ProductDao();
		ProductVo pVo = new ProductVo();
		
		pVo.setAmount(Integer.parseInt(request.getParameter("cartSelect")));
		pVo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
		pDao.amountPlus(pVo);
		
		
		return "cartView.do";
	}

}
