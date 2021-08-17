package co.pyl.coby.cmt.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.cmt.service.CmtService;
import co.pyl.coby.cmt.vo.CmtVO;
import co.pyl.coby.common.DataSource;

public class CmtServiceImpl implements CmtService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); 
	
	@Override
	public List<CmtVO> cmtSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmtSelectList");
	}

	@Override
	public List<CmtVO> cmtSelect(int n) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmtSelect",n);
	}

	@Override
	public int cmtInsert(CmtVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cmtUpdate(CmtVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cmtDelete(CmtVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
