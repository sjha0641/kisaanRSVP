package com.rsvp.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.rsvp.entity.Admin;
import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Bidder;
import com.rsvp.entity.Crop;
import com.rsvp.entity.Farmer;

@Repository
public class AdminRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public Admin fetch(Admin admin) {
		Query q= entityManager.createQuery("select a from Admin a where a.adminEmail=:em and a.adminPassword=:pwd");
		q.setParameter("em", admin.getAdminEmail());
		q.setParameter("pwd", admin.getAdminPassword());

		return (Admin) q.getSingleResult();
	}
	
	public List<Farmer> fetchAllFarmer(){
		Query q =entityManager.createQuery("select f from Farmer f");
		List<Farmer> list=q.getResultList();
		return list;
	}
	
	public List<Bidder> fetchAllBidder(){
		Query q =entityManager.createQuery("select b from Bidder b");
		List<Bidder> list=q.getResultList();
		return list;
	}

	public List<Crop> fetchAllUnverifiedCrop(){
		Query q =entityManager.createQuery("select f from Crop f where f.cropActiveStatus=:vs");
		q.setParameter("vs", "no");
		List<Crop> list=q.getResultList();
		return list;
	}

	public List<Crop> fetchAllApprovedCrop(){
		Query q =entityManager.createQuery("select f from Crop f where f.cropActiveStatus=:vs");
		q.setParameter("vs", "yes");
		List<Crop> list=q.getResultList();
		return list;
	}
	
	public List<BidDetails> fetchAllBidding(){
		Query q =entityManager.createQuery("select b from BidDetails b where b.bidStatus=:bs");
		q.setParameter("bs", "active");
		List<BidDetails> list=q.getResultList();
		return list;
	}
	
	public List<BidDetails> fetchSoldBidding(){
		Query q =entityManager.createQuery("select b from BidDetails b where b.bidStatus=:bs");
		q.setParameter("bs", "sold");
		List<BidDetails> list=q.getResultList();
		return list;
	}
	
	public List<BidDetails> fetchAllBiddingBasedOnCropId(int cropId){
		Query q =entityManager.createQuery("select b from BidDetails b where b.bidStatus=:bs and b.cropBid.cropId=:cb and b.cropBid.cropSoldStatus=:cs");
		q.setParameter("bs", "active");
		q.setParameter("cb", cropId);
		q.setParameter("cs", "no");
		List<BidDetails> list=q.getResultList();
		return list;
	}
	
	
	@Transactional
	public void approveCrop(int cropId) {
		Crop crop=entityManager.find(Crop.class,cropId);
		crop.setCropActiveStatus("yes");
		entityManager.merge(crop);
	}
	
	@Transactional
	public void approveBid(int cropId, int bidId) {
		Crop crop=entityManager.find(Crop.class, cropId);
		BidDetails bid = entityManager.find(BidDetails.class, bidId);
		crop.setCropSoldStatus("yes");
		crop.setCropActiveStatus("no");
		bid.setBidStatus("sold to you");
		entityManager.merge(crop);
		entityManager.merge(bid);
	}
	
	@Transactional
	public long pendingApproval() {
		Query q =entityManager.createQuery("select count(*) from Crop c where c.cropActiveStatus=:cs");
		q.setParameter("cs", "no");
		long count = (Long) q.getSingleResult();
		return count;
	
	}
	
	
}
