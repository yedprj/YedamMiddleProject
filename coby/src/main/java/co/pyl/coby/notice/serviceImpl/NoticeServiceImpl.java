package co.pyl.coby.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession();
		
	@Override
	public List<NoticeVO> boardSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelectList");
	}

	@Override
	public NoticeVO boardSelect(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeSelect");
	}

	@Override
	public int boardInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeInsert");
	}

	@Override
	public int boardUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeUpdate");
	}

	@Override
	public int boardDelete(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("noticeDelete");
	}

}
