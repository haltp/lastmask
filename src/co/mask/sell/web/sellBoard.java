package co.mask.sell.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.mask.board.dao.BoardDao;
import co.mask.board.vo.BoardVo;
import co.mask.common.Command;

public class sellBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		HttpSession session = request.getSession();
		
		vo.setProductseller((String) session.getAttribute("memberId"));
		
		list = dao.selectListSell(vo);
		request.setAttribute("list", list);
		
		
		
		//if (memId == )
		
		return "view/admin/adminBoard";
	}

}
