package co.pyl.coby.purchase.service;

import java.util.List;

import co.pyl.coby.applicate.vo.ApplicateVO;
import co.pyl.coby.purchase.vo.PrCmtVO;
import co.pyl.coby.purchase.vo.PurchaseVO;

public interface PurchaseService {

	// 공동구매 목록 보기
	List<PurchaseVO> purchaseSelectList();

	// 공동구매 목록 중 선택해서 상세보기
	List<PurchaseVO> purchaseSelect(PurchaseVO vo);

	// 공동구매 상세보기 에서 댓글 불러오기 AJAX
	List<PrCmtVO> purchaseCmtList(PrCmtVO vo);

	// 공동구매 게시글 수정
	int purchaseUpdate(PurchaseVO vo);

	// 공동구매 상세보기에서 댓글 입력하기 AJAX
	int purchaseCmtInsert(PrCmtVO vo);

	// 공동구매 댓글 입력한거 하나 가져오기
	PrCmtVO purchaseCmtSelect(int prcmtNo);

	// 공동구매 상세보기에서 댓글 삭제하기 AJAX
	int purchaseCmtDelete(PrCmtVO vo);

	// 공동구매 등록 하기
	int purchaseInsert(PurchaseVO vo);

	// 참여인원수 조회
	int ApplicatePeople(PurchaseVO vo);

	// 참여현황 조회
	List<ApplicateVO> applicateSelect(ApplicateVO vo);

	// 참여현황 추가
	int applicateInsert(ApplicateVO vo);

	// 참여현황 조회(마이페이지)
	List<ApplicateVO> applicateSelectMypage(ApplicateVO vo);

	// 참여현황 삭제(마이페이지)
	int applicateDelete(ApplicateVO vo);

	// 공동구매 글 올린 사람이 참여신청 못하게 확인하기
	ApplicateVO purchaseNotApplicate(ApplicateVO vo);

	// 참여 현황 추가시, 파티장의 apPrice 업데이트
	int bossApPriceUpdate(ApplicateVO vo);

	// 참여 현황 추가시, 파티원의 apPrice 업데이트
	int followApPriceUpdate(ApplicateVO vo);

}
