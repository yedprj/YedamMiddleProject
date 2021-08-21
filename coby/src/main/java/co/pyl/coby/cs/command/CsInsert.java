package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;

public class CsInsert implements Command {
	

	@Override
	//게시글 추가
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		CsService dao = new CsServiceImpl();
		CsVO vo = new CsVO();
		
		vo.setCsWriter(request.getParameter("csWriter"));;
		vo.setCsTitle(request.getParameter("csTitle"));
		vo.setCsContent(request.getParameter("csContent"));
		
		dao.csInsert(vo);
		return "csList.do";
	}

}
