package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtsUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 수정
		BoardService dao = new BoardServiceImpl();
		CmtVO vo = new CmtVO();
		
		vo.setCmtNo(Integer.valueOf(request.getParameter("cmtNo")));
		dao.cmtUpdate(vo);
		
		request.setAttribute("cmt", vo);
		
		return "cmtUpdate.do";
	}

}
