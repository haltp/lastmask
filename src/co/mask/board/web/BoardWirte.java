package co.mask.board.web;

import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.board.dao.BoardDao;
import co.mask.board.vo.BoardVo;
import co.mask.common.Command;

public class BoardWirte implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		
		//vo.setBoardNumber(Integer.parseInt(request.getParameter("boardnumber")));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardWriter(request.getParameter("boardWriter"));
		vo.setBoardContent(request.getParameter("boardContent"));
		vo.setBoardValue(request.getParameter("boardValue"));
		//vo.setBoardFile(request.getParameter("boardfile"));

		System.out.println(request.getParameter("boardValue"));
		
		dao.boardInsert(vo);
		
		String showPage=null;
		
		System.out.println(vo.getBoardValue());
		String str="notice";
		String str2=vo.getBoardValue();
		
		if(str2 == str) {
			showPage = "showBoardTest2.do";
			
		} else {
			
			showPage= "adminBoard.do";
		}
		
		return showPage;
		

	}

	
}
