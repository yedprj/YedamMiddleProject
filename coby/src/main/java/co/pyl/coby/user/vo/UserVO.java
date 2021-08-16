package co.pyl.coby.user.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userPhone;
	private String userProfile;
	private String userAuthor;
	private char userState;
}
