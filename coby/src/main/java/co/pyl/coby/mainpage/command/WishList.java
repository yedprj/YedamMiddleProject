package co.pyl.coby.mainpage.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;

public class WishList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		WishListService dao = new WishListServiceImpl();
		System.out.println(1);
		UserVO vo = new UserVO();
		//이 부분은 세션으로 세팅하든지 해야한다
		vo.setUserId("user1");
		System.out.println(2);
		List<Map<String, String>> list = dao.selectWishList(vo);
		String what = (list.get(0)).get("1");
		System.out.println(3);
		System.out.println(what);
		request.setAttribute("list", list);
		System.out.println(4);
		
		return "";
	}

}
