package test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.board.dao.BoardDao;
import co.mask.board.vo.BoardVo;
import co.mask.common.Command;

public class reply implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		//게시글 수정 
		vo.setBoardNumber(Integer.parseInt(request.getParameter("row")));
		vo.setReply(request.getParameter("reply"));
		
		
		dao.boardUpdateReply(vo);
		
		
		
		
		return "sellBoard.do";
	
	}

}
