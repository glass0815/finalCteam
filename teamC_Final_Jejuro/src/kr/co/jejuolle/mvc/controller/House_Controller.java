package kr.co.jejuolle.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.House_Dao;
import kr.co.jejuolle.mvc.dao.Reservation_Dao;
import kr.co.jejuolle.mvc.vo.HouseLikeVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.RoomVO;

@Controller
public class House_Controller {
	@Autowired
	private House_Dao house_Dao;

	@Autowired
	private Reservation_Dao reservation_Imple;

	// 숙박
	@RequestMapping("/house")
	public ModelAndView house() {
		List<HouseVO> list = house_Dao.houselise();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/house");
		mav.addObject("list", list);
		return mav;
	}

	// 숙박 디테일
	@RequestMapping("/housedetail")
	public String housedetail(Model m, int hNo) {
		//상세보기를 누르면 조회수 증가
		house_Dao.houseHit(hNo);

		// 호텔 정보
		HouseVO hvo = house_Dao.houseDetail(hNo);
		m.addAttribute("hvo", hvo);

		List<RoomVO> rlist = house_Dao.room(hNo);
		m.addAttribute("rlist", rlist);

		return "house/housedetail";
	}

	//AJAX_숙소정보
	@RequestMapping("/roomdetail")
	@ResponseBody
	public RoomVO roomdetail(int rNo) {
		System.out.println("??:" + rNo);
		RoomVO list = house_Dao.roomDetail(rNo);
		System.out.println("list :" + list);
		return list;
	}

	//숙소예약하기
	@RequestMapping("/res_room")
	public String res_room(ReservationVO vo, HttpSession session, Model m) throws ParseException {
		System.out.println("예약하기");
		int uNo = (int) session.getAttribute("uNo");
		vo.setuNo(uNo);
		house_Dao.res_room(vo);
		String date1 = vo.getStartDate();
		String date2 = vo.getEndDate();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date StartDate = format.parse(date1);
		Date EndDate = format.parse(date2);
		long calDate = StartDate.getTime() - EndDate.getTime();
		long day = calDate / (24 * 60 * 60 * 1000);
		day = Math.abs(day) + 1;
		System.out.println("day");

		int rvNo = vo.getRvNo();
		RoomVO list = reservation_Imple.list_res(rvNo);
		int price = list.getrPrice();
		int want = (int) (day * price);
		session.setAttribute("day", day);
		session.setAttribute("want", want);

		m.addAttribute("rlist", list);
		return "house/checkout";
	}

	@RequestMapping("/checkout")
	public String test(Model m, ReservationVO vo) {

		return "house/checkout";

	}

	// 좋아요 및 찜하기
	@GetMapping("/houselikepick")
	public ModelAndView likePick(HttpServletRequest req, int hNo, int val) {
		ModelAndView mav = new ModelAndView();
		//좋아요일때
		if (val == 1) {
			System.out.println("좋아요 들어갑니다~");

			//고객번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// 고객번호와 호텔 번호
			HouseLikeVO hlikevo = new HouseLikeVO();
			hlikevo.sethNo(hNo);
			hlikevo.setuNo(uno);

			//좋아요 여부
			int cnt = house_Dao.LikeCheck(hlikevo);

			//좋아요가 이미 되있을경우
			if (cnt == 1) {
				System.out.println("이미 되어있습니다.");

				//이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				//좋아요가 되있지 않은경우
			} else {
				System.out.println("좋아요등록!");

				//좋아요 등록
				house_Dao.houseLike(hlikevo);
				
				//cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}

			//찜하기일때
		} else if (val == 2) {
			System.out.println("찜하기 들어갑니다~");

			// 고객 번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// 고객번호와 호텔 번호
			HousePickVO hpickvo = new HousePickVO();
			hpickvo.sethNo(hNo);
			hpickvo.setuNo(uno);

			// 이미 찜하기를 눌렀는지 체크
			int cnt = house_Dao.PickCheck(hpickvo);

			if (cnt == 1) {
				//이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
				
				
			} else {

				//찜이 안되있다면 찜을 시키고 
				house_Dao.housePick(hpickvo);
								
				//cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

}
