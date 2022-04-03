package com.dbal.app.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RentVO {
	private int rentNo;
	private int bookNo;
	private String bookName;
	private int rentPrice;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date rentDate;
	private char rentStatus;
	private String count;
}
