package kr.co.jejuolle.mvc.controller;

import java.util.List;

import org.apache.poi.ss.formula.functions.Roman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.House_Dao;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.RoomVO;

@Controller
public class House_Controller {
	@Autowired
	private	House_Dao house_Dao;

	// 숙박
	@RequestMapping("/house")
	public ModelAndView house() {
		List<HouseVO> list = house_Dao.houselise();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/house");
		mav.addObject("list",list);
		return mav;
	}

	// 숙박 디테일
	@RequestMapping("/housedetail")
	public String housedetail(Model m, int hNo) {
		
		List<RoomVO> rlist = house_Dao.room(hNo);
		m.addAttribute("rlist", rlist);
		
		int cnt = house_Dao.roomCount(hNo);
		m.addAttribute("cnt", cnt);
		
		return "house/housedetail";
	}

	// 결제페이지
	@RequestMapping("/checkout")
	public String checkout() {
		return "house/checkout";
	}
}
