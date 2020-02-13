package kr.co.jejuolle.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.Mypage_DAO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseReviewVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.QuestionVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.TourReviewVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
import kr.co.jejuolle.mvc.vo.UsersVO;

@Controller
public class MyPage_Controller {

	@Autowired
	private Mypage_DAO dao;

	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(int uno) {
		System.out.println("mypage uno:"+uno);
		return "mypage/mypage";
	}

	// pick 관광지
	@RequestMapping("/pickTourspot")
	public ModelAndView pickTourspot(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickTourspot");
		List<TourSpotVO> tpList = dao.selectTourPick(uno);
		mav.addObject("tpList", tpList);
		return mav;
	}
	
	// pick 숙소
	@RequestMapping("/pickhouse")
	public ModelAndView pickhouse(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickHouse");
		List<HouseVO> hpList = dao.selectHousePick(uno);
		mav.addObject("hpList", hpList);
		return mav;
	}

	// 예약한 숙소
	@RequestMapping("/reservationHouse")
	public ModelAndView reservationHouse(int uno) {
		ModelAndView mav=new ModelAndView("mypage/reservationHouse");
		List<ReservationVO> rvList = dao.selectReservation(uno);
		mav.addObject("rvList", rvList);
		return mav;
	}

	// 회원정보 수정페이지 이동
	@RequestMapping("/infoModify")
	public ModelAndView infoModify(int uno) {
		ModelAndView mav = new ModelAndView("mypage/infoModify");
		UsersVO usersvo = dao.selectUserInfo(uno);
		mav.addObject("detail", usersvo);
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping("/infoUpdate")
	public String infoUpdate(UsersVO usersvo) {
		dao.updateUser(usersvo);
		System.out.println("수정?");
		return "redirect:infoModify?uno="+usersvo.getuNo();
	}

	// 회원탈퇴 페이지로 이동
	@RequestMapping("/user_delete")
	public ModelAndView userDelete(int uno) {
		ModelAndView mav=new ModelAndView("mypage/userDelete");
		System.out.println("회원탈퇴페이지 번호 :"+uno);
		mav.addObject("uno",uno);
		return mav;
	}

	// 회원탈퇴
	@RequestMapping("/deleteUser")
	public String deleteUser(int uno) {
		dao.deleteUser(uno);
		return "main/main";
	}
	
	//비밀번호 변경
	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(UsersVO usersvo) {
		System.out.println(usersvo.getuPwd());
		System.out.println(usersvo.getuNo());
		dao.pwdUpdate(usersvo);
		return "redirect:mypage?uno="+usersvo.getuNo();
	}

	// 나의 문의
	@RequestMapping("/myQuestion")
	public ModelAndView myquestion(int uno) {
		ModelAndView mav = new ModelAndView("mypage/myquestion");
		List<QuestionVO> qList = dao.selectMyQuestion(uno);
		mav.addObject("qList", qList);
		return mav;
	}
	
	// 나의 리뷰
	@RequestMapping("/myReview")
	public ModelAndView myreview(int uno) {
		ModelAndView mav = new ModelAndView("mypage/myReview");
		List<HouseReviewVO> hrList = dao.selectMyHouseReivew(uno);
		List<TourReviewVO> trList = dao.selectMyTourReview(uno);
		mav.addObject("hrList", hrList);
		mav.addObject("trList", trList);
		return mav;
	}
	
	// 나의 문의사항 삭제
	@RequestMapping("/deleteMyQuestion")
	public String deleteMyQuestion(int qnum, HttpSession session) {
		dao.deleteMyQuestion(qnum);
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myQuestion?uno="+uno;
	}
	
	// 나의 관광지 리뷰 삭제
	@RequestMapping("/deleteMyTourReview")
	public String deleteMyTourReview(int trno, HttpSession session) {
		
		System.out.println("asdf : "+trno);
		dao.deleteTourReview(trno);
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myReview?uno="+uno;
	}
	
	// 나의 관광지 리뷰 삭제
	@RequestMapping("/deleteMyHouseReview")
	public String deleteMyHouseReview(int hrno, HttpSession session) {
		dao.deleteHouseReview(hrno);
		System.out.println("ddddd");
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myReview?uno="+uno;
	}
	
	

	// 여행일정추가
	@RequestMapping("/plan")
	public String plan() {
		return "mypage/plan";
	}
}
