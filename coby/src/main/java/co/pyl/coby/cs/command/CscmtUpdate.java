package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CscmtVO;

public class CscmtUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		CsService dao = new CsServiceImpl();
		CscmtVO vo = new CscmtVO();
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		vo.setCscmtNo(Integer.valueOf(request.getParameter("cscmtNo"))); // 안넘어옴
		vo.setCscmtContent(request.getParameter("cscmtContent"));
		
		System.out.println(request.getParameter("csNo"));
		System.out.println(request.getParameter("cscmtNo"));
		System.out.println(request.getParameter("cscmtContent"));
		dao.cscmtUpdate(vo);
		
		
		return "csSelect.do";
	}

}
