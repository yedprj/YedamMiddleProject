package co.pyl.coby.notice.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int n_no;
	private Date n_date;
	private String n_content;
	private String n_title;
	private String user_id;
}
