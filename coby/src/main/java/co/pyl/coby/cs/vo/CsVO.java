package co.pyl.coby.cs.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CsVO {
	private int csNo;
	private String csTitle;
	private String csContent;
	private Date csDate;
	private int csCmtnum;
	private String userId;
}
