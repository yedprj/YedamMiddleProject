package co.pyl.coby.notice.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.serviceImpl.NoticeServiceImpl;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeSelect implements Command {

	@Override
	//공지사항
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNtNo(Integer.valueOf(request.getParameter("ntNo")));
		vo = dao.noticeSelect(vo);
		request.setAttribute("list", vo);
		return "notice/noticeSelect";
		
	}
	

}
