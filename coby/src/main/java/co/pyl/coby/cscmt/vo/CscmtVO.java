package co.pyl.coby.cscmt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CscmtVO {
	private int cscmtNo;
	private String cscmtContent;
	private Date cscmtDate;
	private String userId;
	private int csNo;
}
