package co.pyl.coby.purchase.service;

import java.util.List;

import co.pyl.coby.purchase.vo.PrCmtVO;
import co.pyl.coby.purchase.vo.PurchaseVO;

public interface PurchaseService {
  //공동구매 목록 보기
  List<PurchaseVO> purchaseSelectList();
  
  //공동구매 목록 중 선택해서 상세보기
  List<PurchaseVO> purchaseSelect(PurchaseVO vo);
  
  //공동구매 상세보기 에서 댓글 불러오기 AJAX
  List<PrCmtVO> purchaseCmtList(PrCmtVO vo);
  
  //공동구매 등록 하기
  int purchaseInsert(PurchaseVO vo);
}
