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
import com.rsvp.exception.KisaanException;
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
			return "successfulRegistration.jsp";
		} catch (KisaanException e) {
			return "bidderRegistration.jsp";

		}

	}

	@RequestMapping(path = "/loginBidder.rsvp", method =RequestMethod.POST )
	public String loginBidder(Login login, ModelMap model, HttpServletRequest request) throws KisaanException {
		
		Login loginBidder = bidderServices.loginBidder(login.getEmail(), login.getPassword());
		Bidder bidder = bidderServices.fetchBidderInfo(loginBidder.getUserId());
		
		try {
			model.put("loggedBidder", bidder);
			model.put("bidderName", bidder.getBidderFullName());
			return "bidderDashboard.jsp";
		} catch (Exception e) {
			// setHeaderToRefreshAfter5secondsand reason is invalid bidder credentials
			e.printStackTrace();
			return "bidderLogin.jsp";
		}
	}
	
	@RequestMapping(path= "/fetchAllCrops.rsvp")
	public String fetchAllCropsForSale(ModelMap model) {
		List<Crop> crops = bidderServices.fetchAllCropsForSale();
		model.put("cropsList", crops);
		return "bidCrops.jsp"; 
	}
	
	
	@RequestMapping(path = "/bidding.rsvp")
	public String addCropBiddingDeatils(@RequestParam("bidThisCrop") int cropId, @RequestParam("bidAmount") int bidAmount,
			ModelMap model) throws KisaanException {

		Crop crop = bidderServices.fetchCropById(cropId);
		BidDetails detailsOfABid = new BidDetails();
		detailsOfABid.setBidAmount(bidAmount);
		detailsOfABid.setBidStatus("active");
		Bidder bidder = (Bidder) model.get("loggedBidder");
		detailsOfABid.setBidderBid(bidder);


		detailsOfABid.setCropBid(crop);
		bidderServices.addCropBiddingDeatils(detailsOfABid, crop);
		model.put("successfullBidMsg", " Bid successfully placed ");

		List<Crop> crops = bidderServices.fetchAllCropsForSale();
		model.put("cropsList", crops);
		return "bidCrops.jsp";
		
		
			
		}
		
	

	
	
	@RequestMapping("/activeBids.rsvp")
	public String viewAllActiveBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
				
		List<BidDetails> bidDetails = bidderServices.viewAllActiveBidsOfABidder(bidder.getBidderId());
		model.put("activeBidDetails", bidDetails);
		System.out.println(bidDetails.size());
		return "viewYourBids.jsp";

	}
	
	@RequestMapping("/unsuccessfulBids.rsvp")
	public String viewAllUnsuccessfulBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllUnsuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("unsuccessfulBidDetails", bidDetails);
		return "viewYourBids.jsp";
	}
	
	@RequestMapping("/successfulBids.rsvp")
	public String viewAllSuccessfulBidsOfABidder(ModelMap model) {
		
		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllSuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("successfulBidDetails", bidDetails);
		return "viewYourBids.jsp";
	}
	
	@RequestMapping(path="logoutBidder.rsvp")
	public String logoutBidder(HttpSession session,ModelMap model) {
		session.invalidate();
		model.put("logoutMsg","logged out successfully");
		return "homePage.jsp";
	}
}
