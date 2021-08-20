package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.serviceImpl.NoticeServiceImpl;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeInsert implements Command {
	

	@Override
	//게시글 추가
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNtTitle(request.getParameter("ntTitle"));
		vo.setNtContent(request.getParameter("ntContent"));
		
		dao.noticeInsert(vo);
		return "noticeList.do";
	}

}
