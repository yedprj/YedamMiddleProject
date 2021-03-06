package co.pyl.coby.user.service;

import java.util.List;

import co.pyl.coby.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> selectAllUser();
	UserVO selectOneUser(UserVO vo);
	UserVO loginUser(UserVO vo);
	UserVO findUserId(UserVO vo);
	int userInsert(UserVO vo);
	int userDelete(UserVO vo);
	int userUpdate(UserVO vo);
	int userpwUpdate(UserVO vo);
	UserVO comparePassword(UserVO vo);
}
