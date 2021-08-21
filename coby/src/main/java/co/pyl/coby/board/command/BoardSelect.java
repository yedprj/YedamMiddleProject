package co.pyl.coby.board.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class BoardSelect implements Command {

	@Override
	//게시글 상세보기
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardService dao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		String board = request.getParameter("boardId");
		vo.setBoardId(Integer.valueOf(board));
		List<BoardVO> list = dao.boardSelect(board);
		
		dao.boardHit(vo);
		request.setAttribute("board", list);
		
		return "board/boardSelect";
	}
	

}
