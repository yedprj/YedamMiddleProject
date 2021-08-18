package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class SignUp implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원가입
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPw(request.getParameter("userPw"));
		vo.setUserName(request.getParameter("userName"));
		vo.setUserNickname(request.getParameter("userNickname"));
		vo.setUserEmail(request.getParameter("userEmail"));
		vo.setUserPhone(request.getParameter("userPhone"));
		vo.setUserProfile(request.getParameter("userProfile"));
		
		int result = userDao.userInsert(vo);
		
		String page = "";
		if (result != 0) {
			page = "LoginForm.do";
		} else {
			
		}
		return page;
	}

}
