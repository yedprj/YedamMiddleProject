package co.pyl.coby.board.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardVO extends CmtVO{
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardHit;
	private int boardCmtnum;
	private String userId;
	
}
