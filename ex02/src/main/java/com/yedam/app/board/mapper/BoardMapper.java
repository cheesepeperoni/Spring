package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardMapper {
	// CRUD
	// 전체조회
	public List<BoardVO> getList(Criteria cri);
	// 단건조회
	public BoardVO read(BoardVO vo);
	// 등록
	public int insert(BoardVO vo);
	// 수정
	public int update(BoardVO vo);
	// 삭제
	public int delete(BoardVO vo);
	// 전체 데이터 건수
	public int getTotalCount(Criteria cri);
	// 댓글 수
	public void updateReplycnt(@Param("bno") long bno, @Param("amount") int amount);
	
	public BoardAttachVO attachRead(String uuid);
}
