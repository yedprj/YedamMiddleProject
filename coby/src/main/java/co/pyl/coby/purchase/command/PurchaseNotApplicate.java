package co.pyl.coby.purchase.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.applicate.vo.ApplicateVO;
import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;

public class PurchaseNotApplicate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int prNo = Integer.parseInt(request.getParameter("prNo"));
		
		String userId = request.getParameter("userId");
		
		PurchaseService dao = new PurchaseServiceImpl();
		
		ApplicateVO vo = new ApplicateVO();
		
		vo.setPrNo(prNo);
		vo.setUserId(userId);
		
		vo = dao.purchaseNotApplicate(vo);
		
		if (vo != null) {
			request.setAttribute("message", "있음");
		} else {
			request.setAttribute("message", "없음");
		}
		
		
		
		return "mypage/message.jsp";
	}

}
