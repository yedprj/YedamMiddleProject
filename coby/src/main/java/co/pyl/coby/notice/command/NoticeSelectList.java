package co.pyl.coby.notice.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.serviceImpl.NoticeServiceImpl;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeSelectList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시판 리스트 불러오기
		NoticeService dao = new NoticeServiceImpl();
		List<NoticeVO> list = dao.noticeSelectList();
		request.setAttribute("notice", list);
		return "notice/noticeSelectList";
	}

}
