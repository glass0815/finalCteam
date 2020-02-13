package kr.co.jejuolle.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.RvTourlistlog_Dao;
import kr.co.jejuolle.mvc.dao.Tourspot_Dao;
import kr.co.jejuolle.mvc.vo.RvTourlistlogVO;
import kr.co.jejuolle.mvc.vo.TourCountVO;
import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Controller
public class Tour_Controller {

	@Autowired
	private Tourspot_Dao tourspot_Dao;
	@Autowired
	private RvTourlistlog_Dao rvtDao;

	// 관광지페이지
	@RequestMapping("/tourList")
	public ModelAndView tourList(TourCountVO count) {

		List<TourSpotVO> list = tourspot_Dao.tourspotlist();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tour/tourList");
		mav.addObject("list", list);

		int rvcnt = rvtDao.Count();
		int start = rvcnt - 3;

		count.setStart(start);
		count.setCount(rvcnt);

		List<RvTourlistlogVO> rvlist = rvtDao.Rvtlist(count);
		mav.addObject("rvlist", rvlist);
		return mav;
	}

	// 관광지 디테일
	@RequestMapping("/tourdetail")
	public String tourdetail(Model m, int tNo) {
		// 상세보기 눌렀을 때 조회수 증가
		tourspot_Dao.tourspotHit(tNo);

		TourSpotVO tvo = tourspot_Dao.tourspotDetail(tNo);
		System.out.println("info?" + tvo.gettInfo());
		String info = tvo.gettInfo();
		String array[] = info.split("/");
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);
		}
		m.addAttribute("tvo", tvo);
		return "tour/tourdetail";
	}

	// 좋아요 및 찜하기
	@GetMapping("/tourlikepick")
	public ModelAndView likePick(HttpServletRequest req, int tNo, int val) {
		ModelAndView mav = new ModelAndView();
		// 좋아요일때
		if (val == 1) {
			System.out.println("좋아요 들어갑니다~");

			// 고객번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// 고객번호와 호텔 번호
			TourLikeVO tlikevo = new TourLikeVO();
			tlikevo.settNo(tNo);
			tlikevo.setuNo(uno);

			// 좋아요 여부
			int cnt = tourspot_Dao.LikeCheck(tlikevo);

			// 좋아요가 이미 되있을경우
			if (cnt == 1) {
				System.out.println("이미 되어있습니다.");

				// 이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				// 좋아요가 되있지 않은경우
			} else {
				System.out.println("좋아요등록!");

				// 좋아요 등록
				tourspot_Dao.tourspotLike(tlikevo);

				// cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}

			// 찜하기일때
		} else if (val == 2) {
			System.out.println("찜하기 들어갑니다~");

			// 고객 번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// 고객번호와 호텔 번호
			TourPickVO tpickvo = new TourPickVO();
			tpickvo.settNo(tNo);
			tpickvo.setuNo(uno);

			// 이미 찜하기를 눌렀는지 체크
			int cnt = tourspot_Dao.PickCheck(tpickvo);

			if (cnt == 1) {
				// 이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			} else {

				// 찜이 안되있다면 찜을 시키고
				tourspot_Dao.tourspotPick(tpickvo);

				// cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

}
