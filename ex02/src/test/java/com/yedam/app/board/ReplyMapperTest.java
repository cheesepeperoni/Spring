package com.yedam.app.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.ReplyMapper;
import com.yedam.app.board.service.ReplyService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/spring/*-context.xml",
						"file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml"})
public class ReplyMapperTest {

	@Autowired ReplyMapper replyMapper;
	@Autowired ReplyService replyService;
	@Test
	public void testList2() {
		Criteria cri = new Criteria(1,10);
		List<ReplyVO> replies = replyMapper.getList(cri, 145);
		replies.forEach(reply -> log.info(reply.toString()));
	}
}
