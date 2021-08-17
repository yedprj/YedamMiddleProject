package co.pyl.coby.user.service;

import java.util.List;

import co.pyl.coby.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> selectAllUser();
	UserVO selectOneUser(UserVO vo);
	UserVO loginUser(UserVO vo);
	int userInsert(UserVO vo);
	int userDelect(UserVO vo);
	int userUpdate(UserVO vo);
}
