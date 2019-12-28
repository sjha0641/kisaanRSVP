package com.rsvp.component;


import java.time.LocalTime;

import org.springframework.stereotype.Component;

@Component
public class BidEndingTime {
	
	private LocalTime bidEndingTime;
	
	public BidEndingTime() {
		LocalTime time = LocalTime.of(17, 00);
		this.bidEndingTime=time;
		
	}
	

	public LocalTime getBidEndingTime() {
		return bidEndingTime;
	}

	public void setBidEndingTime(LocalTime bidEndingTime) {
		this.bidEndingTime = bidEndingTime;
	}
	
}
