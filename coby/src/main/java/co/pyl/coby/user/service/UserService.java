package co.pyl.coby.user.service;

import java.util.List;

import co.pyl.coby.user.vo.UserVO;

public interface UserService {
	List<UserVO> selectAllUser();
	UserVO selectOneUser();
	UserVO loginUser(UserVO vo);
	int userInsert(UserVO vo);
	int userDelect(UserVO vo);
	int userUpdate(UserVO vo);
}
