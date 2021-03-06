package co.pyl.coby.mypage.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;
import co.pyl.coby.wishlist.vo.WishListVO;

@WebServlet("/WishListDeleteServlet")
public class WishListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WishListService dao = new WishListServiceImpl();
		
		WishListVO vo = new WishListVO();
		
		vo.setWNo(Integer.parseInt(request.getParameter("id")));
		
		System.out.println(Integer.parseInt(request.getParameter("id")));
		
		response.getWriter().print(dao.deleteWishList(vo));
		
		System.out.println(dao.deleteWishList(vo));
		
	}

}
