package co.mask.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.board.dao.BoardDao;
import co.mask.board.vo.BoardVo;
import co.mask.common.Command;

public class BoardUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		//게시글 수정 
		vo.setBoardNumber(Integer.parseInt(request.getParameter("row")));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContent(request.getParameter("boardContent"));
		
		
		dao.boardUpdate(vo);
		
		String viewPage="";
		
		if("notice".equals(request.getParameter("boardValue"))) {
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
