package co.pyl.coby.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class LoginForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 폼으로
		return "login/loginForm";
	}

}
