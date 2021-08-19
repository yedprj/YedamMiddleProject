package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class NoticeUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 수정
		BoardService dao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		vo.setBoardContent(request.getParameter("boardContent"));
		dao.boardUpdate(vo);
		return "boardList.do";
	}

}
