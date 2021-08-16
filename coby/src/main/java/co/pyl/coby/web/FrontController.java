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
import co.pyl.coby.board.BoardSelect;
import co.pyl.coby.board.BoardList;
import co.pyl.coby.board.BoardUpdate;
import co.pyl.coby.cmt.CmtDelete;
import co.pyl.coby.cmt.CmtInsert;
import co.pyl.coby.cmt.CmtSelect;
import co.pyl.coby.cmt.CmtList;
import co.pyl.coby.cmt.CmtUpdate;
import co.pyl.coby.cmts.CmtsDelete;
import co.pyl.coby.cmts.CmtsInsert;
import co.pyl.coby.cmts.CmtsSelect;
import co.pyl.coby.cmts.CmtsList;
import co.pyl.coby.cmts.CmtsUpdate;
import co.pyl.coby.command.Home;
import co.pyl.coby.common.Command;
import co.pyl.coby.cs.CsDelete;
import co.pyl.coby.cs.CsInsert;
import co.pyl.coby.cs.CsSelect;
import co.pyl.coby.cs.CsList;
import co.pyl.coby.cs.CsUpdate;
import co.pyl.coby.cscmt.CscmtDelete;
import co.pyl.coby.cscmt.CscmtInsert;
import co.pyl.coby.cscmt.CscmtSelect;
import co.pyl.coby.cscmt.CscmtList;
import co.pyl.coby.cscmt.CscmtUpdate;
import co.pyl.coby.notice.NoticeDelete;
import co.pyl.coby.notice.NoticeInsert;
import co.pyl.coby.notice.NoticeSelect;
import co.pyl.coby.notice.NoticeList;
import co.pyl.coby.notice.NoticeUpdate;


public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
       

    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new Home());
		
		//커뮤니티
		map.put("/boardList.do", new BoardList());
		map.put("/boardSelect.do", new BoardSelect());
		map.put("/boardInsert.do", new BoardInsert());
		map.put("/boardUpdate.do", new BoardUpdate());
		map.put("/boardDelete.do", new BoardDelete());
		
		//댓글
		map.put("/cmtList.do", new CmtList());
		map.put("/cmtSelect.do", new CmtSelect());
		map.put("/cmtInsert.do", new CmtInsert());
		map.put("/cmtUpdate.do", new CmtUpdate());
		map.put("/cmtDelete.do", new CmtDelete());	
		
		//대댓글
		map.put("/cmtsList.do", new CmtsList());
		map.put("/cmtsSelect.do", new CmtsSelect());
		map.put("/cmtsInsert.do", new CmtsInsert());
		map.put("/cmtsUpdate.do", new CmtsUpdate());
		map.put("/cmtsDelete.do", new CmtsDelete());	
		
		//공지사항
		map.put("/noticeList.do", new NoticeList());
		map.put("/noticeSelect.do", new NoticeSelect());
		map.put("/noticeInsert.do", new NoticeInsert());
		map.put("/noticeUpdate.do", new NoticeUpdate());
		map.put("/noticeDelete.do", new NoticeDelete());
		
		//고객센터
		map.put("/csList.do", new CsList());
		map.put("/csSelect.do", new CsSelect());
		map.put("/csInsert.do", new CsInsert());
		map.put("/csUpdate.do", new CsUpdate());
		map.put("/csDelete.do", new CsDelete());
		
		//고객센터 댓글
		map.put("/cscmtList.do", new CscmtList());
		map.put("/cscmtSelect.do", new CscmtSelect());
		map.put("/cscmtInsert.do", new CscmtInsert());
		map.put("/cscmtUpdate.do", new CscmtUpdate());
		map.put("/cscmtDelete.do", new CscmtDelete());
		
		
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getServletPath();
		
		Command command = map.get(path);
		String viewPage = command.execute(request, response);
		
		if (!viewPage.endsWith(".do")) {	//Tiles �궗�슜
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles";	// ex) home/home
			} else {	//Tiles �븞 �궗�슜
				viewPage = "WEB-INF/views/"+ viewPage;	//ex) home/home.jsp 
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
