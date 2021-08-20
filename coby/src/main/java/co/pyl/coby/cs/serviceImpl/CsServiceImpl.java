package co.pyl.coby.cs.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.vo.CsVO;

public class CsServiceImpl implements CsService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //true를 넣어줘야 커밋이된다.

	@Override
	public List<CsVO> csList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csList");
	}

	@Override
	public List<CsVO> csSelect(int n) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csSelect",n);
	}

	@Override
	public int csInsert(CsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int csUpdate(CsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int csDelete(CsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
