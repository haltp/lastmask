package co.mask.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.common.Command;
import co.mask.member.dao.MemberDao;
import co.mask.member.vo.MemberVo;

public class PasswordReset implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호 리셋
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo.setMemberPassword(request.getParameter("memberPassword"));
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberName(request.getParameter("memberName"));
		vo.setMemberPhone(request.getParameter("memberPhone"));
		vo.setMemberEmail(request.getParameter("memberEmail"));	

		int n = dao.passwordReset(vo);

		String viewPage = null;
		if (n != 0) {
			viewPage = "loginForm.do";
		} else {
			viewPage = "view/login/passwordResetFail";
		}

		return viewPage;
	}
		
}
