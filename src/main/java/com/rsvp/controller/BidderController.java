package com.rsvp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsvp.entity.Bidder;
import com.rsvp.entity.DetailsBidder;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.services.BidderServices;
import com.rsvp.services.SendMailService;

@Controller
public class BidderController {
	
	@Autowired
	BidderServices bidderServices;
	
	@Autowired
	private SendMailService sendMailService;
	
	@RequestMapping(path = "/addbidder.rsvp", method = RequestMethod.POST)
	public String addFarmer(Bidder bidder,DetailsBidder detailsbidder,Login login,ModelMap model) {
		
		try {
			 bidderServices.addBidder(bidder, detailsbidder, login);
			 sendMailService.send(login.getEmail(), "Thanxs for Registring with us", "Welcome to your website and keep using it");
			return "successfulRegistration.jsp";
		} catch (kisaanException e) {
			return "bidderRegistration.jsp";

		}
		
	} 
}

