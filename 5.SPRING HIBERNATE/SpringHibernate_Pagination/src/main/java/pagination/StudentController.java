package pagination;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pagination.dao.StudentDAO;
import pagination.entities.Student;

@Controller
public class StudentController {
	@Autowired
	private StudentDAO studentDAO;
	
	@RequestMapping(value = {"/","/home"})
	public String home(@RequestParam(name = "page",required = false)Integer page, Model model) {
		Integer offset, maxResult;
		
		maxResult = 8;
		
		if(page==null) {
			offset = 0;
		}else {
			offset = (page-1)*maxResult;
		}
		
		List<Student> students = studentDAO.getStudents(offset, maxResult);
		model.addAttribute("list", students);
		
		Long totalStudents = studentDAO.getTotalStudents();
		int totalPage = (int) (totalStudents/maxResult);
		totalPage = totalPage + (totalStudents%maxResult==0?0:1);
		List<Integer> listPage = new ArrayList();
		for (int i = 1; i <= totalPage; i++) {
			listPage.add(i);
		}
		model.addAttribute("listPage", listPage);
		return "listStudents";
	}
}
