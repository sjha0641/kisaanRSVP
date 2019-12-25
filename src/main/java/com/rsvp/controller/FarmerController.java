package com.rsvp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsFarmer;
import com.rsvp.entity.Farmer;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.services.FarmerServices;
import com.rsvp.services.SendMailService;

@Controller
@SessionAttributes({"farmerInFo","logincredentials"})
public class FarmerController {

	@Autowired
	private FarmerServices farmerServices;
	
	@Autowired
	private SendMailService sendMailService;
	
	@RequestMapping(path = "/loginfarmers.rsvp", method = RequestMethod.POST)
	public String loginFarmer(Login login, ModelMap model) {
		Login loginFarmer;
		try {
			loginFarmer = farmerServices.login(login.getEmail(), login.getPassword());
			Farmer farmer=farmerServices.fetchFarmerInfo(loginFarmer.getUserId());
			model.put("logincredentials", loginFarmer);
			model.put("farmerInFo", farmer);
			return "farmerdashbord.jsp";
		} catch (kisaanException e) {
			model.put("invalidcredentials", "failed to login");
			return "typeofuser.jsp";
		}
		
	}
	
	@RequestMapping(path = "/resetpasswordfarmer.rsvp", method = RequestMethod.POST)
	public String resetpassword(Login login) {
		farmerServices.resetpassword(login);
		return "typeofuser.jsp";
		
	}
	
	@RequestMapping(path = "/forgotpasswordgeneral.rsvp",method = RequestMethod.POST)
	public String forgotPassword(@RequestParam("email") String emial,ModelMap model) throws kisaanException{
		Login loginGeneral= farmerServices.forgotPassword(emial);
		//sendMailService.send(loginFarmer.getEmail(), "your password is reterived",loginFarmer.password );
		//sendMailService.send(loginFarmer.getEmail(), "your password is reterived", "http://localhost:9090/kisaanRSVP/resetpasswordsample.jsp");
		model.put("passwordGeneral", loginGeneral);
		return "gotpasswordback.jsp";
	}

	@RequestMapping(path = "/registrationFarmer.rsvp", method = RequestMethod.POST)
	public String saveAFarmer(Farmer farmer, Login login, DetailsFarmer detailsFarmer,
			@RequestParam("farmerAadhaarfile") MultipartFile farmerAadhaarfile,
			@RequestParam("farmerCertificatefile") MultipartFile farmerCertificatefile,
			@RequestParam("farmerPanfile") MultipartFile farmerPanfile, ModelMap model)
			throws kisaanException, Exception {
		
		String pathAadhar = "d:/uploads/aadhar/";
		String pathCertificate = "d:/uploads/cartificate/";
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
		return "displaysusscess.jsp";
	}
	
	@RequestMapping(path = "/sellyourcrop.rsvp", method = RequestMethod.POST)
	public String sellYourCrop(Login login,Crop crop,ModelMap model,@RequestParam("soilphcertificateFile") MultipartFile cropSoilPHCertificate) throws kisaanException {
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
		return "farmerdashbord.jsp";
	}
	
	@RequestMapping(path = "/viewsoldcrophistory.rsvp")
	public String viewSoldCropHistory(ModelMap model) throws kisaanException {
		Farmer farmer=(Farmer) model.get("farmerInFo");
		List<Crop> list=farmerServices.viewSoldCropHistory(farmer.getFarmerId());
		model.put("ListOfCrops",list);
		return "viewsoldcrophistory.jsp";
	}

}
