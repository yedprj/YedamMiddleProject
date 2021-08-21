package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class UpdatePw implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 비밀번호 재설정
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserPw(request.getParameter("userPw"));
		vo.setUserId(request.getParameter("userId"));
		
		System.out.println(vo);
		int result = userDao.userpwUpdate(vo);
		System.out.println(result);
		String page = "";
		String message = "";
		if (result != 0) {
			page = "login/checkMessage.jsp";
			message = "비밀번호 변경에 성공하셨습니다.";
			request.setAttribute("message", message);
		} else {
			page = "login/checkMessage.jsp";
			message = "비밀번호 변경에 실패하였습니다.";
			request.setAttribute("message", message);
		}
		return page;
	}

}
