package co.pyl.coby.board.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class BoardSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardService dao = new BoardServiceImpl();
		
		String boardid = request.getParameter("boardId");
		
		List<BoardVO> list = dao.boardSelect(boardid);
		
		request.setAttribute("board", list);
		
		return "board/boardSelect";
	}
	

}
