package com.rsvp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsFarmer;
import com.rsvp.entity.Farmer;
import com.rsvp.entity.Insurance;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.repository.FarmerRepository;

@Service
public class FarmerServices {

	@Autowired
	private FarmerRepository farmerRepository;
	
	@Autowired
	private SendMailService sendMailService;
	
	public Login login(String email, String password) throws kisaanException {
		try {
			Login login=farmerRepository.login(email,password);
			return login;
		}catch (Exception e) {
			throw new kisaanException("Invalid Farmer login Credentional");
		}
	}
	
	public Login resetpassword(Login login) {
		return farmerRepository.resetpassword(login);
		
	}
	public Farmer fetchFarmerInfo(int userId) {
		return farmerRepository.fetchFarmerInfo(userId);
	}
	
	public Login forgotPassword(String email) throws kisaanException {
		try {
		return farmerRepository.forgotPassword(email);
		}catch (Exception e) {
			throw new kisaanException("Email not found");
		}
	}
	
	public void saveFarmer(Farmer farmer,Login login,DetailsFarmer detailsFarmer) throws kisaanException {
		
		try {
			farmerRepository.saveFarmer(farmer,login,detailsFarmer);
			}catch (Exception e) {
				throw new kisaanException("couldn't save a farmer");
			}
			try {
			sendMailService.send(farmer.getLogin().getEmail(), "wellcome to kisaan humari jaan", "Thanxs for registering with kisaanRSVP");
			}catch (Exception e) {
				throw new kisaanException("couldn't send an conformation email");
			}
	}
	
	public void placeSellRequest(Crop crop,int farmerId) throws kisaanException {
		try {
		farmerRepository.placeSellRequest(crop,farmerId);
		}catch (Exception e) {
			throw new kisaanException("couldn't place sell request");
		}
	}
	
	public void applyInsurance(Insurance insurance) throws kisaanException {
		try{
			farmerRepository.applyInsurance(insurance);
		}catch (Exception e) {
			throw new kisaanException("couldnt apply for insurance");
		}
	}
	
	public void claimInsurance(Insurance insurance) throws kisaanException {
		try{
			farmerRepository.claimInsurance(insurance);
		}catch (Exception e) {
			throw new kisaanException("couldnt claim insurance");
		}
	}
	
	
	
	public List<Crop> viewSoldCropHistory(int farmerId) throws kisaanException{
		try {
		return farmerRepository.viewSoldCropHistory(farmerId);
		}catch (Exception e) {
			throw new kisaanException("couldnt view history of sold crops");
		}
	}
	
	public List<Crop> viewMarketPlaceByFrmerId(int farmerId) throws kisaanException {
		try {
		return farmerRepository.viewMarketPlaceByFrmerId(farmerId);
		} catch (Exception e) {
			throw new kisaanException("couldnt view market history for you ");
		}
	}
	
	public Crop viewMarketPlaceByCropId(int cropId) throws kisaanException {
		try {
		return farmerRepository.viewMarketPlaceByCropId(cropId);
		} catch (Exception e) {
			throw new kisaanException("couldnt view market place for this paticular crop");
		}
}
	
	
	public List<BidDetails> viewMarketPlaceby(Crop crop) throws kisaanException {
		try{
			return farmerRepository.viewMarketPlaceby(crop);
		}catch (Exception e) {
			throw new kisaanException("couldnt find bid details for this paticular crop");
		}
	}
	
}
