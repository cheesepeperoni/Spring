package com.dbal.app.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dbal.app.emp.service.BookService;
import com.dbal.app.model.BookVO;
import com.dbal.app.model.RentVO;

import lombok.extern.java.Log;


@Log
@Controller
@RequestMapping("/book/*")
public class BookController {
	@Autowired BookService bookService;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("book",bookService.getList());
	}
	
	@GetMapping("/listOne")
	public void listOne(Model model, RentVO vo) {
		model.addAttribute("book",bookService.read(vo));
	}
	
	@GetMapping("/insertForm")
	public void insertForm(BookVO vo, Model model) {
		model.addAttribute("book",bookService.readOne(vo));
	}
	
	@PostMapping("/insertForm")
	public String insert(BookVO vo, RedirectAttributes rttr) {
		log.info(vo.toString());
		bookService.insert(vo);
		rttr.addFlashAttribute("result",vo.getBookNo());
		return "redirect:/book/list";
	}
	
	@GetMapping("/rentList")
	public void read(Model model, RentVO vo) {
		model.addAttribute("book",bookService.read(vo));
	}
	
}
