package co.pyl.coby.cmt.service;

import java.util.List;

import co.pyl.coby.cmt.vo.CmtVO;

public interface CmtMapper {
	List<CmtVO> cmtSelectList();
	List<CmtVO> cmtSelect(int n);
	int cmtInsert(CmtVO vo);
	int cmtUpdate(CmtVO vo);
	int cmtDelete(CmtVO vo);
}
