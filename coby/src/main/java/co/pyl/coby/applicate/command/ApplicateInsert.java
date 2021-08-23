package co.pyl.coby.applicate.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.applicate.vo.ApplicateVO;
import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;

public class ApplicateInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int prNo = Integer.parseInt(request.getParameter("prNo"));
		int dividedPrice = Integer.parseInt(request.getParameter("dividedPrice"));
		int bossPrice = Integer.parseInt(request.getParameter("bossPrice"));
		String bossId = request.getParameter("bossId");
		
		ApplicateVO vo = new ApplicateVO();
		
		HttpSession session = request.getSession();
		vo.setPrNo(prNo);
		vo.setUserId((String) session.getAttribute("userId"));
		vo.setDividedPrice(dividedPrice);
		vo.setBossPrice(bossPrice);
		vo.setApPay("NAVER PAY");
		
		PurchaseService dao = new PurchaseServiceImpl();
		
		//참여신청 입력
		dao.applicateInsert(vo);
		
		//입력 후에 userId는 보스 id로 초기화
		vo.setUserId(bossId);
		
		//파티장의 가격 수정
		dao.bossApPriceUpdate(vo);
		
		//나머지 파티원들의 가격도 동일하게 수정
		dao.followApPriceUpdate(vo);
		
		request.setAttribute("message", "참여");
		
		return "mypage/message.jsp";
	}

}
