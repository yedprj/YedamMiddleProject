package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;

public class MyPage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		request.setAttribute("user", session.getAttribute("user"));
		
		return "mypage/myPage";
	}

}
