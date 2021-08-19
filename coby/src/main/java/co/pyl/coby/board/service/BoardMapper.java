package co.pyl.coby.board.service;

import java.util.List;

import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList();
	List<BoardVO> boardSelect(String n);
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete(BoardVO vo);
	int boardHit(BoardVO vo);
	
	int cmtInsert(CmtVO vo);
	int cmtUpdate(CmtVO vo);
	int cmtDelete(CmtVO vo);
}
