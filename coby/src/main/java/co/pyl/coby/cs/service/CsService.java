package co.pyl.coby.cs.service;

import java.util.List;
import co.pyl.coby.cs.vo.CsVO;
import co.pyl.coby.cs.vo.CscmtVO;

public interface CsService {
	List<CsVO> csList();
	List<CsVO> csSelect(CsVO vo);
	int csInsert(CsVO vo);
	int csUpdate(CsVO vo);
	int csDelete(CsVO vo);
	
	int cscmtInsert(CscmtVO vo);
	int cscmtUpdate(CscmtVO vo);
	int cscmtDelete(CscmtVO vo);
}
