package co.pyl.coby.purchase.service;

import java.util.List;

import co.pyl.coby.purchase.vo.PurchaseVO;

public interface PurchaseMapper {
  //공동구매 목록 보기
  List<PurchaseVO> purchaseSelectList();
  //공동구매 목록 중 선택해서 상세보기
  List<PurchaseVO> purchaseSelect();
  
}
