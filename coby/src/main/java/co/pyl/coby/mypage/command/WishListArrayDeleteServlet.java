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


@WebServlet("/WishListArrayDeleteServlet")
public class WishListArrayDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public WishListArrayDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arr = request.getParameterValues("arr");
		
		String[] newAry = arr[0].replace("[", "").replace("]", "").replace("\"", "").split(",");
		
		int sum = 0;
		
		WishListVO vo = new WishListVO();
		
		WishListService dao = new WishListServiceImpl();
		
		for (String i : newAry) {
			vo.setWNo(Integer.parseInt(i));
			int r = dao.deleteWishList(vo);
			sum += r;
		}
		
		response.getWriter().print(sum);
		
	}

}
