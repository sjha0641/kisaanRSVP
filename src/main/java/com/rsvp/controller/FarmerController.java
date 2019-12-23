package com.rsvp.controller;

import java.io.File;
import java.io.IOException;

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

@Controller
@SessionAttributes("farmerID")
public class FarmerController {

	@Autowired
	private FarmerServices farmerServices;

	@Autowired
	Login loginFarmer;

	@RequestMapping(path = "/loginfarmers.rsvp", method = RequestMethod.POST)
	public String loginFarmer(Login login, ModelMap model) throws kisaanException  {
		loginFarmer = farmerServices.login(login.getEmail(), login.getPassword());
		if (loginFarmer!= null) {
			model.put("logincredentials", loginFarmer);
			return "farmerdashbord.jsp";
		} else {
			model.put("invalidcredentials", "failed to login");
			return "Failure.jsp";
		}
	}
	@RequestMapping(path = "/forgotpasswordFarmer.rsvp",method = RequestMethod.POST)
	public String forgotPassword(@RequestParam("email") String emial,ModelMap model) throws kisaanException{
		loginFarmer= farmerServices.forgotPassword(emial);
		model.put("passwordFarmer", loginFarmer);
		return "gotpasswordbackfarmer.jsp";
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
	public String sellYourCrop(Crop crop,ModelMap model,@RequestParam("soilphcertificateFile") MultipartFile cropSoilPHCertificate) {
		//farmerServices.placeSellRequest(crop,farmerId);
		return "";
	}

}
