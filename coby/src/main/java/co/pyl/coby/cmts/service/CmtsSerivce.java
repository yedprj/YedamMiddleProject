package co.pyl.coby.cmts.service;

import java.util.List;

import co.pyl.coby.cmts.vo.CmtsVO;


public interface CmtsSerivce {
	List<CmtsVO> cmtsSelectList();
	CmtsVO cmtsSelect(CmtsVO vo);
	int cmtsInsert(CmtsVO vo);
	int cmtsUpdate(CmtsVO vo);
	int cmtsDelete(CmtsVO vo);
}
