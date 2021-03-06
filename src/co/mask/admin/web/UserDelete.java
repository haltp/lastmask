package co.mask.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.common.Command;
import co.mask.member.dao.AdminDao;
import co.mask.member.vo.MemberVo;

public class UserDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원 삭제
		AdminDao dao = new AdminDao();
		MemberVo vo = new MemberVo();
		vo.setMemberId(request.getParameter("row"));

		int n = dao.delete(vo);

		String viewPage = null;
		if(n != 0) {
			viewPage = "adminUserForm.do";
		}else {
			viewPage = "view/admin/userDeleteFail";
		}
		
		return viewPage;
	}

}
