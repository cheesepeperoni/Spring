package com.dbal.app.emp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.emp.mapper.BookMapper;
import com.dbal.app.emp.service.BookService;
import com.dbal.app.model.BookVO;
import com.dbal.app.model.RentVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired BookMapper bookMapper;
	@Override
	public List<BookVO> getList() {
		// TODO Auto-generated method stub
		return bookMapper.getList();
	}

	@Override
	public List<RentVO> read(RentVO vo) {
		// TODO Auto-generated method stub
		return bookMapper.read(vo);
	}

	@Override
	public int insert(BookVO vo) {
		// TODO Auto-generated method stub
		return bookMapper.insert(vo);
	}

	@Override
	public int readOne(BookVO vo) {
		// TODO Auto-generated method stub
		return bookMapper.readOne(vo);
	}

}
