package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BoardService dao = new BoardServiceImpl();
		CmtVO vo = new CmtVO();
		
		vo.setCmtNo(Integer.valueOf(request.getParameter("cmtNo")));
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		vo.setCmtContent(request.getParameter("cmtContent"));
		dao.cmtUpdate(vo);
		
		return "boardSelect.do";
	}

}
