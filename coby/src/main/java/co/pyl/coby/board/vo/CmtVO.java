package co.pyl.coby.board.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmtVO {
	private int cmtNo;
	private String cmtContent;
	private Date cmtDate;
	private String userId;
	private int boardId;
	private String cmtWriter;
}
