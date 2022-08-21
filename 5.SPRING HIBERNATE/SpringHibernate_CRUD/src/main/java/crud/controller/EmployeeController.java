package crud.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import crud.dao.EmployeeDAO;
import crud.entities.Employee;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeDAO employeeDAO;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
	}

	@RequestMapping(value = { "/", "/listEmployee" })
	public String home(Model model) {
		List<Employee> employees = employeeDAO.getEmployees();
		model.addAttribute("list", employees);
		return "listEmployee";
	}

	@RequestMapping("/initInsertEmployee")
	public String initInsertEmployee(Model model) {
		Employee e = new Employee();
		model.addAttribute("e", e);
		return "insertEmployee";
	}

	@RequestMapping("/insertEmployee")
	public String insertEmployee(@ModelAttribute("e") Employee e, Model model) {
		boolean bl = employeeDAO.insertEmployee(e);
		if (bl) {
			return "redirect:/listEmployee";
		} else {
			model.addAttribute("error", "Insert failed!");
			model.addAttribute("e", e);
			return "insertEmployee";
		}
	}

	@RequestMapping("/detailEmployee")
	public String detailEmployee(@PathParam("empId") Long empId, Model model) {
		Employee employeeById = employeeDAO.getEmployeeById(empId);
		model.addAttribute("e", employeeById);
		return "employeeDetail";
	}

	@RequestMapping("/deleteEmployee")
	public String deleteEmployee(@PathParam("empId") Long empId, Model model) {
		boolean bl = employeeDAO.deleteEmployee(empId);
		if (bl) {
			model.addAttribute("success", "Delete successfully!");
		} else {
			model.addAttribute("error", "Delete failed!");
		}
		List<Employee> employees = employeeDAO.getEmployees();
		model.addAttribute("list", employees);
		return "listEmployee";
	}
	
	@RequestMapping("/initUpdateEmployee")
	public String initUpdateEmployee(@RequestParam("empId")Long empId, Model model) {
		Employee employeeById = employeeDAO.getEmployeeById(empId);
		model.addAttribute("e", employeeById);
		return "updateEmployee";
	}
	
	@RequestMapping("/updateEmployee")
	public String updateEmployee(@ModelAttribute("e")Employee e, Model model) {
		boolean bl = employeeDAO.updateEmployee(e);
		if (bl) {
			return "redirect:/listEmployee";
		} else {
			model.addAttribute("error", "Update failed!");
			model.addAttribute("e", e);
			return "updateEmployee";
		}
	}
	
	@RequestMapping("/searchEmployeeByName")
	public String searchEmployeeByName(@RequestParam("empName")String empName, Model model) {
		List<Employee> employees = employeeDAO.getEmployeesByName(empName);
		model.addAttribute("list", employees);
		return "listEmployee";
	}
}
