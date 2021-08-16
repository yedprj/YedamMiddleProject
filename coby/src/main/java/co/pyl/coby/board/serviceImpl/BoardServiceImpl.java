package co.pyl.coby.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.board.service.BoardService;
import co.pyl.coby.board.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	
	private SqlSession sqlSession = DAO.getInstance().openSession();

	@Override
	public List<BoardVO> boardSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardSelectList");
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardSelect");
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardInsert");
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardUpdate");
	}

	@Override
	public int boardDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardDelete");
	}

}
