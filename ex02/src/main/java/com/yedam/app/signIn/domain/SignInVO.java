package com.yedam.app.signIn.domain;

import lombok.Data;

@Data
public class SignInVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String birth;
	private String address;

}
