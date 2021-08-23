package co.pyl.coby.applicate.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class ApplicateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {		
		
		int prNo = Integer.parseInt(request.getParameter("frmPrNo"));
		int dividedPrice = Integer.parseInt(request.getParameter("frmDividedPrice"));
		int bossPrice = Integer.parseInt(request.getParameter("frmBossPrice"));

		PurchaseService dao = new PurchaseServiceImpl();
		PurchaseVO vo = new PurchaseVO();
		vo.setPrNo(prNo);
		vo.setDividedPrice(dividedPrice);
		
		List<PurchaseVO> list = dao.purchaseSelect(vo);
		
		request.setAttribute("list", list);
		request.setAttribute("dividedPrice", dividedPrice);
		request.setAttribute("bossPrice", bossPrice);
		
		return "applicate/applicateForm";
	}

}
