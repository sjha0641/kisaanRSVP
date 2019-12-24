package com.rsvp.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.rsvp.entity.BidDetails;
import com.rsvp.entity.Crop;
import com.rsvp.entity.DetailsFarmer;
import com.rsvp.entity.Farmer;
import com.rsvp.entity.Insurance;
import com.rsvp.entity.Login;

@Repository
public class FarmerRepository {

	@PersistenceContext
	private EntityManager entityManager;

	public Login login(String email, String password) {
		Query q = entityManager.createQuery("select l from Login l where l.email=:em and l.password=:pa");
		q.setParameter("em", email);
		q.setParameter("pa", password);
		return (Login) q.getSingleResult();
	}
	
	public Farmer fetchFarmerInfo(int userId) {
		Query q= entityManager.createQuery("select f from Farmer f where f.login.userId=:lid");
		q.setParameter("lid", userId);
		return (Farmer) q.getSingleResult();
	}
	
	@Transactional
	public Login resetpassword(Login login) {
		Login loginr=entityManager.find(Login.class,login.getUserId());
		loginr.setPassword(login.getPassword());
		return entityManager.merge(loginr);
		
	}
	public Login forgotPassword(String email) {
		Query q = entityManager.createQuery("select l from Login l where l.email=:em");
		q.setParameter("em", email);
		Login login=(Login) q.getSingleResult();
		return login;
	}

	@Transactional
	public void saveFarmer(Farmer farmer,Login login,DetailsFarmer detailsFarmer) {
		farmer.setDetailsFarmer(detailsFarmer);
		farmer.setLogin(login);
		entityManager.persist(farmer);
	}

	@Transactional
	public void placeSellRequest(Crop crop,int farmerId) {
		Farmer farmer=entityManager.find(Farmer.class, farmerId);
		crop.setFarmerCrop(farmer);
		crop.setCropActiveStatus("no");
		crop.setCropCurrentBid(0);
		crop.setCropSoldPrice(0);
		crop.setCropSoldStatus("no");	
		entityManager.persist(crop);
	}

	@Transactional
	public void applyInsurance(Insurance insurance) {
		insurance.setInsuranceCompany("LTI");
		insurance.setNameOfInsuree("ABC1");
		insurance.setClaimStatus("no");
		entityManager.persist(insurance);
	}

	public void claimInsurance(Insurance insurance) {
		Query q = entityManager.createQuery(
				"update Insurance i set i.causeOfLoss=:col and i.dateOfLoss=:dol and i.claimStatus=:cs where i.policyNo=:pn");
		q.setParameter("col", insurance.getCauseOfLoss());
		q.setParameter("dol", insurance.getDateOfLoss());
		q.setParameter("cs", "yes");
		q.setParameter("pn", insurance.getPolicyNo());
		Insurance insurance2=(Insurance) q.getSingleResult();
	}
	
	public List<Crop> viewSoldCropHistory(int farmerId) {
		Query q=entityManager.createQuery("select c from Crop c where c.farmerCrop.farmerId=:fid and c.cropSoldStatus=:css");
		q.setParameter("fid", farmerId);
		q.setParameter("css", "yes");
		List<Crop> list=q.getResultList();
		return list;
	}

	public List<Crop> viewMarketPlaceByFrmerId(int farmerId){
		Query q=entityManager.createQuery("select c from Crop c where c.Farmer.farmerID=:fid");
		q.setParameter("cid", farmerId);	
		List<Crop> list=q.getResultList();
		return	list;		
	}
	public Crop viewMarketPlaceByCropId(int cropId) {
		Query q=entityManager.createQuery("select c from Crop c where c.cropId=:cid");
		q.setParameter("cid", cropId);
		return (Crop) q.getSingleResult();
	}
	public List<BidDetails> viewMarketPlaceby(Crop crop) {
		Query q= entityManager.createQuery("select b from BidDetails b where b.Crop.cropId=:cid");
		q.setParameter("cid", crop.getCropId());
		List<BidDetails> bidDetails=q.getResultList();
		return bidDetails;
	}
}
