package co.pyl.coby.purchase.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		PurchaseService dao = new PurchaseServiceImpl();
		PurchaseVO vo = new PurchaseVO();
		
		vo.setPrCategory(request.getParameter("prCategory"));
		vo.setPrTitle(request.getParameter("prTitle"));
		vo.setPrMin(Integer.valueOf(request.getParameter("prMin")));
		vo.setPrMax(Integer.valueOf(request.getParameter("prMax")));
		vo.setPrStartdate(Date.valueOf(request.getParameter("prStartDate")));
		vo.setPrEnddate(Date.valueOf(request.getParameter("prEndDate")));
		vo.setPrPrice(Integer.valueOf(request.getParameter("prPrice")));
		//--사진 입력 넣어야함
		vo.setPrContent(request.getParameter("prContent"));
		//--세션에서 작성자 아이디 받아 와야함
		
		dao.purchaseInsert(vo);
		
		return ""; // 공동구매 등록한 상세글 보기로 가야함
	}

}
