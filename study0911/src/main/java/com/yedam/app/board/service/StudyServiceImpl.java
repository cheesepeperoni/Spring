package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.StudyVO;
import com.yedam.app.board.mapper.StudyMapper;

@Service
public class StudyServiceImpl implements StudyService{

	@Autowired StudyMapper studyMapper;
	
	public List<StudyVO> getList() {
		return studyMapper.getList();
	}

	public StudyVO read(StudyVO vo) {
		return studyMapper.read(vo);
	}

	public int update(StudyVO vo) {
		return studyMapper.update(vo);
	}

	public int delete(StudyVO vo) {
		return studyMapper.delete(vo);
	}

	public int insert(StudyVO vo) {
		return studyMapper.insert(vo);
	}
	
	
	
}
