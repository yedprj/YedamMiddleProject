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
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		System.out.println("cmtNo");
		System.out.println("boardId");
		dao.cmtDelete(vo);
		
		request.setAttribute("boardId", vo.getBoardId());
		
		return "boardSelect.do";
	}

}
