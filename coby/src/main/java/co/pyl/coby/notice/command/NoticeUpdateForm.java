package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeUpdateForm implements Command {
	

	@Override
	//게시글 입력 양식 
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		NoticeVO vo = new NoticeVO();
		
		vo.setNtNo(Integer.valueOf(request.getParameter("ntNo")));
		vo.setNtTitle(request.getParameter("ntTitle"));
		vo.setNtContent(request.getParameter("ntContent"));
		
		request.setAttribute("list", vo);
		
		return "notice/noticeUpdateForm";
	}

}
