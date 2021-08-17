package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class IdCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 아이디 중복 체크
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		String userId = request.getParameter("userId");
		vo.setUserId(userId);
		vo = userDao.selectOneUser(vo);
		
		System.out.println(vo);
		
		String page = "";
		String message ="";
		if(vo != null) {
			message = "중복되어 사용할 수 없는 아이디 입니다.";
			request.setAttribute("message", message);
			page = "login/idCheckMessage.jsp";
		} else {
			message = "사용할 수 있는 아이디 입니다.";
			request.setAttribute("message", message);
			page = "login/idCheckMessage.jsp";
		}
		return page;
	}

}
