package co.pyl.coby.purchase.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;

public class purchaseList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "purchase/purchaseList";
	}

}
