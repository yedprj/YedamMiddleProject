package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.serviceImpl.BoardServiceImpl;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.common.Command;

public class NoticeUpdateForm implements Command {
	

	@Override
	//게시글 입력 양식 
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BoardVO vo = new BoardVO();
		
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContent(request.getParameter("boardContent"));
		
		System.out.println(request.getParameter("boardContent"));
		
		request.setAttribute("board", vo);
		
		return "board/boardUpdateForm";
	}

}
