package com.rsvp.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsvp.component.BidEndingTime;
import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.Login;
import com.rsvp.exception.KisaanException;
import com.rsvp.repository.BidderRepository;

@Service 
public class BidderServices {

	@Autowired
	BidderRepository bidderRepository;
	
	@Autowired
	BidEndingTime bidEndingTime;

	public Bidder addFarmer(Bidder bidder) throws KisaanException {

		try {
			Bidder bidder1 = bidderRepository.addBidder(bidder);
			return bidder1;
		} catch (Exception e) {
			throw new KisaanException("Unable to Register.Please try again with valid credentials.", e);
		} 
	}

	public Login loginBidder(String email, String password) throws KisaanException {

		try {
			Login loginBidder = bidderRepository.loginBidder(email, password);
			return loginBidder;
		} catch (Exception e) {
			e.printStackTrace();
			throw new KisaanException("Unable to Login.Please try again!!!", e);
		}

	}

	public List<Crop> fetchAllCropsForSale() {
		
		List<Crop> finalcropslist = new ArrayList<Crop>();
		LocalDate date = LocalDate.now(); 
		List<Crop> crops = bidderRepository.fetchAllCropsForSale(date);
		
		LocalTime  time = LocalTime.now();
		if(time.getHour()<bidEndingTime.getBidEndingTime().getHour()) {
			List<Crop> crops2 = bidderRepository.fetchAllCropsForSale1(date);
			crops.addAll(crops2);
		}
		return crops;
	}

	public Bidder fetchBidderInfo(int userId) {
		return bidderRepository.fetchBidderInfo(userId);
	}

	public void addCropBiddingDeatils(BidDetails detailsOfABid, Crop crop) throws KisaanException {

		try {
			bidderRepository.addCropBiddingDetails(detailsOfABid, crop);
		} catch (Exception e) {
			throw new KisaanException("Unable to Add biiding details.Please try again for bidding", e);
		}
	}

	public Crop fetchCropById(int cropId) {

		return bidderRepository.fetchCropById(cropId);

	}

	public List<BidDetails> viewAllActiveBidsOfABidder(int bidderId) {

		return bidderRepository.viewAllActiveBidsOfABidder(bidderId);

	}

	public List<BidDetails> viewAllSuccessfulBidsOfABidder(int bidderId) {

		return bidderRepository.viewAllSuccessfulBidsOfABidder(bidderId);

	}
	
	public List<BidDetails> viewAllUnsuccessfulBidsOfABidder(int bidderId) {

		return bidderRepository.viewAllUnsuccessfulBidsOfABidder(bidderId);

	}

}
