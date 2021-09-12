package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")
//210p
public class BoardController {
	@Autowired
	BoardService boardService;

	// 전체 조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri======" + cri);
		int total= boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}

	// 단건조회
	@GetMapping("/get")
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터 -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}

	// 수정페이지
	@GetMapping("/modify")
	public void modify(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) { // bno 파라미터 -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}

	// 수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = boardService.update(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	// 등록 페이지
	@GetMapping("/register")
	public void registerForm() {

	}

	// 등록 처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; // 파라미터 전달 X
	}

	// 삭제
	@PostMapping("/delete")
	public String delete(BoardVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		    //rttr.addFlashAttribute("pageNum", cri.getPageNum());
		    //rttr.addFlashAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}

	// 삭제 get(나은)
	@GetMapping("/delete")
	public String delete2(BoardVO vo, RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}

}
