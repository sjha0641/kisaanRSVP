package com.rsvp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
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
	public Login loginBidder(String email, String password) throws kisaanException {

		try {
			Login loginBidder = bidderRepository.loginBidder(email, password);
			return loginBidder;
		} catch (Exception e) {
			e.printStackTrace();
			throw new kisaanException("Unable to Login.Please try again!!!", e);
		}

	}

	public List<Crop> fetchAllCropsForSale() {

		List<Crop> crops = bidderRepository.fetchAllCropsForSale();
		return crops;
	}

	public Bidder fetchBidderInfo(int userId) {
		return bidderRepository.fetchBidderInfo(userId);
	}

	public void addCropBiddingDeatils(BidDetails detailsOfABid, Crop crop) throws kisaanException {

		try {
			bidderRepository.addCropBiddingDetails(detailsOfABid, crop);
		} catch (Exception e) {
			throw new kisaanException("Unable to Add biiding details.Please try again for bidding", e);
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
