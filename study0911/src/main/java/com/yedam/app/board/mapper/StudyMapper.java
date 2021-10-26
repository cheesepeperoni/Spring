package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.domain.StudyVO;

public interface StudyMapper {
	public List<StudyVO> getList();
	
	public StudyVO read(StudyVO vo);
	
	public int insert(StudyVO vo);
	
	public int update(StudyVO vo);
	
	public int delete(StudyVO vo);
}
