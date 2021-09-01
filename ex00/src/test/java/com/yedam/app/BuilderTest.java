package com.yedam.app;

public class BuilderTest {

	public static void main(String[] args) {

		
		Member member = Member.builder()
							  .id("phoebe")
							  .pw("1234")
							  .build();
	}

}
