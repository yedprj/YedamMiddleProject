package co.pyl.coby.login.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.login.command.LoginForm;


@WebServlet("*.lo")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
       
    public LoginController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map.put("/loginForm.lo", new LoginForm());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getServletPath();
		
		Command command = map.get(path);
		String viewPage = command.execute(request, response);
		
		if (!viewPage.endsWith(".lo")) {
			viewPage = "WEB-INF/views/" + viewPage + ".jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
