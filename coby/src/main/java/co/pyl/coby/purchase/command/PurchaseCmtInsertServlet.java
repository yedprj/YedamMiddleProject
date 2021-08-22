package co.pyl.coby.purchase.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PrCmtVO;

@WebServlet("/PurchaseCmtInsertServlet")
public class PurchaseCmtInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PurchaseCmtInsertServlet() {
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
	  
	  vo.setPrNo(Integer.valueOf(request.getParameter("prNo"))) ;
	  vo.setUserId(request.getParameter("userId"));
	  vo.setPrcmtContent(request.getParameter("prcmtContent"));
	  
	  int r =dao.purchaseCmtInsert(vo);
	  
	  vo = dao.purchaseCmtSelect(r);
	  
	  Gson gson = new GsonBuilder().create();
	  
	  response.setCharacterEncoding("UTF-8");
	  response.setContentType("text/json;charset=utf-8");
	  
	  response.getWriter().print(gson.toJson(vo));
	}

}
