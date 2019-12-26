package com.rsvp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsvp.entity.Bidder;
import com.rsvp.entity.DetailsBidder;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.repository.BidderRepository;

@Service
public class BidderServices {
	
	@Autowired
	BidderRepository bidderRepository;
	
	public void addBidder(Bidder bidder,DetailsBidder detailsbidder,Login login) throws kisaanException {
			
	try {
		 bidderRepository.addBidder(bidder, detailsbidder, login);
	}
	catch (Exception e) {
		throw new kisaanException("Unable to Register.Please enter corrct details");
	}
	}
} 
