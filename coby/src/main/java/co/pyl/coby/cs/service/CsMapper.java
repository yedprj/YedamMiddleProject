package co.pyl.coby.cs.service;

import java.util.List;

import co.pyl.coby.cs.vo.CsVO;

public interface CsMapper {
	List<CsVO> csList();
	List<CsVO> csSelect(String n);
	int csInsert(CsVO vo);
	int csUpdate(CsVO vo);
	int csDelete(CsVO vo);
	int csHit(CsVO vo);
	
}
