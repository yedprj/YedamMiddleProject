package co.pyl.coby.cs.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.vo.CsVO;
import co.pyl.coby.cs.vo.CscmtVO;

public class CsServiceImpl implements CsService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //true를 넣어줘야 커밋이된다.

	@Override
	public List<CsVO> csList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csList");
	}

	@Override
	public List<CsVO> csSelect(CsVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csSelect",vo);
	}

	@Override
	public int csInsert(CsVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("csInsert",vo);
	}

	@Override
	public int csUpdate(CsVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("csUpdate",vo);
	}

	@Override
	public int csDelete(CsVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("csDelete",vo);
	}

	@Override
	public int cscmtInsert(CscmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cscmtInsert",vo);
	}

	@Override
	public int cscmtUpdate(CscmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cscmtUpdate",vo);
	}

	@Override
	public int cscmtDelete(CscmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cscmtDelete",vo);
	}


}
