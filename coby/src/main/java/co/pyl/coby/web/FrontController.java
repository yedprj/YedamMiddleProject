package co.pyl.coby.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.command.Home;
import co.pyl.coby.common.Command;
import co.pyl.coby.mypage.command.MyPage;
import co.pyl.coby.mypage.command.Practice;
import co.pyl.coby.mypage.command.UpdateUserForm;
import co.pyl.coby.mypage.command.WishList;
import co.pyl.coby.mypage.command.deleteUserForm;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
       

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new Home());
		
		//메인페이지 관련
		map.put("/myPage.do", new MyPage());
		map.put("/wishList.do", new WishList());
		map.put("/updateUserForm.do", new UpdateUserForm());
		map.put("/deleteUserForm.do", new deleteUserForm());
		map.put("/practice.do", new Practice());
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getServletPath();
		
		Command command = map.get(path);
		
		String viewPage = command.execute(request, response);
		
		if (!viewPage.endsWith(".do")) {	//Tiles 사용
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles";	// ex) home/home
			} else {	//Tiles 안 사용
				viewPage = "WEB-INF/views/"+ viewPage;	//ex) home/home.jsp 
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
