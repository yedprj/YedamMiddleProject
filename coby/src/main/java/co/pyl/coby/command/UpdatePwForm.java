package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class UpdatePwForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 비밀번호 찾기 폼으로
		String userId = request.getParameter("userId");
		request.setAttribute("id", userId);
		return "login/updatePwForm.jsp";
	}

}
