package vidu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	@RequestMapping(value = {"/","/home"})
	public String home(Model model) {
		model.addAttribute("name", "Hello Spring Web MVC");
		return "home";
	}
}
