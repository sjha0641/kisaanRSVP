package com.rsvp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsBidder;
import com.rsvp.entity.Login;
import com.rsvp.exception.kisaanException;
import com.rsvp.services.BidderServices;
import com.rsvp.services.SendMailService;

@Controller
public class BidderController {

	@Autowired
	BidderServices bidderServices;

	@Autowired
	private SendMailService sendMailService;

	@RequestMapping(path = "/registerbidder.rsvp", method = RequestMethod.POST)
	public String addbidder(Bidder bidder,Login login,DetailsBidder detailsbidder,
			@RequestParam("bidderAadhaarfile") MultipartFile bidderAadhaarfile,
			@RequestParam("bidderPanfile") MultipartFile bidderCertificatefile,
			@RequestParam("bidderCertificatefile") MultipartFile bidderPanfile, ModelMap model)
			throws kisaanException, Exception {

		String pathAadhar = "d:/uploads/aadhar/";
		String pathCertificate = "d:/uploads/cartificate/";
		String pathPan = "d:/uploads/pan/";
		String Aadhar = pathAadhar + bidder.getBidderFullName() + bidderAadhaarfile.getOriginalFilename();
		String Certificate = pathCertificate + bidder.getBidderFullName() + bidderCertificatefile.getOriginalFilename();
		String Pan = pathPan + bidder.getBidderFullName() + bidderPanfile.getOriginalFilename();
		try {
			bidderAadhaarfile.transferTo(new File(Aadhar));
			bidderCertificatefile.transferTo(new File(Certificate));
			bidderPanfile.transferTo(new File(Pan));
		} catch (IOException e) {
			e.printStackTrace();
		}
		detailsbidder.setBidderAadhaar(bidder.getBidderFullName() + bidderAadhaarfile.getOriginalFilename());
		detailsbidder.setBidderTraderLicense(bidder.getBidderFullName() + bidderCertificatefile.getOriginalFilename());
		detailsbidder.setBidderPan(bidder.getBidderFullName() + bidderPanfile.getOriginalFilename());
		bidderServices.addBidder(bidder, detailsbidder, login);
		try {
			sendMailService.send(bidder.getLogin().getEmail(), "wellcome to kisaan humari jaan",
					"Thanxs for registering with kisaanRSVP");
			return "displaysusscess.jsp";
		} catch (Exception e) {
			model.put("mailthing", "couldnt send mail");
			return "displaysusscess.jsp";
		}
	}

	@RequestMapping("/loginbidder.rsvp")
	public String loginBidder(Login login, ModelMap model, HttpServletRequest request) throws kisaanException {
		Login loginBidder = bidderServices.loginBidder(login.getEmail(), login.getPassword());
		Bidder bidder = bidderServices.fetchBidderInfo(loginBidder.getUserId());
		System.out.println(bidder.getLogin().getEmail());
		try {

			model.put("loggedBidder", bidder);

			List<Crop> crops = bidderServices.fetchAllCropsForSale();
			model.put("cropsList", crops);

			return "bidderdashboard.jsp";
		} catch (Exception e) {

			// setHeaderToRefreshAfter5secondsand reason is invalid bidder credentials
			e.printStackTrace();
			return "BidderLogin.jsp";
		}
	}

//	@RequestMapping(path = "/bidthecrop.rsvp",method = RequestMethod.POST)
//	public void bidTheCrop(@RequestParam("bidthiscrop") int cropId,ModelMap model) {
//		
//		model.put("crop", cropId);
//		
//	}

	@RequestMapping(path = "/bidding.rsvp")
	public String addCropBiddingDeatils(@RequestParam("bidthiscrop") int cropId, @RequestParam("bid") int bidAmount,
			ModelMap model) throws kisaanException {

		System.out.println(cropId + " " + bidAmount);
		BidDetails detailsOfABid = new BidDetails();
		detailsOfABid.setBidAmount(bidAmount);
		detailsOfABid.setBidStatus("active");
		Bidder bidder = (Bidder) model.get("loggedBidder");
		detailsOfABid.setBidderBid(bidder);

		Crop crop = bidderServices.fetchCropById(cropId);

		detailsOfABid.setCropBid(crop);
		bidderServices.addCropBiddingDeatils(detailsOfABid, crop);
		model.put("msg", " Bid successfully placed ");

		List<Crop> crops = bidderServices.fetchAllCropsForSale();
		model.put("cropsList", crops);

		return "bidderdashboard.jsp";
	}

	@RequestMapping("/activebids.rsvp")
	public void viewAllActiveBidsOfABidder(ModelMap model) {

		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllActiveBidsOfABidder(bidder.getBidderId());
		model.put("activeBidDetails", bidDetails);

	}

	@RequestMapping("/unsuccessfulbids.rsvp")
	public void viewAllUnsuccessfulBidsOfABidder(ModelMap model) {

		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllUnsuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("unsuccessfulBidDetails", bidDetails);

	}

	@RequestMapping("/successfulbids.rsvp")
	public void viewAllSuccessfulBidsOfABidder(ModelMap model) {

		Bidder bidder = (Bidder) model.get("loggedBidder");
		List<BidDetails> bidDetails = bidderServices.viewAllSuccessfulBidsOfABidder(bidder.getBidderId());
		model.put("successfulBidDetails", bidDetails);

	}
}
