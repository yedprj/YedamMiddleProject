package co.pyl.coby.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class BoardList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시판 리스트 불러오기
		BoardService boardDao = new BoardServiceImpl();
		List<BoardVO> list = boardDao.boardSelectList();
		request.setAttribute("board", list);
		return "board/boardSelectList";
	}

}
