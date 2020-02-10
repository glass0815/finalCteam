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

	// ����������
	@RequestMapping("/mypage")
	public String mypage(int uno) {
		System.out.println("mypage uno:"+uno);
		return "mypage/mypage";
	}

	// pick ������
	@RequestMapping("/pickTourspot")
	public String pickTourspot() {
		return "mypage/pickTourspot";
	}

	// pick ����
	@RequestMapping("/pickhouse")
	public ModelAndView pickhouse(int uno) {
		ModelAndView mav = new ModelAndView("mypage/pickHouse");
		List<HousePickVO> hpList = dao.selectHousePick(uno);
		mav.addObject("hpList",hpList);
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

	// ���Ǹ���
	@RequestMapping("/myreview")
	public String myreview() {
		return "mypage/myReview";
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
	@RequestMapping("infoUpdate")
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
	public ModelAndView myquestion() {
		ModelAndView mav = new ModelAndView("mypage/myquestion");
		return mav;
	}
	
	
	
	

	// ���������߰�
	@RequestMapping("/plan")
	public String plan() {
		return "mypage/plan";
	}
}