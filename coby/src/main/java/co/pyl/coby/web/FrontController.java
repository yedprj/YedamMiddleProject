package co.pyl.coby.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.BoardDelete;
import co.pyl.coby.board.BoardInsert;
import co.pyl.coby.board.BoardList;
import co.pyl.coby.board.BoardSelect;
import co.pyl.coby.board.BoardUpdate;
import co.pyl.coby.command.Home;
import co.pyl.coby.common.Command;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new Home());
		
		map.put("/boardList.do", new BoardList());
		map.put("/boardSelect.do", new BoardSelect());
		map.put("/boardInsert.do", new BoardInsert());
		map.put("/boardUpdate.do", new BoardUpdate());
		map.put("/boardDelete.do", new BoardDelete());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getServletPath();
		
		Command command = map.get(path);
		String viewPage = command.execute(request, response);
		
		if (!viewPage.endsWith(".do")) {	//Tiles
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles";	// ex) home/home
			} else {	//Tiles
				viewPage = "WEB-INF/views/"+ viewPage;	//ex) home/home.jsp 
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
