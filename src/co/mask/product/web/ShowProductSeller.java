package co.mask.product.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mask.common.Command;
import co.mask.product.dao.ProductDao;
import co.mask.product.vo.ProductVo;

public class ShowProductSeller implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//showProductSeller.do 처리 메소드
		ProductDao dao = new ProductDao();
		ProductVo vo = new ProductVo();
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();
		
		HttpSession session = request.getSession();
		String value = (String) session.getAttribute("memberId");
		vo.setMemberId(value);
		
		list=dao.selectList2(vo);
		request.setAttribute("list", list);
		
		return "view/product/ShowProductSellerForm";
	}

}
