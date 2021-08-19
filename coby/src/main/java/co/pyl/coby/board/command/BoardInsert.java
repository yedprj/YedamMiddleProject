package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class BoardInsert implements Command {
	

	@Override
	//게시글 추가
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BoardService dao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		vo.setUserId(request.getParameter("userId"));;
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContent(request.getParameter("boardContent"));
		
		dao.boardInsert(vo);
		return "boardList.do";
	}

}
