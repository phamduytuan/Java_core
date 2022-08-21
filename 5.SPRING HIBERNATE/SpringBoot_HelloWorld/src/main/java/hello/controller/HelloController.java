package hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/springboot-hello")
public class HelloController {
	@RequestMapping(value = {"/home",""})
	public String home(Model model) {
		model.addAttribute("hello", "Hello JW2203LM From Spring Boot");
		return "home";
	}
}
