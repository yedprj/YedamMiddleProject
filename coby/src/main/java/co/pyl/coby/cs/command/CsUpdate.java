package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;

public class CsUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 수정
		CsService dao = new CsServiceImpl();
		CsVO vo = new CsVO();
		
		System.out.println(Integer.valueOf(request.getParameter("csNo")));
		System.out.println(request.getParameter("csContent"));
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		vo.setCsContent(request.getParameter("csContent"));
		dao.csUpdate(vo);
		
		return "csSelect.do";
	}

}
