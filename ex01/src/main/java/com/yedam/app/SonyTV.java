package com.yedam.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SonyTV implements TV {
	
	@Autowired Speaker speaker;
	@Override
	public void turnon() {
		System.out.println("Sony TV turn ON!");
		
	}
	
	@Override
	public void turnoff() {
		System.out.println("Sony TV turn OFF!");
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
