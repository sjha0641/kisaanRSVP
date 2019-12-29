package com.rsvp.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.codegen.StackMapFrameCodeStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsFarmer;
import com.rsvp.entity.Farmer;
import com.rsvp.entity.Insurance;
import com.rsvp.entity.Login;
import com.rsvp.exception.KisaanException;
import com.rsvp.services.FarmerServices;
import com.rsvp.services.SendMailService;
import com.sun.mail.iap.Response;

@Controller
@SessionAttributes({"farmerInFo","loginCredentials","listOfNonActiveCrop","listOfUnsoldCrops"})
public class FarmerController {

	@Autowired
	private FarmerServices farmerServices;
	
	@Autowired
	private SendMailService sendMailService;
	
	@RequestMapping(path = "/loginFarmers.rsvp", method = RequestMethod.POST)
	public String loginFarmer(Login login, ModelMap model) {
		Login loginFarmer;
		try {
			loginFarmer = farmerServices.login(login.getEmail(), login.getPassword());
			Farmer farmer=farmerServices.fetchFarmerInfo(loginFarmer.getUserId());
			List<Crop> listOfNonActiveCrops=farmerServices.nonactivecrops(farmer.getFarmerId());
			List<Crop> listOfUnsoldCrops=farmerServices.UnSoldcrops(farmer.getFarmerId());
			model.put("listOfNonActiveCrop", listOfNonActiveCrops);
			model.put("listOfUnsoldCrops", listOfUnsoldCrops);
			model.put("loginCredentials", loginFarmer);
			model.put("farmerInFo", farmer);
			return "farmerDashboard.jsp";
		} catch (KisaanException e) {
			model.put("invalidCredentials", "failed to login");
			return "homePage.jsp";
		}
		
	}
	
	@RequestMapping(path = "/dashboard.rsvp")
	public String dashboardthings(ModelMap model) {
		Farmer farmer=(Farmer) model.get("farmerInFo");
		List<Crop> listOfNonActiveCrops=farmerServices.nonactivecrops(farmer.getFarmerId());
		List<Crop> listOfUnsoldCrops=farmerServices.UnSoldcrops(farmer.getFarmerId());
		model.put("listOfUnsoldCrops", listOfUnsoldCrops);
		model.put("listOfNonActiveCrop", listOfNonActiveCrops);
		return"farmerDashboard.jsp";
	}
	
	@RequestMapping(path = "/resetPasswordFarmer.rsvp", method = RequestMethod.POST)
	public String resetpassword(Login login) {
		farmerServices.resetpassword(login);
		return "typeOfUser.jsp";
		
	}
	
	@RequestMapping(path = "/forgotPasswordGeneral.rsvp",method = RequestMethod.POST)
	public String forgotPassword(@RequestParam("email") String emial,ModelMap model) throws KisaanException{
		Login loginGeneral= farmerServices.forgotPassword(emial);
		//sendMailService.send(loginFarmer.getEmail(), "your password is reterived",loginFarmer.password );
		//sendMailService.send(loginFarmer.getEmail(), "your password is reterived", "http://localhost:9090/kisaanRSVP/resetpasswordsample.jsp");
		model.put("passwordGeneral", loginGeneral);
		return "gotPasswordBack.jsp";
	}

	@RequestMapping(path = "/registrationFarmer.rsvp", method = RequestMethod.POST)
	public String saveAFarmer(Farmer farmer, Login login, DetailsFarmer detailsFarmer,
			@RequestParam("farmerAadhaarfile") MultipartFile farmerAadhaarfile,
			@RequestParam("farmerCertificatefile") MultipartFile farmerCertificatefile,
			@RequestParam("farmerPanfile") MultipartFile farmerPanfile, ModelMap model)
			throws KisaanException, Exception {
		
		String pathAadhar = "d:/uploads/aadhar/";
		String pathCertificate = "d:/uploads/certificate/";
		String pathPan = "d:/uploads/pan/";
		String Aadhar = pathAadhar + farmer.getFarmerFullName()+farmerAadhaarfile.getOriginalFilename();
		String Certificate = pathCertificate + farmer.getFarmerFullName()+ farmerCertificatefile.getOriginalFilename();
		String Pan = pathPan + farmer.getFarmerFullName()+ farmerPanfile.getOriginalFilename();
		try {
			farmerAadhaarfile.transferTo(new File(Aadhar));
			farmerCertificatefile.transferTo(new File(Certificate));
			farmerPanfile.transferTo(new File(Pan));
		} catch (IOException e) {
			e.printStackTrace();
		}
		detailsFarmer.setFarmerPan(farmer.getFarmerFullName()+farmerAadhaarfile.getOriginalFilename());
		detailsFarmer.setFarmerAadhaar(farmer.getFarmerFullName()+ farmerCertificatefile.getOriginalFilename());
		detailsFarmer.setFarmerCertificate(farmer.getFarmerFullName()+ farmerPanfile.getOriginalFilename());
		farmerServices.saveFarmer(farmer, login, detailsFarmer);
		try {
		sendMailService.send(farmer.getLogin().getEmail(), "Welcome to Kisaan Humari Jaan", "Thanxs for Registering with kisaanRSVP");
		return "displaySuccess.jsp";
		}catch (Exception e) {
			model.put("mailthing", "couldn't send mail");
			return "displaySuccess.jsp";
		}
	}
	
