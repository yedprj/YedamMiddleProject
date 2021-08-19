package co.pyl.coby.board.command;

import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.pyl.coby.common.Command;

public class BoardInsertForm implements Command {
	

	@Override
	//게시글 입력 양식 
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		
		return "board/boardInsertForm";
	}

}
