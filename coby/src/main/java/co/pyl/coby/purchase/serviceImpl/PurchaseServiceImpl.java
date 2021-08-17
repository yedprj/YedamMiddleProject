package co.pyl.coby.purchase.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.purchase.service.PurchaseMapper;
import co.pyl.coby.purchase.service.PurchaseService;
import co.pyl.coby.purchase.vo.PurchaseVO;

public class PurchaseServiceImpl implements PurchaseService {
	//Mybatis를 통해 데이터베이스를 연결
	private SqlSession sqlSession = DataSource.getInstance().openSession();
    //Mapper Interface 사용
	private PurchaseMapper map =sqlSession.getMapper(PurchaseMapper.class);
    
	@Override
	public List<PurchaseVO> purchaseSelectList() {
		return map.purchaseSelectList();
	}

	@Override
	public List<PurchaseVO> purchaseSelect() {
		return map.purchaseSelect();
	}

}
