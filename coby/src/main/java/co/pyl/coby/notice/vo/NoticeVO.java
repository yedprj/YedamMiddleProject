package co.pyl.coby.notice.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int noticeNo;
	private Date noticeDate;
	private String noticeContent;
	private String noticeTitle;
	private String userId;
}
