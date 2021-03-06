package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardService {
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
		
		public int getTotalCount(Criteria cri);
		
		public BoardAttachVO attachRead(String uuid);
}
