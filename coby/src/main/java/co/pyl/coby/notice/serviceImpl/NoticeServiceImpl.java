package co.pyl.coby.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.notice.service.NoticeService;
import co.pyl.coby.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //true를 넣어줘야 커밋이된다.

	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeList");
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
