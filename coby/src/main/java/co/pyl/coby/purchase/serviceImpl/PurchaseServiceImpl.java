package co.pyl.coby.purchase.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.applicate.vo.ApplicateVO;
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
	public int purchaseUpdate(PurchaseVO vo) {
		return map.purchaseUpdate(vo);
	}

	@Override
	public int ApplicatePeople(PurchaseVO vo) {
		// TODO Auto-generated method stub
		return map.ApplicatePeople(vo);
	}

	@Override
	public List<ApplicateVO> applicateSelect(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.applicateSelect(vo);
	}

	@Override
	public int applicateInsert(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.applicateInsert(vo);
	}

	@Override
	public List<ApplicateVO> applicateSelectMypage(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.applicateSelectMypage(vo);
	}

	@Override
	public int applicateDelete(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.applicateDelete(vo);
	}

	@Override
	public ApplicateVO purchaseNotApplicate(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.purchaseNotApplicate(vo);
	}

	@Override
	public int bossApPriceUpdate(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.bossApPriceUpdate(vo);
	}

	@Override
	public int followApPriceUpdate(ApplicateVO vo) {
		// TODO Auto-generated method stub
		return map.followApPriceUpdate(vo);
	}

	@Override
	public int purchaseUpdate(PurchaseVO vo) {
		// TODO Auto-generated method stub
		return map.purchaseUpdate(vo);
	}






}
