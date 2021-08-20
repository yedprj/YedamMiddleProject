package co.pyl.coby.notice.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int ntNo;
	private Date ntDate;
	private String ntContent;
	private String ntTitle;
	private String userId;
}
