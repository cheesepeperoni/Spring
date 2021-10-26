
package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.StudyVO;
import com.yedam.app.board.service.StudyService;

@Controller
@RequestMapping("/study/*")
public class StudyController {
	@Autowired
	StudyService studyService;

	// 전체 조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", studyService.getList());
	}

	@GetMapping("/listOne")
	public void listOne(Model model, StudyVO vo) {
		model.addAttribute("study", studyService.read(vo));
	}

	@GetMapping("/insert")
	public void insert() {

	}

	@PostMapping("/insert")
	public String insert(StudyVO vo, RedirectAttributes rttr) {
		studyService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/study/list";
	}

	@PostMapping("/modify")
	public String modify(StudyVO vo, RedirectAttributes rttr) {
		int result = studyService.update(vo);
		if (result == 1) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/study/list";
	}

	@PostMapping("/delete")
	public String delete(StudyVO vo, RedirectAttributes rttr) {
		int result = studyService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/study/list";
	}

}

