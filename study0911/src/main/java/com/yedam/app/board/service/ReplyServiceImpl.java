package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.ReplyMapper;
@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVO> getList(long bno) {
		// TODO Auto-generated method stub
		return replyMapper.getList(bno);
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.read(vo);
	}

	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.update(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.delete(vo);
	}

}
