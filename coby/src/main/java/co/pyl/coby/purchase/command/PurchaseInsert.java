package co.pyl.coby.purchase.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.pyl.coby.common.Command;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.serviceImpl.PurchaseServiceImpl;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String prPhoto1;
		String prPhoto2;
		String prPhoto3;

		HttpSession session = request.getSession();
		String realPath = session.getServletContext().getRealPath("/") + "image\\";

		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, 1024 * 1024 * 2, "UTF-8",
					new DefaultFileRenamePolicy());

			prPhoto1 = "image/" + multi.getFilesystemName("prPhoto1");
			prPhoto2 = "image/" + multi.getFilesystemName("prPhoto2");
			prPhoto3 = "image/" + multi.getFilesystemName("prPhoto3");

			PurchaseService dao = new PurchaseServiceImpl();
			PurchaseVO vo = new PurchaseVO();

			vo.setUserId(multi.getParameter("userId"));
			vo.setPrCategory(multi.getParameter("prCategory"));
			vo.setPrTitle(multi.getParameter("prTitle"));
			vo.setPrMin(Integer.valueOf(multi.getParameter("prMin")));
			vo.setPrMax(Integer.valueOf(multi.getParameter("prMax")));
			vo.setPrStartdate(Date.valueOf(multi.getParameter("prStartDate")));
			vo.setPrEnddate(Date.valueOf(multi.getParameter("prEndDate")));
			vo.setPrPrice(Integer.valueOf(multi.getParameter("prPrice")));
			vo.setPrContent(multi.getParameter("prContent"));
			vo.setPrPhoto1(prPhoto1);
			vo.setPrPhoto2(prPhoto2);
			vo.setPrPhoto3(prPhoto3);

			System.out.println(prPhoto1);
			System.out.println(prPhoto2);
			System.out.println(prPhoto3);

			int r = dao.purchaseInsert(vo);

			if (r != 0) {
				request.setAttribute("prNo", r);
				request.setAttribute("message", "글 등록이 완료되었습니다.");
			} else {
				request.setAttribute("message", "글 등록에 실패했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "purchaseSelect.do"; // 공동구매 등록한 상세글 보기로 바꿔야함
	}
}
