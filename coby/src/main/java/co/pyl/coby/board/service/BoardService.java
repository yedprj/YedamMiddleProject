package co.pyl.coby.board.service;

import java.util.List;
import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.board.vo.CmtVO;

public interface BoardService {
	List<BoardVO> boardSelectList(); //게시글 리스트
	List<BoardVO> boardSelect(String n); //게시글 상세보기
	int boardInsert(BoardVO vo); //게시글 입력
	int boardUpdate(BoardVO vo); //게시글 수정
	int boardDelete(BoardVO vo); //게시글 삭제
	int boardHit(BoardVO vo); //게시글 조회수
	
	int cmtInsert(CmtVO vo); //댓글입력
	int cmtUpdate(CmtVO vo); //댓글수정
	int cmtDelete(CmtVO vo); //댓글삭제
}
