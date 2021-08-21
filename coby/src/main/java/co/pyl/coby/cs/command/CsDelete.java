package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;

public class CsDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시글 삭제
		HttpSession session = request.getSession();
		CsService dao = new CsServiceImpl();
		CsVO vo = new CsVO();
		
		vo.setCsWriter(request.getParameter("userId"));
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
					
		dao.csDelete(vo);
		
		return "csList.do";
	}

}
