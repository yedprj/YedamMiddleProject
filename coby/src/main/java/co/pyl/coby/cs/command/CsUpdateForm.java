package co.pyl.coby.cs.command;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.vo.CsVO;

public class CsUpdateForm implements Command {
	

	@Override
	//게시글 입력 양식 
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CsVO vo = new CsVO();
		
		vo.setCsNo(Integer.valueOf(request.getParameter("csNo")));
		vo.setCsTitle(request.getParameter("csTitle"));
		vo.setCsContent(request.getParameter("csContent"));
		
		
		request.setAttribute("list", vo);
		
		return "cs/csUpdateForm";
	}

}
