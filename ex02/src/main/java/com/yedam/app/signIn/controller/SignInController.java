package com.yedam.app.signIn.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.signIn.domain.SignInVO;
import com.yedam.app.signIn.service.SignInService;

@Controller
@RequestMapping("/signIn/*")
public class SignInController {

	@Autowired
	SignInService service;

	// 전체조회
	@GetMapping("/list")
	public String list(Model model) {
		return "/signIn/list";
	}

	// 조회 (ajax)
	@PostMapping("/getList")
	@ResponseBody
	public ArrayList<SignInVO> getList() {
		return service.getList();
	}

	// 등록
	@PostMapping("/insertInfo")
	@ResponseBody
	public boolean insertInfo(@RequestBody Map<String, Object> map) {
		System.out.println(map.get("ID"));
		service.insertInfo(map);
		return true;
	}

	// 수정
	@PostMapping("/modifyInfo")
	@ResponseBody
	public int modifyInfo(@RequestBody SignInVO vo) {
		return service.modifyInfo(vo);
	}

}
