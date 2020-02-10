package kr.co.jejuolle.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.Mypage_DAO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
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
	public String pickTourspot() {
		return "mypage/pickTourspot";
	}

	// pick 숙소
	@RequestMapping("/pickhouse")
	public ModelAndView pickhouse(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickHouse");
		List<HousePickVO> hpList = dao.selectHousePick(uno);
		mav.addObject("hpList",hpList);
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

	// 나의리뷰
	@RequestMapping("/myreview")
	public String myreview() {
		return "mypage/myReview";
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
	@RequestMapping("infoUpdate")
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
	public ModelAndView myquestion() {
		ModelAndView mav = new ModelAndView("mypage/myquestion");
		return mav;
	}
	
	
	
	

	// 여행일정추가
	@RequestMapping("/plan")
	public String plan() {
		return "mypage/plan";
	}
}
