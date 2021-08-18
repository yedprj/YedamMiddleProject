package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class CmtInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 작성
		BoardService dao = new BoardServiceImpl();
		HttpSession session = request.getSession();
		
		int boardId = Integer.valueOf(request.getParameter("boardId"));
		String userId = request.getParameter("cmtWriter");
		String cmtContent = request.getParameter("cmtContent");
		String id = request.getParameter("sessionId");
		
		BoardVO vo = new BoardVO();
		vo.setBoardId(boardId);
		vo.setUserId(userId);
		vo.setCmtContent(cmtContent);
		vo.setCmtWriter(id);
		
		int result = dao.cmtInsert(vo);
		
		String page="";
		String message="";
		if(result != 0) {
			message = "성공적으로 댓글을 입력했습니다.";
			request.setAttribute("message", message);
			page = "boardSelect.do";
		} else {
			message = "게시글 입력을 실패 했습니다.";
			request.setAttribute("message", message);
			page = "boardSelect.do";
		}
		
		return page;
	}

}
