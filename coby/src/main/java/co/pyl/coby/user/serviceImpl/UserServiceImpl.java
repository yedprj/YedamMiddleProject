package co.pyl.coby.user.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.user.service.UserMapper;
import co.pyl.coby.user.service.UserService;
import co.pyl.coby.user.vo.UserVO;

public class UserServiceImpl implements UserService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UserMapper map = sqlSession.getMapper(UserMapper.class);
	
	@Override
	public List<UserVO> selectAllUser() {
		// TODO Auto-generated method stub
		return map.selectAllUser();
	}

	@Override
	public UserVO selectOneUser(UserVO vo) {
		// TODO 한건 조회
		return map.selectOneUser(vo);
	}

	@Override
	public UserVO loginUser(UserVO vo) {
		// TODO 로그인
		return map.loginUser(vo);
	}

	@Override
	public int userInsert(UserVO vo) {
		// TODO 회원가입
		return map.userInsert(vo);
	}

	@Override
	public int userDelete(UserVO vo) {
		// TODO Auto-generated method stub
		return map.userDelete(vo);
	}

	@Override
	public int userUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO findUserId(UserVO vo) {
		// TODO 아이디 찾기
		return map.findUserId(vo);
	}

	@Override
	public int userpwUpdate(UserVO vo) {
		// TODO 비밀번호 수정
		return map.userpwUpdate(vo);
	}

	@Override
	public UserVO comparePassword(UserVO vo) {
		// TODO Auto-generated method stub
		return map.comparePassword(vo);
	}

}
