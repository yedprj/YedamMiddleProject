package co.pyl.coby.cs.service;

import java.util.List;
import co.pyl.coby.cs.vo.CsVO;

public interface CsService {
	List<CsVO> csList();
	List<CsVO> csSelect(int n);
	int csInsert(CsVO vo);
	int csUpdate(CsVO vo);
	int csDelete(CsVO vo);
}
