package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;


public class UserDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원 삭제 구문
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		
		vo.setUserId(request.getParameter("userId"));
		int n = dao.userDelete(vo);
		return "adminAccount.do";
		
	}

}
