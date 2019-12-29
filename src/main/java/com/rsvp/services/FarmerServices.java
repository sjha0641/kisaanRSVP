package com.rsvp.services;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsFarmer;
import com.rsvp.entity.Farmer;
import com.rsvp.entity.Insurance;
import com.rsvp.entity.Login;
import com.rsvp.exception.KisaanException;
import com.rsvp.repository.FarmerRepository;

@Service
public class FarmerServices {

	@Autowired
	private FarmerRepository farmerRepository;
	
	@Autowired
	private SendMailService sendMailService;
	
	public Login login(String email, String password) throws KisaanException {
		try {
			Login login=farmerRepository.login(email,password);
			return login;
		}catch (Exception e) {
			throw new KisaanException("Invalid Farmer login Credentional");
		}
	}
	
	public Login resetpassword(Login login) {
		return farmerRepository.resetpassword(login);
		
	}
	public Farmer fetchFarmerInfo(int userId) {
		return farmerRepository.fetchFarmerInfo(userId);
	}
	
	public Login forgotPassword(String email) throws KisaanException {
		try {
		return farmerRepository.forgotPassword(email);
		}catch (Exception e) {
			throw new KisaanException("Email not found");
		}
	}
	
	public void saveFarmer(Farmer farmer,Login login,DetailsFarmer detailsFarmer) throws KisaanException {
		
		try {
			farmerRepository.saveFarmer(farmer,login,detailsFarmer);
			}catch (Exception e) {
				throw new KisaanException("couldn't save a farmer");
			}
	}
	
	public void placeSellRequest(Crop crop,int farmerId) throws KisaanException {
		try {
		farmerRepository.placeSellRequest(crop,farmerId);
		}catch (Exception e) {
			throw new KisaanException("couldn't place sell request");
		}
	}
	
	public void applyInsurance(Insurance insurance) throws KisaanException {
		try{
			farmerRepository.applyInsurance(insurance);
		}catch (Exception e) {
			throw new KisaanException("couldnt apply for insurance");
		}
	}
	
	public void claimInsurance(Insurance insurance) throws KisaanException {
		try{
			farmerRepository.claimInsurance(insurance);
		}catch (Exception e) {
			throw new KisaanException("couldnt claim insurance");
		}
	}
	public void updateCurrentbidRequest(Crop crop,int farmerId) {
		farmerRepository.updateCurrentbidRequest(crop, farmerId);	
	}
	
	public List<Crop> UnSoldcrops(int farmerId) {
		List<Crop> list=farmerRepository.UnSoldcrops(farmerId);
		int maxBid=0;
		for(Crop crop:list) {
		List<BidDetails> bidDetailsForCropId=farmerRepository.viewMarketPlaceby(crop.getCropId());
		List<Integer> amount=new ArrayList<Integer>();
		for(BidDetails bid:bidDetailsForCropId) {
			amount.add(bid.getBidAmount());
		}
		try {
		maxBid=Collections.max(amount);
		}catch (Exception e) {
			maxBid=0;
		}
		crop.setCropCurrentBid(maxBid);
		crop.setCropActiveStatus("yes");
		System.out.println("farmerid ==== " + farmerId);
		Farmer farmer=farmerRepository.fetchFarmerInf(farmerId);
		LocalDate currentdate=LocalDate.now();
		if(currentdate.compareTo(crop.getCropLastDateForBid())>0) {
			crop.setCropSoldPrice(maxBid);
			crop.setCropSoldStatus("yes");
		}
		farmerRepository.updateCurrentbidRequest(crop, farmer.getFarmerId());
		}
		List<Crop> updatedlist=farmerRepository.UnSoldcrops(farmerId);
		return updatedlist;
	}
	
	public List<Crop> nonactivecrops(int farmerId) {
		List<Crop> list=farmerRepository.nonactivecrops(farmerId);
		return list;
	}
	
	public List<Crop> viewSoldCropHistory(int farmerId) throws KisaanException{
		try {
		return farmerRepository.viewSoldCropHistory(farmerId);
		}catch (Exception e) {
			throw new KisaanException("Couldn't view history of sold crops");
		}
	}
	
	public List<Crop> viewMarketPlaceByFarmerId(int farmerId) throws KisaanException {
		try {
		return farmerRepository.viewMarketPlaceByFarmerId(farmerId);
		} catch (Exception e) {
			throw new KisaanException("Couldn't view market history for you ");
		}
	}
	
	public Crop viewMarketPlaceByCropId(int cropId) throws KisaanException {
		try {
		return farmerRepository.viewMarketPlaceByCropId(cropId);
		} catch (Exception e) {
			throw new KisaanException("Couldn't view market place for this particular crop");
		}
}
	
	public List<BidDetails> viewMarketPlaceby(int cropid) throws KisaanException {
		try{
			return farmerRepository.viewMarketPlaceby(cropid);
		}catch (Exception e) {
			throw new KisaanException("Couldn't find bid details for this particular crop");
		}
	}
	
}
