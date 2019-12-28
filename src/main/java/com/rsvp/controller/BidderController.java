package com.rsvp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.services.BidderServices;

@Controller
@SessionAttributes("loggedBidder")
public class BidderController {

	@Autowired
	BidderServices bidderServices;

	@RequestMapping(path = "/addFarmer.rsvp", method = RequestMethod.POST)
	public String addFarmer(Bidder bidder, ModelMap model) {

		try {
			Bidder bidder1 = bidderServices.addFarmer(bidder);
			model.put("bidder1", bidder1);
			return "successfulregistration.jsp";
		} catch (kisaanException e) {
			return "bidderregistration.jsp";

		}

	}

	@RequestMapping(path = "/loginbidder.rsvp", method =RequestMethod.POST )
	public String loginBidder(Login login, ModelMap model, HttpServletRequest request) throws kisaanException {
		
		Login loginBidder = bidderServices.loginBidder(login.getEmail(), login.getPassword());
		Bidder bidder = bidderServices.fetchBidderInfo(loginBidder.getUserId());
		
		try {
			model.put("loggedBidder", bidder);
			model.put("biddername", bidder.getBidderFullName());
			return "bidderdashboard.jsp";
		} catch (Exception e) {
			// setHeaderToRefreshAfter5secondsand reason is invalid bidder credentials
			e.printStackTrace();
			return "BidderLogin.jsp";
		}
	}
	
	@RequestMapping(path= "/fetchallcrops.rsvp")
	public String fetchAllCropsForSale(ModelMap model) {
		List<Crop> crops = bidderServices.fetchAllCropsForSale();
		model.put("cropsList", crops);
		return "bidcrops.jsp"; 
	}
	
	
	@RequestMapping(path = "/bidding.rsvp")
	public String addCropBiddingDeatils(@RequestParam("bidthiscrop") int cropId, @RequestParam("bidamount") int bidAmount,
			ModelMap model) throws kisaanException {

		Crop crop = bidderServices.fetchCropById(cropId);
		BidDetails detailsOfABid = new BidDetails();
		detailsOfABid.setBidAmount(bidAmount);
		detailsOfABid.setBidStatus("active");
		Bidder bidder = (Bidder) model.get("loggedBidder");
		detailsOfABid.setBidderBid(bidder);


		detailsOfABid.setCropBid(crop);
		bidderServices.addCropBiddingDeatils(detailsOfABid, crop);
		model.put("successfullbidmsg", " Bid successfully placed ");

		List<Crop> crops = bidderServices.fetchAllCropsForSale();
		model.put("cropsList", crops);
		return "bidcrops.jsp";
		
		
			
		}
		
	

	
	
	@RequestMapping("/activebids.rsvp")
	public String viewAllActiveBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
				
		List<BidDetails> bidDetails = bidderServices.viewAllActiveBidsOfABidder(bidder.getBidderId());
		model.put("activeBidDetails", bidDetails);
		System.out.println(bidDetails.size());
		return "viewyourbids.jsp";

	}
	
	@RequestMapping("/unsuccessfulbids.rsvp")
	public String viewAllUnsuccessfulBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllUnsuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("unsuccessfulBidDetails", bidDetails);
		return "viewyourbids.jsp";
	}
	
	@RequestMapping("/successfulbids.rsvp")
	public String viewAllSuccessfulBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllSuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("successfulBidDetails", bidDetails);
		return "viewyourbids.jsp";
	}
	
	@RequestMapping(path="logoutbidder.rsvp")
	public String logoutBidder(HttpSession session,ModelMap model) {
		session.invalidate();
		model.put("logoutmsg","logged out successfully");
		return "HomePage.jsp";
	}
}
