package co.pyl.coby.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;
import co.pyl.coby.wishlist.vo.WishListVO;

@WebServlet("/WishListInsert")
public class WishListInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prNo = Integer.parseInt(request.getParameter("prNo"));
		System.out.println(prNo);
		
		HttpSession session = request.getSession();
		
		WishListVO vo = new WishListVO();
		vo.setPrNo(prNo);
		vo.setUserId((String) session.getAttribute("userId"));
		
		WishListService dao = new WishListServiceImpl();
		
		dao.insertWishList(vo);
		
	}

}
