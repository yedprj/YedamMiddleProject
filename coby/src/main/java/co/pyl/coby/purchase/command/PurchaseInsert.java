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
		
		
		
		return ""; // 공동구매 등록한 상세글 보기로 가야함
	}

}
