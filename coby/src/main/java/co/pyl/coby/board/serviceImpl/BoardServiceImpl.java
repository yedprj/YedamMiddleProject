package co.pyl.coby.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;
import co.pyl.coby.common.DataSource;

public class BoardServiceImpl implements BoardService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true); //true를 넣어줘야 커밋이된다.
	
	@Override
	public List<BoardVO> boardList() {
		// TODO 게시글 리스트
		return sqlSession.selectList("boardList");
	}

	@Override
	public List<BoardVO> boardSelect(String n) {
		// TODO 게시글 상세보기
		return sqlSession.selectList("boardSelect",n);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// TODO 게시글 추가
		return sqlSession.insert("boardInsert",vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO 게시글 수정
		return sqlSession.update("boardUpdate",vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		// TODO 게시글 삭제
		return sqlSession.delete("boardDelete",vo);
	}

	@Override
	public int boardHit(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardHit",vo);
	}


	@Override
	public int cmtDelete(CmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cmtDelete", vo);
	}

	@Override
	public int cmtInsert(CmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cmtInsert",vo);
	}

	@Override
	public int cmtUpdate(CmtVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cmtUpdate", vo);
	}
	
	
	

}
