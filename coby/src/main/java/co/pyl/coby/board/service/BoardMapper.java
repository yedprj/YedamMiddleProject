package co.pyl.coby.board.service;

import java.util.List;

import co.pyl.coby.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete(BoardVO vo);
	int boardHit(BoardVO vo);
}
