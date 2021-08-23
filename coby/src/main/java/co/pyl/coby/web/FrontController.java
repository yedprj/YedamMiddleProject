package co.pyl.coby.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.admin.command.AdminAccount;
import co.pyl.coby.admin.command.AdminHome;
import co.pyl.coby.admin.command.AdminPayment;
import co.pyl.coby.applicate.command.ApplicateForm;
import co.pyl.coby.board.command.BoardDelete;
import co.pyl.coby.board.command.BoardInsert;
import co.pyl.coby.board.command.BoardInsertForm;
import co.pyl.coby.board.command.BoardList;
import co.pyl.coby.board.command.BoardSelect;
import co.pyl.coby.board.command.BoardUpdate;
import co.pyl.coby.board.command.BoardUpdateForm;
import co.pyl.coby.board.command.CmtDelete;
import co.pyl.coby.board.command.CmtInsert;
import co.pyl.coby.board.command.CmtUpdate;
import co.pyl.coby.command.FindId;
import co.pyl.coby.command.FindIdForm;
import co.pyl.coby.command.Home;
import co.pyl.coby.command.IdCheck;
import co.pyl.coby.command.Login;
import co.pyl.coby.command.Logout;
import co.pyl.coby.command.UpdatePw;
import co.pyl.coby.command.UpdatePwForm;
import co.pyl.coby.command.SignUp;
import co.pyl.coby.common.Command;
import co.pyl.coby.cs.command.CsDelete;
import co.pyl.coby.cs.command.CsInsert;
import co.pyl.coby.cs.command.CsInsertForm;
import co.pyl.coby.cs.command.CsList;
import co.pyl.coby.cs.command.CsSelect;
import co.pyl.coby.cs.command.CsUpdate;
import co.pyl.coby.cs.command.CsUpdateForm;
import co.pyl.coby.cs.command.CscmtDelete;
import co.pyl.coby.cs.command.CscmtInsert;
import co.pyl.coby.cs.command.CscmtUpdate;
import co.pyl.coby.mypage.command.ApplicateList;
import co.pyl.coby.mypage.command.MyPage;
import co.pyl.coby.mypage.command.UpdateUser;
import co.pyl.coby.mypage.command.UpdateUserForm;
import co.pyl.coby.mypage.command.WishList;
import co.pyl.coby.mypage.command.deleteUserForm;
import co.pyl.coby.notice.command.NoticeDelete;
import co.pyl.coby.notice.command.NoticeInsert;
import co.pyl.coby.notice.command.NoticeInsertForm;
import co.pyl.coby.notice.command.NoticeList;
import co.pyl.coby.notice.command.NoticeSelect;
import co.pyl.coby.notice.command.NoticeUpdate;
import co.pyl.coby.notice.command.NoticeUpdateForm;
import co.pyl.coby.purchase.command.PurchaseForm;
import co.pyl.coby.purchase.command.PurchaseInsert;
import co.pyl.coby.purchase.command.PurchaseList;
import co.pyl.coby.purchase.command.PurchaseSelect;
import co.pyl.coby.purchase.command.PurchaseUpdateForm;
import co.pyl.coby.login.command.LoginForm;
import co.pyl.coby.login.command.SignUpForm;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {

		map.put("/home.do", new Home()); // 메인화면

		// 로그인, 회원가입, 아이디,비밀번호 찾기, api 회원가입, api로그인
		map.put("/login.do", new Login()); // 로그인
		map.put("/loginForm.do", new LoginForm());
		map.put("/signUpForm.do", new SignUpForm());
		map.put("/logout.do", new Logout()); // 로그아웃
		map.put("/signUp.do", new SignUp()); // 회원가입
		map.put("/idCheck.do", new IdCheck()); // 아이디 중복 체크
		map.put("/findIdForm.do", new FindIdForm()); // 아이디 찾기 폼으로
		map.put("/findId.do", new FindId());	// 아이디 찾기
		map.put("/updatePwForm.do", new UpdatePwForm());	// 비밀번호 재설정 폼으로
		map.put("/updatePw.do", new UpdatePw());	// 비밀번호 재설정 
		
		//관리자
		map.put("/adminAccount.do", new AdminAccount());
		map.put("/adminPayment.do", new AdminPayment());

		map.put("/boardList.do", new BoardList()); //게시글 리스트
		map.put("/boardSelect.do", new BoardSelect()); //게시글 상세보기
		map.put("/boardInsert.do", new BoardInsert()); //게시글 입력
		map.put("/boardInsertForm.do", new BoardInsertForm()); //게시글 입력양식 이동
		map.put("/boardUpdate.do", new BoardUpdate()); //게시글 수정
		map.put("/boardUpdateForm.do", new BoardUpdateForm()); //게시글 수정양식
		map.put("/boardDelete.do", new BoardDelete()); //게시글 삭제
		map.put("/cmtDelete.do", new CmtDelete()); //댓글 삭제
		map.put("/cmtUpdate.do", new CmtUpdate()); //댓글 수정
		map.put("/cmtInsert.do", new CmtInsert()); //댓글 입력
		
		//게시판
		map.put("/boardList.do", new BoardList()); // 게시글 리스트
		map.put("/boardSelect.do", new BoardSelect()); // 게시글 상세보기
		map.put("/boardInsert.do", new BoardInsert()); // 게시글 입력
		map.put("/boardInsertForm.do", new BoardInsertForm()); // 게시글 입력양식 이동
		map.put("/boardUpdate.do", new BoardUpdate()); // 게시글 수정
		map.put("/boardUpdateForm.do", new BoardUpdateForm()); // 게시글 수정양식
		map.put("/boardDelete.do", new BoardDelete()); // 게시글 삭제
		map.put("/cmtDelete.do", new CmtDelete()); // 댓글 삭제
		map.put("/cmtUpdate.do", new CmtUpdate()); // 댓글 수정
		map.put("/cmtInsert.do", new CmtInsert()); // 댓글 입력

		// 공지사항
		map.put("/noticeList.do", new NoticeList()); // 공지사항 리스트
		map.put("/noticeSelect.do", new NoticeSelect()); // 공지사항 상세보기
		map.put("/noticeDelete.do", new NoticeDelete()); // 공지사항 삭제
		map.put("/noticeUpdateForm.do", new NoticeUpdateForm()); // 공지사항 수정
		map.put("/noticeUpdate.do", new NoticeUpdate()); // 공지사항 수정
		map.put("/noticeInsertForm.do", new NoticeInsertForm()); // 공지사항 입력 양식
		map.put("/noticeInsert.do", new NoticeInsert()); // 공지사항 입력
		
		//고객센터
		map.put("/csList.do", new CsList()); //고객센터 게시글 리스트 (관리자권한)
		map.put("/csSelect.do", new CsSelect()); //고객센터
		map.put("/csUpdateForm.do", new CsUpdateForm()); // 고객센터 수정
		map.put("/csUpdate.do", new CsUpdate()); // 고객센터 수정
		map.put("/csInsertForm.do", new CsInsertForm()); // 고객센터 입력 양식
		map.put("/csInsert.do", new CsInsert()); // 고객센터 입력
		map.put("/csDelete.do", new CsDelete()); // 고객센터 입력
		map.put("/cscmtInsert.do", new CscmtInsert()); // 댓글 입력
		map.put("/cscmtUpdate.do", new CscmtUpdate()); // 댓글 수정
		map.put("/cscmtDelete.do", new CscmtDelete()); // 댓글 삭제
		
		// 마이페이지 관련
		map.put("/myPage.do", new MyPage()); //마이페이지 이동
		map.put("/wishList.do", new WishList()); //위시리스트 보기
		map.put("/updateUserForm.do", new UpdateUserForm()); //회원정보수정 폼
		map.put("/updateUser.do", new UpdateUser()); //회원정보수정
		map.put("/deleteUserForm.do", new deleteUserForm()); //회원탈퇴 폼
		map.put("/applicateList.do", new ApplicateList()); 
		map.put("/applicateForm.do", new ApplicateForm());

		// 공동구매
		map.put("/purchaseList.do", new PurchaseList()); // 공동구매 리스트 보기
		map.put("/purchaseSelect.do", new PurchaseSelect()); // 공동구매 상세보기
		map.put("/purchaseForm.do", new PurchaseForm()); // 공동구매 작성 폼 으로 가기
		map.put("/purchaseInsert.do", new PurchaseInsert()); // 공동구매 등록 하기
		map.put("/purchaseUpdateForm.do", new PurchaseUpdateForm()); //공동구매 수정하기 폼 ㄱㄱ
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String path = request.getServletPath();

		Command command = map.get(path);

		String viewPage = command.execute(request, response);

		if (!viewPage.endsWith(".do")) { // Tiles 사용
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles"; // ex) home/home
			} else { // Tiles 안 사용
				viewPage = "WEB-INF/views/" + viewPage; // ex) home/home.jsp
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
