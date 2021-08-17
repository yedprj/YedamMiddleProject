package co.pyl.coby.notice.service;

import java.util.List;

import co.pyl.coby.notice.vo.NoticeVO;


public interface NoticeService {
	List<NoticeVO> boardSelectList();
	NoticeVO boardSelect(NoticeVO vo);
	int boardInsert(NoticeVO vo);
	int boardUpdate(NoticeVO vo);
	int boardDelete(NoticeVO vo);
}
