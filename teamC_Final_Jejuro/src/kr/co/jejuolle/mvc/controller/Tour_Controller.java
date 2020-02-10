package kr.co.jejuolle.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.RvTourlistlogDao;
import kr.co.jejuolle.mvc.dao.Tourspot_Dao;
import kr.co.jejuolle.mvc.vo.RvTourlistlogVO;
import kr.co.jejuolle.mvc.vo.TourCountVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Controller
public class Tour_Controller {

	@Autowired
	private Tourspot_Dao tourspot_Dao;
	@Autowired
	private RvTourlistlogDao rvtDao;
	// 관광지페이지
	@RequestMapping("/tourList")
	public ModelAndView tourList(TourCountVO count) {
		
		List<TourSpotVO> list = tourspot_Dao.tourspotlist();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tour/tourList");
		mav.addObject("list",list);
		
		int rvcnt=rvtDao.Count();
		int start = rvcnt-3;
		
		count.setStart(start);
		count.setCount(rvcnt);
		
		List<RvTourlistlogVO> rvlist= rvtDao.Rvtlist(count);
		mav.addObject("rvlist",rvlist);
		return mav;
	}

	// 관광지 디테일
	@RequestMapping("/tourdetail")
	public String tourdetail() {
		return "tour/tourdetail";
	}
}
