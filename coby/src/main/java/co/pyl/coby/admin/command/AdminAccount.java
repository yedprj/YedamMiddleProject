package co.pyl.coby.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;

public class AdminAccount implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		UserService dao = new UserServiceImpl();
		List<UserVO> list = dao.selectAllUser();
		request.setAttribute("list", list);
		return "admin/adminAccount.jsp";
	}

}
