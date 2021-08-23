package co.pyl.coby.purchase.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		PurchaseService dao = new PurchaseServiceImpl();
		PurchaseVO vo = new PurchaseVO();
		
		String n = (request.getParameter("basic")+"\n"+"<--수정 sysdate -->"+"\n"+ request.getParameter("change"));
		vo.setPrContent(n);
		vo.setPrPrice(Integer.valueOf(request.getParameter("prPrice")));
		vo.setPrNo(Integer.valueOf(request.getParameter("prNo")));
		dao.purchaseUpdate(vo);
				
		return "purchaseSelect.do";
	}

}
