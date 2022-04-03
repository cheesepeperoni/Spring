package com.yedam.app.signIn.service;

import java.util.ArrayList;
import java.util.Map;

import com.yedam.app.signIn.domain.SignInVO;

public interface SignInService {
	public ArrayList<SignInVO> getList();

	public void insertInfo(Map<String, Object> map);

	public SignInVO getOne(SignInVO vo); // 단건조회

	public int modifyInfo(SignInVO vo);
}
