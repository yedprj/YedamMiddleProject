package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;

public class Logout implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO ๋ก๊ทธ์์
		HttpSession session = request.getSession();
		session.invalidate();
		return "home.do";
	}

}
