package com.yedam.app;

import org.springframework.stereotype.Component;

@Component
public class AppleSpeaker implements Speaker {

	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker volume Up");
	}

	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker volume Down");
		
	}
}
