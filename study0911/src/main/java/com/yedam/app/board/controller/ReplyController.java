package com.yedam.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService replyService;

	// 조회
	@GetMapping("/")
	public List<ReplyVO> getList(@RequestParam long bno) {
		return replyService.getList(bno);
	}

	// 댓글 조회
	@GetMapping("/{rno}")
	public ReplyVO read(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		return replyService.read(vo);
	}

	// 등록
	@PostMapping("/") 
	public ReplyVO insert(ReplyVO vo) {
		replyService.insert(vo);
		return replyService.read(vo);
	}

	// 수정
	@PutMapping("/")
	public ReplyVO update(@RequestBody ReplyVO vo) {
		replyService.update(vo);
		return replyService.read(vo);
	}

	// 삭제
	@DeleteMapping("/{rno}")
	public boolean delete(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		int r = replyService.delete(vo);
		return r == 1 ? true : false;
	}

}
