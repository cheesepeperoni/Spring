package com.yedam.app.board.service;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyService {
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("bno") long bno);
	
	public ReplyVO read(ReplyVO vo);

	public int insert(ReplyVO vo);

	public int update(ReplyVO vo);

	public int delete(ReplyVO vo);
}
