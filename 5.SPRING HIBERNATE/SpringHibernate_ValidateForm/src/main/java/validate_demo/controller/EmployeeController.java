package validate_demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import validate_demo.entity.Employee;

@Controller
public class EmployeeController {
//	@InitBinder
//	public void initBinder(WebDataBinder data) {
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//		data.registerCustomEditor(Date.class, new CustomDateEditor(sf, false));
//	}
	
	@RequestMapping(value = {"/","/initInsertEmployee"})
	public String initInsertEmployee(Model model) {
		Employee e = new Employee();
		model.addAttribute("e", e);
		return "insertEmployee";
	}
	
	@RequestMapping("/insertEmployee")
	public String insertEmployee(@Valid @ModelAttribute("e")Employee e,BindingResult result, @RequestParam("imageEmployee")MultipartFile imageFile, Model model, HttpServletRequest request) {
		if(result.hasErrors()) {
			model.addAttribute("e", e);
			return "insertEmployee";
		}else {
			String path = request.getServletContext().getRealPath("resources/images");
			File f = new File(path);
			
			File dest = new File(f.getAbsolutePath()+"/"+imageFile.getOriginalFilename());
			if(!dest.exists()) {
				try {
					Files.write(dest.toPath(), imageFile.getBytes(), StandardOpenOption.CREATE);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			e.setImgUrl(imageFile.getOriginalFilename());
			model.addAttribute("e", e);
			return "employeeDetail";
		}
		
	}
}
