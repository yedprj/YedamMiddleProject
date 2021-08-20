package co.pyl.coby.purchase.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseSelect implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		PurchaseService dao = new PurchaseServiceImpl();
		PurchaseVO vo = new PurchaseVO();
		
		if (request.getParameter("prNo") == null) {
			vo.setPrNo((int) request.getAttribute("prNo"));
			
		} else {
			vo.setPrNo(Integer.valueOf(request.getParameter("prNo")));
			
		}
		
		
		
		List<PurchaseVO> list = dao.purchaseSelect(vo);
		request.setAttribute("list", list);
		
		return "purchase/purchaseSelect";
	}

}
