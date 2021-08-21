package co.pyl.coby.cs.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;

public class CsSelect implements Command {

	@Override
	//게시글 상세보기
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		CsService dao = new CsServiceImpl();
		CsVO vo = new CsVO();
		HttpSession session = request.getSession();
		
		int n = Integer.valueOf(request.getParameter("csNo"));
		vo.setCsNo(n);
		
		List<CsVO> list = dao.csSelect(vo);
		request.setAttribute("list", list);
		
		return "cs/csSelect";
	}
	
}
