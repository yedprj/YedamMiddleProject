package co.pyl.coby.purchase.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PrCmtVO;

@WebServlet("/purchaseCmtDeleteServlet")
public class purchaseCmtDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public purchaseCmtDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PurchaseService dao = new PurchaseServiceImpl();
	  
	  PrCmtVO vo = new PrCmtVO();
	  
	  vo.setPrcmtNo(Integer.parseInt(request.getParameter("id")));
	  
	  response.getWriter().print(dao.purchaseCmtDelete(vo));
	  
	}

}
