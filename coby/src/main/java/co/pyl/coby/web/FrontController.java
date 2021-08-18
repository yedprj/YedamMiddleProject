package co.pyl.coby.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.command.BoardDelete;
import co.pyl.coby.board.command.BoardInsert;
import co.pyl.coby.board.command.BoardList;
import co.pyl.coby.board.command.BoardSelect;
import co.pyl.coby.board.command.BoardUpdate;
import co.pyl.coby.board.command.CmtDelete;
import co.pyl.coby.command.Home;
import co.pyl.coby.command.IdCheck;
import co.pyl.coby.command.Login;
import co.pyl.coby.command.Logout;
import co.pyl.coby.command.SignUp;
import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.command.PurchaseForm;
import co.pyl.coby.purchase.command.PurchaseInsert;
import co.pyl.coby.purchase.command.PurchaseList;

import co.pyl.coby.login.command.LoginForm;
import co.pyl.coby.login.command.SignUpForm;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {

		map.put("/home.do", new Home()); // 메인화면

		// 로그인, 회원가입, 아이디,비밀번호 찾기, api 회원가입, api로그인
		map.put("/login.do", new Login()); // 로그인
		map.put("/loginForm.do", new LoginForm());
		map.put("/signUpForm.do", new SignUpForm());
		map.put("/logout.do", new Logout()); // 로그아웃
		map.put("/signUp.do", new SignUp()); // 회원가입
		map.put("/idCheck.do", new IdCheck()); // 아이디 중복 체크

		map.put("/boardList.do", new BoardList());
		map.put("/boardSelect.do", new BoardSelect());
		map.put("/boardInsert.do", new BoardInsert());
		map.put("/boardUpdate.do", new BoardUpdate());
		map.put("/boardDelete.do", new BoardDelete());
		map.put("/cmtDelete.do", new CmtDelete());

		// 공동구매
		map.put("/purchaseList.do", new PurchaseList()); // 공동구매글 리스트 보기
		map.put("/purchaseForm.do", new PurchaseForm()); // 공동구매글 작성 폼 으로 가기
		map.put("/purchaseInsert.do", new PurchaseInsert()); // 공동구매글 등록 하기
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String path = request.getServletPath();

		Command command = map.get(path);
		String viewPage = command.execute(request, response);

		if (!viewPage.endsWith(".do")) { // Tiles 사용
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles"; // ex) home/home
			} else { // Tiles 안 사용
				viewPage = "WEB-INF/views/" + viewPage; // ex) home/home.jsp
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
