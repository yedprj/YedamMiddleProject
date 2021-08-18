package co.pyl.coby.board.service;

import java.util.List;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;

public interface BoardService {
	List<BoardVO> boardSelectList();
	List<BoardVO> boardSelect(String n);
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete(BoardVO vo);
	int boardHit(BoardVO vo);
	
	int cmtInsert(BoardVO vo);
	int cmtUpdate(BoardVO vo);
	int cmtDelete(CmtVO vo);
}
