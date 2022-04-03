package com.dbal.app.emp.mapper;

import java.util.List;

import com.dbal.app.model.BookVO;
import com.dbal.app.model.RentVO;

public interface BookMapper {
	public List<BookVO> getList();
	
	public List<RentVO> read(RentVO vo);
	
	public int insert(BookVO vo);
	
	public int readOne(BookVO vo);
	
}
