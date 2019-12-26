package com.rsvp.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name = "TBL_KISAANFARMER")
public class Farmer {

	@Id
	@GeneratedValue
	private int farmerId;
	
	private String farmerFullName;
	private String farmerContact;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "userid")
	private Login login;
	
	@OneToOne(mappedBy = "farmerDetails",cascade = CascadeType.ALL)
	DetailsFarmer detailsFarmer;

	public int getFarmerId() {
		return farmerId;
	}

	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}

	public String getFarmerFullName() {
		return farmerFullName;
	}

	public void setFarmerFullName(String farmerFullName) {
		this.farmerFullName = farmerFullName;
	}

	public String getFarmerContact() {
		return farmerContact;
	}

	public void setFarmerContact(String farmerContact) {
		this.farmerContact = farmerContact;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public DetailsFarmer getDetailsFarmer() {
		return detailsFarmer;
	}

	public void setDetailsFarmer(DetailsFarmer detailsFarmer) {
		this.detailsFarmer = detailsFarmer;
	}

	@Override
	public String toString() {
		return "Farmer [farmerId=" + farmerId + ", farmerFullName=" + farmerFullName + ", farmerContact="
				+ farmerContact + ", login=" + login + ", detailsFarmer=" + detailsFarmer + "]";
	}

	
	
}
