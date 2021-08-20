package co.pyl.coby.user.service;

import java.util.List;

import co.pyl.coby.user.vo.UserVO;

public interface UserService {
	List<UserVO> selectAllUser();
	UserVO selectOneUser(UserVO vo);
	UserVO loginUser(UserVO vo);
	UserVO findUserId(UserVO vo);
	int userInsert(UserVO vo);
	int userDelect(UserVO vo);
	int userUpdate(UserVO vo);
	int userpwUpdate(UserVO vo);
}
