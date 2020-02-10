package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Default_Controller {
	// ∏ﬁ¿Œ
	@RequestMapping({"/","/home"})
	public String main() {
		return "main/main";
	}
}
