package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.AnswerVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseReviewVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.QuestionVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.TourReviewVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
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
	public List<HouseVO> selectHousePick(int uno){
		return ss.selectList("mypage.selectHousePick", uno);
	}
	
	// 내가 찜한 여행지 리스트 출력
	public List<TourSpotVO> selectTourPick(int uno){
		return ss.selectList("mypage.selectTourPick", uno);
	}
	
	// 나의 관광지 리뷰 출력
	public List<TourReviewVO> selectMyTourReview(int uno){
		return ss.selectList("mypage.selectMyTourReview", uno);
	}
	
	// 나의 숙소 리뷰 출력
	public List<HouseReviewVO> selectMyHouseReivew(int uno){
		return ss.selectList("mypage.selectMyHouseReivew", uno);
	}
	
	// 나의 관광지 리뷰 삭제
	public void deleteTourReview(int trno) {
		ss.delete("mypage.deleteTourReview", trno);
	}
	
	// 나의 숙소 리뷰 삭제
	public void deleteHouseReview(int hrno) {
		ss.delete("mypage.deleteHouseReview", hrno);
	}
	
	// 나의 문의내역 출력
	public List<QuestionVO> selectMyQuestion(int uno){
		return ss.selectList("mypage.selectMyQuestion", uno);
	}
	
	// 나의 문의내역 삭제
	public void deleteMyQuestion(int qnum) {
		ss.delete("mypage.deleteMyQuestion", qnum);
	}
	
}
