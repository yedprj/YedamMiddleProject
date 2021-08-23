package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;
import co.pyl.coby.wishlist.vo.WishListVO;

public class WishListConfirm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String userId = request.getParameter("userId");
		int prNo = Integer.parseInt(request.getParameter("prNo"));
		
		WishListVO vo = new WishListVO();
		WishListVO apNoExist = new WishListVO();
		
		vo.setUserId(userId);
		vo.setPrNo(prNo);
		
		WishListService dao = new WishListServiceImpl();
		
		apNoExist = dao.wishListConfirm(vo);
		
		System.out.println(apNoExist);
		
		if (apNoExist != null) {
			request.setAttribute("message", "데이터있음");
		} else {
			request.setAttribute("message", "데이터없음");
		}
		
		return "mypage/message.jsp";
	}

}
