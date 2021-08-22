package co.pyl.coby.mypage.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.applicate.vo.ApplicateVO;
import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;

public class ApplicateList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");

		String page = "";
		
		if (userId == null) {
			request.setAttribute("message", "로그인이 필요합니다.");
			page = "mypage/fail";
		} else {
			ApplicateVO vo = new ApplicateVO();
			
			vo.setUserId(userId);
			
			PurchaseService dao = new PurchaseServiceImpl();
			List<ApplicateVO> list = dao.applicateSelectMypage(vo);
			
			request.setAttribute("list", list);
			page = "mypage/applicateList";
		}
		
		return page;
	}

}
