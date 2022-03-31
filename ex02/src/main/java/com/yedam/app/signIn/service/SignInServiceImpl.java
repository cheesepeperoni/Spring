package com.yedam.app.signIn.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.signIn.domain.SignInVO;
import com.yedam.app.signIn.mapper.SignInMapper;

@Service
public class SignInServiceImpl implements SignInService {

	@Autowired
	SignInMapper mapper;

	@Override
	public ArrayList<SignInVO> getList() {
		return mapper.getList();
	}

	@Override
	public void insertInfo(Map<String, Object> map) {
		mapper.insertInfo(map);
	}

	// 단건조회
	@Override
	public SignInVO getOne(SignInVO vo) {
		return mapper.getOne(vo);
	}

	@Override
	public int modifyInfo(SignInVO vo) {
		return mapper.modifyInfo(vo);

	}

}
