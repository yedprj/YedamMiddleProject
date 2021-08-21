package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CscmtVO;

public class CscmtInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 작성
		CsService dao = new CsServiceImpl();
		HttpSession session = request.getSession();
		
		int csNo = Integer.valueOf(request.getParameter("csNo"));
		String cscmtWriter = request.getParameter("userId");
		String cscmtContent = request.getParameter("cscmtContent");
		
		CscmtVO vo = new CscmtVO();
		vo.setCsNo(csNo);
		vo.setCscmtContent(cscmtContent);
		vo.setCscmtWriter(cscmtWriter);
		
		dao.cscmtInsert(vo);
		
		return "csSelect.do";
	}
}
