package co.pyl.coby.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.pyl.coby.common.Command;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.serviceImpl.UserServiceImpl;
import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.serviceImpl.WishListServiceImpl;

public class UpdateUser implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		  String userId;
		  String userNickname;
		  String userEmail;
		  String userPw;
		  
		  HttpSession session = request.getSession();
		  
	      String realPath = session.getServletContext().getRealPath("/") + "image\\";
	      String fileName = null;
	      String userProfile = null;
	      
	      System.out.println(realPath);
	      
	      try {
	         MultipartRequest multi = new MultipartRequest(
	               request, realPath, 1024*1024*2, "UTF-8", new DefaultFileRenamePolicy());
	         
	         fileName = multi.getFilesystemName("userProfile");
	         userProfile = "image/" + fileName;
	         
	         userId = multi.getParameter("userId");
	         userNickname = multi.getParameter("userNickname");
	         userEmail = multi.getParameter("userEmail");
	         userPw = multi.getParameter("userPw");
	         
	         System.out.println("fileName : " + fileName);
	         System.out.println("userId : " + userId);
	         System.out.println("userNickname : " + userNickname);
	         System.out.println("userEmail : " + userEmail);
	         System.out.println("userPw : " + userPw);
	         System.out.println("userProfile : " + userProfile);
	         
	         UserVO vo = new UserVO();
	         
	         vo.setUserId(userId);
	         vo.setUserNickname(userNickname);
	         vo.setUserEmail(userEmail);
	         vo.setUserPw(userPw);
	         vo.setUserProfile(userProfile);
	         
	         WishListService dao = new WishListServiceImpl();

	 		vo.setUserId((String) session.getAttribute("userId"));
	 		
	 		UserService dao2 = new UserServiceImpl();

      
	         int r = dao.updateUser(vo);
	         
	         System.out.println(r + "건 변경 완료");
	         
	         if (r == 1) {
	            request.setAttribute("message", "수정이 완료되었습니다.");
	            request.setAttribute("user", dao2.selectOneUser(vo));
	            
	         } else {
	        	 request.setAttribute("message", "수정에 실패했습니다.");
	         }
	         } catch (Exception e) {
	         e.printStackTrace();
	      }
		
		return "mypage/afterUpdateMypage";
	}

}
