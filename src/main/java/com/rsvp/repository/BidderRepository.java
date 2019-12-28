package com.rsvp.repository;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.Login;

@Repository
public class BidderRepository {

	@PersistenceContext
	EntityManager entityManager;

	@Transactional
	public Bidder addBidder(Bidder bidder) {

		return entityManager.merge(bidder);
	}

	public Login loginBidder(String email, String password) {

		Query q = entityManager.createQuery("select l from Login l where l.email=:em and l.password=:pa");
		q.setParameter("em", email);
		q.setParameter("pa", password);
		return (Login) q.getSingleResult();

	}

	public List<Crop> fetchAllCropsForSale(LocalDate date) {

		String SQL = " select c from Crop c where c.cropActiveStatus =:cas and c.cropSoldStatus =:css and c.cropLastDateForBid >:dt ";
		Query q = entityManager.createQuery(SQL);
		q.setParameter("cas", "yes");
		q.setParameter("css", "no");
		q.setParameter("dt", date);
		List<Crop> crops = q.getResultList();

		return crops;
	}

	public List<Crop> fetchAllCropsForSale1(LocalDate date) {

		String SQL = " select c from Crop c where c.cropActiveStatus =:cas and c.cropSoldStatus =:css and c.cropLastDateForBid =:dt ";
		Query q = entityManager.createQuery(SQL);
		q.setParameter("cas", "yes");
		q.setParameter("css", "no");
		q.setParameter("dt", date);
		List<Crop> crops = q.getResultList();

		return crops;
	}

	@Transactional
	public void addCropBiddingDetails(BidDetails detailsOfABid, Crop crop) {

		entityManager.merge(detailsOfABid);

		crop.setCropCurrentBid(detailsOfABid.getBidAmount());
		entityManager.merge(crop);

	}

	public Bidder fetchBidderInfo(int userId) {
		Query q = entityManager.createQuery("select b from Bidder b where b.login.userId=:lid");
		q.setParameter("lid", userId);
		return (Bidder) q.getSingleResult();
	}

	public Crop fetchCropById(int cropId) {

		Crop crop = entityManager.find(Crop.class, cropId);
		return crop;
	}

	public List<BidDetails> viewAllActiveBidsOfABidder(int bidderId) {

		Query q = entityManager
				.createQuery("select bd from BidDetails bd where bd.bidderBid.bidderId =:bid and bd.bidStatus =:bs");
		q.setParameter("bid", bidderId);
		String status = "active";
		q.setParameter("bs", status);
		List<BidDetails> bidDetails = q.getResultList();
		return bidDetails;

	}

	public List<BidDetails> viewAllSuccessfulBidsOfABidder(int bidderId) {

		Query q = entityManager
				.createQuery("select bd from BidDetails bd where bd.bidderBid.bidderId =:bid and bd.bidStatus =:bs");
		q.setParameter("bid", bidderId);
		String status = "soldtoyou";
		q.setParameter("bs", status);
		List<BidDetails> bidDetails = q.getResultList();
		return bidDetails;

	}

	public List<BidDetails> viewAllUnsuccessfulBidsOfABidder(int bidderId) {

		Query q = entityManager
				.createQuery("select bd from BidDetails bd where bd.bidderBid.bidderId =:bid and bd.bidStatus =:bs");
		q.setParameter("bid", bidderId);
		String status = "sold";
		q.setParameter("bs", status);
		List<BidDetails> bidDetails = q.getResultList();
		return bidDetails;

	}
}
