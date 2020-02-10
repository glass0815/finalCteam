package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.UsersVO;

@Repository
public class Mypage_DAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	//정보수정 페이지 - 회원정보가져오기
	public UsersVO selectUserInfo(int uno) {
		UsersVO vo = ss.selectOne("mypage.selectUserInfo", uno);
		return vo;
	}
	
	//회원탈퇴
	public void deleteUser(int uno) {
		ss.delete("mypage.deleteUser", uno);
	}
	
	//회원정보 수정
	public void updateUser(UsersVO usersvo) {
		ss.update("mypage.userInfoUpdate",usersvo);
	}
	
	//비밀번호 변경
	public void pwdUpdate(UsersVO usersvo) {
		ss.update("mypage.pwdUpdate", usersvo);
	}
	
	//예약숙소 가져오기
	public List<ReservationVO> selectReservation(int uno){
		return ss.selectList("mypage.selectReservation", uno);
	}
	
	// 내가 찜한 숙소 리스트 출력
	public List<HousePickVO> selectHousePick(int uno){
		return ss.selectList("mypage.selectHousePick", uno);
	}
	
}
