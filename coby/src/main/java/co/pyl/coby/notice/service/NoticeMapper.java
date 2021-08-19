package co.pyl.coby.notice.service;

import java.util.List;

import co.pyl.coby.notice.vo.NoticeVO;

public interface NoticeMapper {
	
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
}
