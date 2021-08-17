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
import co.pyl.coby.command.Login;
import co.pyl.coby.command.Logout;
import co.pyl.coby.common.Command;
import co.pyl.coby.login.command.LoginForm;
import co.pyl.coby.login.command.SignUpForm;


public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
       

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new Home());	// 메인화면
		
		// 로그인, 회원가입, 아이디,비밀번호 찾기, api 회원가입, api로그인
		map.put("/login.do", new Login());	 // 로그인
		map.put("/loginForm.do", new LoginForm());
		map.put("/signUpForm.do", new SignUpForm());
		map.put("/logout.do", new Logout());  // 로그아웃
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
