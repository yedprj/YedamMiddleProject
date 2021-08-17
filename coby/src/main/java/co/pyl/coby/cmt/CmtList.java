package co.pyl.coby.cmt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.pyl.coby.board.vo.BoardVO;
import co.pyl.coby.cmt.service.CmtService;
import co.pyl.coby.cmt.serviceImpl.CmtServiceImpl;
import co.pyl.coby.cmt.vo.CmtVO;
import co.pyl.coby.common.Command;

public class CmtList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CmtService dao = new CmtServiceImpl();
		List<CmtVO> list = dao.cmtSelectList();
		
		request.setAttribute("cmt", list);
		return "board/boardSelect";
	}

}
