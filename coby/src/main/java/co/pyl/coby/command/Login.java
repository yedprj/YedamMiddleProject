package co.pyl.coby.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class Login implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 기능
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPw(request.getParameter("userPw"));
		
		vo = userDao.loginUser(vo);
		System.out.println(vo);
		
		String page = "";
		if(vo != null) {
			session.setAttribute("user", vo);
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("nickname", vo.getUserNickname());
			page = "home.do";
		} else {
			String message = "아이디 또는 비밀번호가 틀립니다.";
			request.setAttribute("message", message);
			page = "loginForm.do";
		}
		return page;
	}

}
