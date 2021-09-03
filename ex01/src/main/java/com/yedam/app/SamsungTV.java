package com.yedam.app;

import org.springframework.stereotype.Component;

//@Component
public class SamsungTV implements TV{
	Speaker speaker;
	public void turnon() {
		System.out.println("Samsung TV turn ON!");
	}
	
	public void turnoff() {
		System.out.println("Samsung TV turn OFF!");
	}

	@Override
	public void volumeUp() {
		speaker.volumeUp();
	}
	@Override
	public void volumeDown() {
		speaker.volumeDown();
		
	}

}
