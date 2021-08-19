package co.pyl.coby.mypage.command;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;

@WebServlet("/WishListServlet")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WishListService dao = new WishListServiceImpl();

		UserVO vo = new UserVO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		

		List<Map<String, String>> list = dao.selectWishList(vo);
		Gson gson = new GsonBuilder().create();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8");

		response.getWriter().print(gson.toJson(list));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
