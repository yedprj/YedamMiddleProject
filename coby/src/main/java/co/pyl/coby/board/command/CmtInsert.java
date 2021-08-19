package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 작성
		BoardService dao = new BoardServiceImpl();
		HttpSession session = request.getSession();
		
		int boardId = Integer.valueOf(request.getParameter("boardId"));
		String cmtWriter = request.getParameter("userId");
		String cmtContent = request.getParameter("cmtContent");
		
		CmtVO vo = new CmtVO();
		vo.setBoardId(boardId);
		vo.setCmtContent(cmtContent);
		vo.setCmtWriter(cmtWriter);
		
		dao.cmtInsert(vo);
		
		return "boardSelect.do";
	}
}
