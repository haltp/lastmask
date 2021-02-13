package co.mask.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.board.vo.BoardVo;
import co.mask.board.dao.BoardDao;
import co.mask.common.Command;

public class BoardDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		vo.setBoardNumber(Integer.parseInt(request.getParameter("row")));
		
		dao.deleteBoard(vo);
		
		String viewPage="";
		
		System.out.println(request.getParameter("row2"));
		
		if("notice".equals(request.getParameter("row2"))) {
			viewPage="adminBoard.do";
		}
		
		else if("notice".equals(request.getParameter("boardValue2"))  ) {
			viewPage="showBoardTest.do";
			//viewPage="view/test/boardList";
		}
		
		else if("questions".equals(request.getParameter("boardValue2")) ) {
			viewPage="showBoardTest2.do";
		}
		
		
		return viewPage;
	}

}
