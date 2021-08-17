package co.pyl.coby.cscmt.service;

import java.util.List;

import co.pyl.coby.cscmt.vo.CscmtVO;


public interface CscmtService {
	List<CscmtVO> cscmtSelectList();
	CscmtVO cscmtSelect(CscmtVO vo);
	int cscmtInsert(CscmtVO vo);
	int cscmtUpdate(CscmtVO vo);
	int cscmtDelete(CscmtVO vo);
}
