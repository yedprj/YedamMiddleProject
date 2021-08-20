package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class FindId implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 아이디 찾기
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserEmail(request.getParameter("userEmail"));
		vo = userDao.findUserId(vo);
		
		String page ="" ;
		String message = "";
		
		if(vo != null) {
			request.setAttribute("userId", vo.getUserId());
			page = "login/idokForm.jsp";
		} else {
			message = "입력하신 메일은 등록되지 않은 메일입니다.";
			request.setAttribute("ermessage", message);
			page = "login/findIdForm.jsp";
		}
		return page;
	}

}
