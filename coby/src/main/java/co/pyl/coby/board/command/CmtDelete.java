package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 삭제
		BoardService dao = new BoardServiceImpl();
		CmtVO vo = new BoardVO();
		vo.setCmtNo(Integer.valueOf(request.getParameter("cmtNo")));
		
		int result = dao.cmtDelete(vo);
		
		String page = "";
		String message = "";
		if(result != 0) {
			message = "성공적으로 댓글을 삭제했습니다.";
			request.setAttribute("message", message);
			page = "boardSelect.do";
		} else {
			message = "댓글 삭제를 실패했습니다.";
			request.setAttribute("message", message);
			page = "boardSelect.do";
		}
		
		return page;
	}

}
