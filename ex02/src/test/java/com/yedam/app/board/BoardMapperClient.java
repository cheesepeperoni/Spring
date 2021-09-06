package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired BoardMapper boardMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1,10);
		cri.setType("T");
		cri.setKeyword("이나은");
		log.info(boardMapper.getList(cri).toString());
	}
	//@Test
	public void insert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목");
		vo.setContent("작성글");
		vo.setWriter("피비");
		
		int result = boardMapper.insert(vo);
		assertEquals(result, 1);
		log.info(vo.toString());
		//log.info(Long.toString(vo.getBno()));
	}
	//@Test
	public void read() {
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo = boardMapper.read(vo);
		log.info(vo.toString());
	}
	
	//@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setTitle("업뎃 제목");
		vo.setContent("내용!");
		vo.setWriter("감자");
		
		int result = boardMapper.update(vo);
		assertEquals(result, 1);
		log.info(vo.toString());
	}
	
	//@Test
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(3);
		int result = boardMapper.delete(vo);
		assertEquals(result, 1);
	}
}
