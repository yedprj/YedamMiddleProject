package co.pyl.coby.purchase.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.purchase.service.PurchaseMapper;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.vo.PrCmtVO;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseServiceImpl implements PurchaseService {
	//Mybatis를 통해 데이터베이스를 연결
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
    //Mapper Interface 사용
	private PurchaseMapper map =sqlSession.getMapper(PurchaseMapper.class);
    
	@Override
	public List<PurchaseVO> purchaseSelectList() {
		return map.purchaseSelectList();
	}

	@Override
	public List<PurchaseVO> purchaseSelect(PurchaseVO vo) {
		return map.purchaseSelect(vo);
	}

	@Override
	public List<PrCmtVO> purchaseCmtList(PrCmtVO vo) {
		return map.purchaseCmtList(vo);
	}

	@Override
	public int purchaseCmtInsert(PrCmtVO vo) {
		map.purchaseCmtInsert(vo);
		return vo.getPrcmtNo();
	}
	@Override
	public PrCmtVO purchaseCmtSelect(int prcmtNo) {
		return map.purchaseCmtSelect(prcmtNo);
	}
	
	@Override
	public int purchaseCmtDelete(PrCmtVO vo) {
		return map.purchaseCmtDelete(vo);
	}
	
	@Override
	public int purchaseInsert(PurchaseVO vo) {
		map.purchaseInsert(vo);
		return vo.getPrNo();
	}

	@Override
	public int ApplicatePeople(PurchaseVO vo) {
		// TODO Auto-generated method stub
		return map.ApplicatePeople(vo);
	}




}
