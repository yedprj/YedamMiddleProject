package co.pyl.coby.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class AdminHome implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO ADMIN 홈으로
		return "admin/adminHome.jsp";
	}

}
