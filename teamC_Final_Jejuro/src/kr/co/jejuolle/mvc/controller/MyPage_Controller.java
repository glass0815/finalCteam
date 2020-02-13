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

	// ����������
	@RequestMapping("/mypage")
	public String mypage(int uno) {
		System.out.println("mypage uno:"+uno);
		return "mypage/mypage";
	}

	// pick ������
	@RequestMapping("/pickTourspot")
	public ModelAndView pickTourspot(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickTourspot");
		List<TourSpotVO> tpList = dao.selectTourPick(uno);
		mav.addObject("tpList", tpList);
		return mav;
	}
	
	// pick ����
	@RequestMapping("/pickhouse")
	public ModelAndView pickhouse(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickHouse");
		List<HouseVO> hpList = dao.selectHousePick(uno);
		mav.addObject("hpList", hpList);
		return mav;
	}

	// ������ ����
	@RequestMapping("/reservationHouse")
	public ModelAndView reservationHouse(int uno) {
		ModelAndView mav=new ModelAndView("mypage/reservationHouse");
		List<ReservationVO> rvList = dao.selectReservation(uno);
		mav.addObject("rvList", rvList);
		return mav;
	}

	// ȸ������ ���������� �̵�
	@RequestMapping("/infoModify")
	public ModelAndView infoModify(int uno) {
		ModelAndView mav = new ModelAndView("mypage/infoModify");
		UsersVO usersvo = dao.selectUserInfo(uno);
		mav.addObject("detail", usersvo);
		return mav;
	}
	
	//ȸ������ ����
	@RequestMapping("/infoUpdate")
	public String infoUpdate(UsersVO usersvo) {
		dao.updateUser(usersvo);
		System.out.println("����?");
		return "redirect:infoModify?uno="+usersvo.getuNo();
	}

	// ȸ��Ż�� �������� �̵�
	@RequestMapping("/user_delete")
	public ModelAndView userDelete(int uno) {
		ModelAndView mav=new ModelAndView("mypage/userDelete");
		System.out.println("ȸ��Ż�������� ��ȣ :"+uno);
		mav.addObject("uno",uno);
		return mav;
	}

	// ȸ��Ż��
	@RequestMapping("/deleteUser")
	public String deleteUser(int uno) {
		dao.deleteUser(uno);
		return "main/main";
	}
	
	//��й�ȣ ����
	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(UsersVO usersvo) {
		System.out.println(usersvo.getuPwd());
		System.out.println(usersvo.getuNo());
		dao.pwdUpdate(usersvo);
		return "redirect:mypage?uno="+usersvo.getuNo();
	}

	// ���� ����
	@RequestMapping("/myQuestion")
	public ModelAndView myquestion(int uno) {
		ModelAndView mav = new ModelAndView("mypage/myquestion");
		List<QuestionVO> qList = dao.selectMyQuestion(uno);
		mav.addObject("qList", qList);
		return mav;
	}
	
	// ���� ����
	@RequestMapping("/myReview")
	public ModelAndView myreview(int uno) {
		ModelAndView mav = new ModelAndView("mypage/myReview");
		List<HouseReviewVO> hrList = dao.selectMyHouseReivew(uno);
		List<TourReviewVO> trList = dao.selectMyTourReview(uno);
		mav.addObject("hrList", hrList);
		mav.addObject("trList", trList);
		return mav;
	}
	
	// ���� ���ǻ��� ����
	@RequestMapping("/deleteMyQuestion")
	public String deleteMyQuestion(int qnum, HttpSession session) {
		dao.deleteMyQuestion(qnum);
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myQuestion?uno="+uno;
	}
	
	// ���� ������ ���� ����
	@RequestMapping("/deleteMyTourReview")
	public String deleteMyTourReview(int trno, HttpSession session) {
		
		System.out.println("asdf : "+trno);
		dao.deleteTourReview(trno);
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myReview?uno="+uno;
	}
	
	// ���� ������ ���� ����
	@RequestMapping("/deleteMyHouseReview")
	public String deleteMyHouseReview(int hrno, HttpSession session) {
		dao.deleteHouseReview(hrno);
		System.out.println("ddddd");
		int uno = (int) session.getAttribute("uNo");
		return "redirect:myReview?uno="+uno;
	}
	
	

	// ���������߰�
	@RequestMapping("/plan")
	public String plan() {
		return "mypage/plan";
	}
}
