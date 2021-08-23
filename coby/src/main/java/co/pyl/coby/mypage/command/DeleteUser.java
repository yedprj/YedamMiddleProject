package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class DeleteUser implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userPw = request.getParameter("userPw").trim();
		System.out.println(userPw);
		HttpSession session = request.getSession();
		
		UserService dao = new UserServiceImpl();
		
		UserVO vo = new UserVO();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		System.out.println(userId);
		
		vo = dao.comparePassword(vo);
		
		String dbPw = vo.getUserPw().trim();
		System.out.println(dbPw);
		
		System.out.println(userPw.equals(dbPw));
		
		if (userId != null) {
			//일치하면
			if (userPw.equals(dbPw)) {
				dao.userDelete(vo);
				session.invalidate();
				request.setAttribute("message", "삭제");
			//일치하지 않으면
			} else {
				request.setAttribute("message", "불일치");

			}
		} else {
			request.setAttribute("message", "세션");
		}
		
		return "mypage/message.jsp";
	}

}
