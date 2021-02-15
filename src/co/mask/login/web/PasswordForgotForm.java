package co.mask.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.mask.common.Command;

public class PasswordForgotForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호 초기화 폼 호출
		return "view/login/passwordForgotForm";
	}

}
