package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.serviceImpl.NoticeServiceImpl;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 삭제
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNtNo(Integer.valueOf(request.getParameter("ntNo")));
					
		dao.noticeDelete(vo);
		
		return "noticeList.do";
	}

}
