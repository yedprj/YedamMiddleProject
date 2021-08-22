package co.pyl.coby.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class AdminPayment implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PurchaseService dao = new PurchaseServiceImpl();
		List<PurchaseVO> list = dao.purchaseSelectList();
		request.setAttribute("list", list);
		return "admin/adminPayment.jsp"; 
	}

}
