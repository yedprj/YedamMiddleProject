package co.pyl.coby.purchase.command;

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
		
		String basicprPrice = request.getParameter("basicprPrice");
		String prPrice=request.getParameter("prPrice");
		
		String currentTime = request.getParameter("currentTime");
		
		String date = "-> 위 내용은 "+currentTime.substring(0,4)+"년"
				                     +currentTime.substring(5,7)+"월"
				                     +currentTime.substring(8,10)+"일"+" "
				                     +currentTime.substring(11,13)+"시"
				                     +currentTime.substring(14,16)+"분"
				                     +currentTime.substring(17,19)+"초"+"에 추가되었습니다.";
		
		String basic = request.getParameter("prContent");
		String change = request.getParameter("prContent2");
		String contents =" ";
		
		if((basicprPrice.equals(prPrice))&&((int)change.length()==0)) {
		    contents = basic;	    	
		}else if(basicprPrice.equals(prPrice)){
			contents = change+"\n"+"\n"+
					   date+"\n"+"\n"+
					   basic;
		}else if(change.length()==0) {
			String a =basicprPrice.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
			String b =prPrice.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		    contents = "[가격변경: "+a+"원 -> "+b+"원]"+"\n"+"\n"+
		    		   date+"\n"+"\n"+
		    		   basic;
		}else {
			String a =basicprPrice.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
			String b =prPrice.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		    contents = "[가격변경: "+a+"원 -> "+b+"원]"+"\n"+"\n"+
		    		   change+"\n"+"\n"+
					   date+"\n"+"\n"+
					   basic;
		}
		
		vo.setPrContent(contents);
		vo.setPrPrice(Integer.valueOf(prPrice));
		vo.setPrNo(Integer.valueOf(request.getParameter("prNo")));
		dao.purchaseUpdate(vo);
		
		return "purchaseSelect.do";
	}
	
}