	@RequestMapping(path = "/sellYourCrop.rsvp", method = RequestMethod.POST)
	public String sellYourCrop(Login login,Crop crop,ModelMap model,@RequestParam("soilphcertificateFile") MultipartFile cropSoilPHCertificate) throws KisaanException {
		String pathSoilPHCertificate = "d:/uploads/SoilPHCertificate/";
		String SoilPHCertificate = pathSoilPHCertificate + login.getEmail()+cropSoilPHCertificate.getOriginalFilename();
		try {
			cropSoilPHCertificate.transferTo(new File(pathSoilPHCertificate));
		} catch (IOException e) {
			e.printStackTrace();
		}
		Farmer farmer=(Farmer) model.get("farmerInFo");
		crop.setCropSoilPHCertificate(login.getEmail()+cropSoilPHCertificate.getOriginalFilename());
		farmerServices.placeSellRequest(crop,farmer.getFarmerId());
		return "redirect:/dashboard.rsvp";
	}
	
	@RequestMapping(path = "/viewSoldCropHistory.rsvp")
	public String viewSoldCropHistory(ModelMap model) throws KisaanException {
		Farmer farmer=(Farmer) model.get("farmerInFo");
		List<Crop> list=farmerServices.viewSoldCropHistory(farmer.getFarmerId());
		model.put("listOfCrops",list);
		return "viewSoldCropHistory.jsp";
	}
	
	@RequestMapping(path = "/viewMarketPlace.rsvp")
	public String viewMarketPlaceByFarmerId(ModelMap model){
		Farmer farmer=(Farmer) model.get("farmerInFo");
		List<Crop> cropsByFarmerId;
		try {
			cropsByFarmerId = farmerServices.viewMarketPlaceByFarmerId(farmer.getFarmerId());
			model.put("listOfCropsByFarmerId", cropsByFarmerId);
			return "viewMarketPlace.jsp";
		} catch (KisaanException e) {
			model.put("errorTab","nothing found for this farmer");
			return "viewMarketPlace.jsp";
		}
	}
	
	@RequestMapping(path = "/view.rsvp")
	public String viewMarketPlaceForCropId(@RequestParam("cropId")int cropid,ModelMap model) {
		Crop cropByCropId;
		int maxBid;
		try {
			cropByCropId = farmerServices.viewMarketPlaceByCropId(cropid);
			List<BidDetails> bidDetailsForCropId=farmerServices.viewMarketPlaceby(cropid);
			List<Integer> amount=new ArrayList<Integer>();
			for(BidDetails bid:bidDetailsForCropId) {
				amount.add(bid.getBidAmount());
			}
			try {
			maxBid=Collections.max(amount);
			cropByCropId.setCropCurrentBid(maxBid);
			cropByCropId.setCropActiveStatus("yes");
			Farmer farmer=(Farmer) model.get("farmerInFo");
			LocalDate currentDate=LocalDate.now();
			if(currentDate.compareTo(cropByCropId.getCropLastDateForBid())>0) {
				cropByCropId.setCropSoldPrice(maxBid);
				cropByCropId.setCropSoldStatus("yes");
			}
			farmerServices.updateCurrentbidRequest(cropByCropId, farmer.getFarmerId());
			model.put("cropByCropId", cropByCropId);
			model.put("bidDetailsByCropId", bidDetailsForCropId);
			model.put("currentBidAmount",maxBid);
			return "viewCropMarketPlace.jsp";
			}catch (Exception e) {
				maxBid=0;
				model.put("cropByCropId", cropByCropId);
				model.put("bidDetailsByCropId", bidDetailsForCropId);
				model.put("currentBidAmount",maxBid);
				return "viewCropMarketPlace.jsp";
			}
			
		} catch (KisaanException e) {
			model.put("errort","nothing found for this crop");
			return "viewCropMarketPlace.jsp";
		}
		
	}

	@RequestMapping(path = "/applyForInsurance.rsvp")
	public String applyinsurance(Insurance insurance,ModelMap model){
		try {
			farmerServices.applyInsurance(insurance);
			model.put("ins", "you have applied it");
			return "farmerDashboard.jsp";
		} catch (KisaanException e) {
			model.put("ins", "failed to apply");
			return "farmerDashboard.jsp";
		}
	}
	
	@RequestMapping(path = "/claimInsurance.rsvp")
	public String claiminsurance(Insurance insurance,ModelMap model) {
		return "";
	}

}
