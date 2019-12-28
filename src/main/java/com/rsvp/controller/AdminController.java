package com.rsvp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.rsvp.entity.Admin;
import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.Farmer;
import com.rsvp.services.AdminServices;

@Controller
@SessionAttributes({"loggedInAdmin","listOfUnverifiedCrops","listOfApprovedCrops","listOfBidding","pendingCrop","NoBids"})
public class AdminController {
	
	@Autowired
	private AdminServices adminServices;
	
	@RequestMapping("/adminLogin.rsvp")
	public String adminLogin(HttpSession session, Admin admin1, ModelMap model) {
		try {
			Admin admin=(Admin)adminServices.login(admin1);
			long count=adminServices.pendingApproval();
			model.put("pendingCrop", count);
			model.put("loggedInAdmin", admin);
			return "adminDashboard.jsp";
			
		} catch (Exception e) {
			model.put("errorMsg", "Please login again");
			return "adminLogin.jsp";
			
		}
	}
	
	@RequestMapping("/adminLogout.rsvp")
	public String logout(HttpSession session ) {
	    session.invalidate();
	    return "adminLogin.jsp";
	} 
	
	
	@RequestMapping(path ="/fetchAllFarmers.rsvp")
	public String fetchAllFarmer( ModelMap model) {
		
		List<Farmer> list = adminServices.fetchAllFarmer();
		
		model.put("listOfFarmers", list);
		return "adminFarmerDetails.jsp";
	}
	
	@RequestMapping(path ="/fetchAllBidders.rsvp")
	public String fetchAllBidder( ModelMap model) {
		
		List<Bidder> list = adminServices.fetchAllBidder();
		
		model.put("listOfBidders", list);
		return "adminBidderDetails.jsp";
	}
	
	@RequestMapping(path ="/fetchAllUnverifiedCrops.rsvp")
	public String fetchAllUnverifiedCrop( ModelMap model) {
		
		List<Crop> list = adminServices.fetchAllUnverifiedCrop();
		
		model.put("listOfUnverifiedCrops", list);
		return "adminApproval.jsp";
	}

	@RequestMapping(path ="/fetchAllApprovedCrops.rsvp")
	public String fetchAllApprovedCrop( ModelMap model) {
		
		List<Crop> list = adminServices.fetchAllApprovedCrop();
		model.put("listOfApprovedCrops", list);
		return "adminApprovedCrops.jsp";
	}
	
	@RequestMapping(path ="/fetchAllBidding.rsvp")
	public String fetchAllBidding( ModelMap model) {
		List<BidDetails> list = adminServices.fetchAllBidding();
		model.put("listOfBidding", list);
		return "adminApprovedBids.jsp";
	}
	
	@RequestMapping(path ="/fetchSoldBidding.rsvp")
	public String fetchSoldBidding( ModelMap model) {
		
		List<BidDetails> list = adminServices.fetchSoldBidding();
		
		model.put("listOfSoldBidding", list);
		return "adminSoldCrops.jsp";
	}
	
	@RequestMapping(path ="/fetchAllBiddingBasedOnCropId.rsvp")
	public String fetchAllBiddingBasedOnCropId(@RequestParam("cropId") int cropId, ModelMap model) {
		try {
			List<BidDetails> list = adminServices.fetchAllBiddingBasedOnCropId(cropId);
			model.put("listOfBiddingBasedOnCropId", list);
			return "adminApprovedBids.jsp";
		}catch(Exception e) {
			model.put("NoBids", "No bid for this crop id");
			return "adminApprovedBids.jsp";
				
		}
	
	}
	
	@RequestMapping(path = "/approve.rsvp")
	public String approveCrop(@RequestParam("cropId") int CropId, ModelMap model) {
		try {
			adminServices.approveCrop(CropId);
			return "redirect:fetchAllUnverifiedCrops.rsvp";
		}
		catch(Exception e) {
			model.put("noCrops", "no Crops To Be Approved");
			return "adminApproval.jsp";
		}
	}
	
	@RequestMapping(path = "/approveBid.rsvp")
	public String approveBid(@RequestParam("cropId") int cropId, @RequestParam("bidId") int bidId, ModelMap model) {
		adminServices.approveBid(cropId, bidId);
		return "redirect:fetchAllBidding.rsvp";
	}
	
	
	@RequestMapping(path = "/fetchAllPendingApprovals.rsvp")
	public String pendingApproval(ModelMap model) {
		
			long count=adminServices.pendingApproval();
			model.put("pendingCrop", "Welcome! Pending crops to be approved are: "+count);
			return "adminDashboard.jsp";
		
		
	}
	
	
	
}
