package co.pyl.coby.cs.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.common.Command;
import co.pyl.coby.cs.service.CsService;
import co.pyl.coby.cs.serviceImpl.CsServiceImpl;
import co.pyl.coby.cs.vo.CsVO;

public class CsList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시판 리스트 불러오기
		CsService dao = new CsServiceImpl();
		List<CsVO> list = dao.csList();
		request.setAttribute("list", list);
		return "cs/csList";
	}

}
