package co.pyl.coby.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class NoticeInsertForm implements Command {
	

	@Override
	//게시글 입력 양식 
	public String execute(HttpServletRequest request, HttpServletResponse response) {
				
		return "notice/noticeInsertForm";
	}

}
