package co.pyl.coby.board.service;

import java.util.List;

import co.pyl.coby.board.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> memberSelectList();
	BoardVO memberSelect(BoardVO vo);
	int memberInsert(BoardVO vo);
	int memberUpdate(BoardVO vo);
	int memberDelete(BoardVO vo);
}
