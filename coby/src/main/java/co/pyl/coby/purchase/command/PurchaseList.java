package co.pyl.coby.purchase.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;

public class PurchaseList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		PurchaseService purchaseDao = new PurchaseServiceImpl();
		request.setAttribute("list", purchaseDao.purchaseSelectList());
		return "purchase/purchaseList";
	}

}
