package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 작성
		BoardService dao = new BoardServiceImpl();
		
		int boardId = Integer.valueOf(request.getParameter("boardId"));
		String cmtWriter = request.getParameter("userId");
		String cmtContent = request.getParameter("cmtContent");
		BoardVO bvo = new BoardVO();
		CmtVO vo = new CmtVO();
		vo.setBoardId(boardId);
		vo.setCmtContent(cmtContent);
		vo.setCmtWriter(cmtWriter);
		
		bvo.setBoardId(boardId);
		
		dao.cmtInsert(vo);
		dao.countCmt(boardId);
		return "boardSelect.do";
	}

}
