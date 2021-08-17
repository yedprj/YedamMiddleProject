package co.pyl.coby.board;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.cmt.vo.CmtVO;
import co.pyl.coby.common.Command;

public class BoardSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardService dao = new BoardServiceImpl();
		
		BoardVO vo = new BoardVO();
		CmtVO cvo = new CmtVO();
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		vo = dao.boardSelect(vo);
		dao.boardHit(vo);
		request.setAttribute("board", vo);
		
		return "board/boardSelect";
	}
	

}
