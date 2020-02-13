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
	
	//�������� ������ - ȸ��������������
	public UsersVO selectUserInfo(int uno) {
		UsersVO vo = ss.selectOne("mypage.selectUserInfo", uno);
		return vo;
	}
	
	//ȸ��Ż��
	public void deleteUser(int uno) {
		ss.delete("mypage.deleteUser", uno);
	}
	
	//ȸ������ ����
	public void updateUser(UsersVO usersvo) {
		ss.update("mypage.userInfoUpdate",usersvo);
	}
	
	//��й�ȣ ����
	public void pwdUpdate(UsersVO usersvo) {
		ss.update("mypage.pwdUpdate", usersvo);
	}
	
	//������� ��������
	public List<ReservationVO> selectReservation(int uno){
		return ss.selectList("mypage.selectReservation", uno);
	}
	
	// ���� ���� ���� ����Ʈ ���
	public List<HouseVO> selectHousePick(int uno){
		return ss.selectList("mypage.selectHousePick", uno);
	}
	
	// ���� ���� ������ ����Ʈ ���
	public List<TourSpotVO> selectTourPick(int uno){
		return ss.selectList("mypage.selectTourPick", uno);
	}
	
	// ���� ������ ���� ���
	public List<TourReviewVO> selectMyTourReview(int uno){
		return ss.selectList("mypage.selectMyTourReview", uno);
	}
	
	// ���� ���� ���� ���
	public List<HouseReviewVO> selectMyHouseReivew(int uno){
		return ss.selectList("mypage.selectMyHouseReivew", uno);
	}
	
	// ���� ������ ���� ����
	public void deleteTourReview(int trno) {
		ss.delete("mypage.deleteTourReview", trno);
	}
	
	// ���� ���� ���� ����
	public void deleteHouseReview(int hrno) {
		ss.delete("mypage.deleteHouseReview", hrno);
	}
	
	// ���� ���ǳ��� ���
	public List<QuestionVO> selectMyQuestion(int uno){
		return ss.selectList("mypage.selectMyQuestion", uno);
	}
	
	// ���� ���ǳ��� ����
	public void deleteMyQuestion(int qnum) {
		ss.delete("mypage.deleteMyQuestion", qnum);
	}
	
}
