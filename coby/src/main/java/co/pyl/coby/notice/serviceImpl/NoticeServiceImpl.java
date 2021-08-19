package co.pyl.coby.notice.serviceImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //true를 해줘야 commit이 진행됨
		
	@Override
	public List<NoticeVO> noticeSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeSelectList");
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeSelect",vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeInsert",vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeUpdate",vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("noticeDelete",vo);
	}

}
