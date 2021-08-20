package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class MyPage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		HttpSession session = request.getSession();
		
		UserVO vo = new UserVO();
		
		vo.setUserId((String) session.getAttribute("userId"));
		
		UserService dao = new UserServiceImpl();
		
		request.setAttribute("user", dao.selectOneUser(vo));
		
		return "mypage/myPage";
	}

}
