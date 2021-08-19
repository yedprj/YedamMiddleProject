package co.pyl.coby.board.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmtsVO {
	private int cmtsNo;
	private String cmtsContent;
	private Date cmtsDate;
	private int cmtNo;
	private String userId;
}
