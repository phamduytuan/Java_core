package book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import book.dao.BookDAO;
import book.entities.Book;

@Controller
@RequestMapping("/book-app")
public class BookController {
	@Autowired
	private BookDAO bookDAO;
	
	@RequestMapping(value = {"/listBook",""})
	public String home(Model model) {
		List<Book> books = bookDAO.getBooks();
		model.addAttribute("list", books);
		return "home";
	}
}
