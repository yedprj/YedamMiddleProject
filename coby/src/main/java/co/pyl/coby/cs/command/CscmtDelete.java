package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;
import co.pyl.coby.cs.vo.CscmtVO;

public class CscmtDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 삭제
		CsService dao = new CsServiceImpl();
		CscmtVO vo = new CsVO();
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		vo.setCscmtNo(Integer.valueOf(request.getParameter("cscmtNo")));
		dao.cscmtDelete(vo);
		
		request.setAttribute("csNo", vo.getCsNo());
		
		return "csSelect.do";
	}

}
