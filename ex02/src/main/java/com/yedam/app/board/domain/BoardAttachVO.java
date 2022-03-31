package com.yedam.app.board.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;	// 파일타입을 char->boolean으로바꿈
  
  private Long bno;
  
}
