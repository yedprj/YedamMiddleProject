package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class WishListDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.getParameterMap();
		
		return "";
	}

}
