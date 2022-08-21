package student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import student.entity.Student;

@Controller
public class StudentController {
	@InitBinder
	public void initBinder(WebDataBinder data) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
	}
	
	@RequestMapping(value = {"/","/initInsertStudent"})
	public String initInsertStudent(Model model) {
		Student s = new Student();
		model.addAttribute("s", s);
		return "insertStudent";
	}
	
	@RequestMapping("/insertStudent")
	public String insertStudent(@ModelAttribute("s")Student stu, Model model) {
		model.addAttribute("s", stu);
		return "viewStudent";
	}
}
