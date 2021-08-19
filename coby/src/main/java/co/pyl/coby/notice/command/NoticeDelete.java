package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class NoticeDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 삭제
		HttpSession session = request.getSession();
		BoardService dao = new BoardServiceImpl();
		BoardVO vo = new BoardVO();
		
		vo.setUserId(request.getParameter("userId"));
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
					
		dao.boardDelete(vo);
		
		return "boardList.do";
	}

}
