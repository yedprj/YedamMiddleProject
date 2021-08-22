package co.pyl.coby.applicate.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.applicate.vo.ApplicateVO;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;


@WebServlet("/ApplicateDeleteServlet")
public class ApplicateDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApplicateDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apNo = request.getParameter("apNo");
		
		System.out.println(apNo);
		
		ApplicateVO vo = new ApplicateVO();
		
		vo.setApNo(Integer.parseInt(apNo));
		
		PurchaseService dao = new PurchaseServiceImpl();
		
		dao.applicateDelete(vo);
		
	}

}
