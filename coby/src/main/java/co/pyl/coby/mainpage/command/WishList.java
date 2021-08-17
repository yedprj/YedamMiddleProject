package co.pyl.coby.mainpage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class WishList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		return "mypage/wishlist";
	}

}
