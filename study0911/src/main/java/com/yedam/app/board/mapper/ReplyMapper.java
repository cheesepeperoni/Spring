package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList(long bno);

	public ReplyVO read(ReplyVO vo);

	public int insert(ReplyVO vo);

	public int update(ReplyVO vo);

	public int delete(ReplyVO vo);

}
