package com.yedam.app.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.sample.mapper.Sample1Mapper;
import com.yedam.app.sample.mapper.Sample2Mapper;

@Service
public class SapleServiceImpl implements SampleService{

	@Autowired Sample1Mapper sample1;
	@Autowired Sample2Mapper sample2;
	
	@Override
	//@Transactional
	public void addData(String value) {
		sample1.insert(value);
		sample2.insert(value);
		
	}

}
