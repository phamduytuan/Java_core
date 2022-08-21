package emp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.dao.EmployeeDAO;
import emp.entities.Employee;

@Controller
public class EmployeeController {
		@Autowired
		private EmployeeDAO employeeDAO;
		
		@InitBinder
		public void initBinder(WebDataBinder binder) {
			SimpleDateFormat sf = new  SimpleDateFormat("yyyy-MM-dd");
			binder.registerCustomEditor(Date.class, new CustomDateEditor(sf,false));
		}
		
		@RequestMapping(value = {"/","/home"})
		public String home(Model model) {
			List<Employee> listEmployees = employeeDAO.getListEmployees();
			model.addAttribute("list", listEmployees);
			return "home";
		}
		
		@RequestMapping("/initInsertEmployee")
		public String initInsertEmployee(Model model) {
			Employee e = new Employee();
			model.addAttribute("e", e);
			return "insertEmployee";
		}
		
		@RequestMapping("/insertEmployee")
		public String insertEmployee(@ModelAttribute("e")Employee e, Model model) {
			boolean bl = employeeDAO.insertEmployee(e);
			if(bl) {
				return "redirect:/home";
			}else {
				model.addAttribute("error", "Insert failed!");
				model.addAttribute("e", e);
				return "insertEmployee";
			}
		}
}
