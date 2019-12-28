package com.rsvp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TBL_KISAANDETAILSFARMER")
public class DetailsFarmer {

	@Id
	@GeneratedValue
	private int farmerDetailsId;
	private String farmerAddressLine1;
	private String farmerAddressLine2;
	private String farmerCity;
	private String farmerState;
	private int farmerPinCode;
	private int farmerLandArea;
	private String farmerLandAddress;
	private int farmerLandPinCode;
	private int farmerAccountNo;
	private String farmerIFSCCode;
	private String farmerAadhaar;
	private String farmerPan;
	private String farmerCertificate;
	
	@ManyToOne
	@JoinColumn(name = "farmerId", unique = true)
	Farmer farmerDetails;

	public int getFarmerDetailsId() {
		return farmerDetailsId;
	}

	public void setFarmerDetailsId(int farmerDetailsId) {
		this.farmerDetailsId = farmerDetailsId;
	}

	public String getFarmerAddressLine1() {
		return farmerAddressLine1;
	}

	public void setFarmerAddressLine1(String farmerAddressLine1) {
		this.farmerAddressLine1 = farmerAddressLine1;
	}

	public String getFarmerAddressLine2() {
		return farmerAddressLine2;
	}

	public void setFarmerAddressLine2(String farmerAddressLine2) {
		this.farmerAddressLine2 = farmerAddressLine2;
	}

	public String getFarmerCity() {
		return farmerCity;
	}

	public void setFarmerCity(String farmerCity) {
		this.farmerCity = farmerCity;
	}

	public String getFarmerState() {
		return farmerState;
	}

	public void setFarmerState(String farmerState) {
		this.farmerState = farmerState;
	}

	public int getFarmerPinCode() {
		return farmerPinCode;
	}

	public void setFarmerPinCode(int farmerPinCode) {
		this.farmerPinCode = farmerPinCode;
	}

	public int getFarmerLandArea() {
		return farmerLandArea;
	}

	public void setFarmerLandArea(int farmerLandArea) {
		this.farmerLandArea = farmerLandArea;
	}

	public String getFarmerLandAddress() {
		return farmerLandAddress;
	}

	public void setFarmerLandAddress(String farmerLandAddress) {
		this.farmerLandAddress = farmerLandAddress;
	}

	public int getFarmerLandPinCode() {
		return farmerLandPinCode;
	}

	public void setFarmerLandPinCode(int farmerLandPinCode) {
		this.farmerLandPinCode = farmerLandPinCode;
	}

	public int getFarmerAccountNo() {
		return farmerAccountNo;
	}

	public void setFarmerAccountNo(int farmerAccountNo) {
		this.farmerAccountNo = farmerAccountNo;
	}

	public String getFarmerIFSCCode() {
		return farmerIFSCCode;
	}

	public void setFarmerIFSCCode(String farmerIFSCCode) {
		this.farmerIFSCCode = farmerIFSCCode;
	}

	public String getFarmerAadhaar() {
		return farmerAadhaar;
	}

	public void setFarmerAadhaar(String farmerAadhaar) {
		this.farmerAadhaar = farmerAadhaar;
	}

	public String getFarmerPan() {
		return farmerPan;
	}

	public void setFarmerPan(String farmerPan) {
		this.farmerPan = farmerPan;
	}

	public String getFarmerCertificate() {
		return farmerCertificate;
	}

	public void setFarmerCertificate(String farmerCertificate) {
		this.farmerCertificate = farmerCertificate;
	}

	public Farmer getFarmerDetails() {
		return farmerDetails;
	}

	public void setFarmerDetails(Farmer farmerDetails) {
		this.farmerDetails = farmerDetails;
	}

	@Override
	public String toString() {
		return "DetailsFarmer [farmerDetailsId=" + farmerDetailsId + ", farmerAddressLine1=" + farmerAddressLine1
				+ ", farmerAddressLine2=" + farmerAddressLine2 + ", farmerCity=" + farmerCity + ", farmerState="
				+ farmerState + ", farmerPinCode=" + farmerPinCode + ", farmerLandArea=" + farmerLandArea
				+ ", farmerLandAddress=" + farmerLandAddress + ", farmerLandPinCode=" + farmerLandPinCode
				+ ", farmerAccountNo=" + farmerAccountNo + ", farmerIFSCCode=" + farmerIFSCCode + ", farmerAadhaar="
				+ farmerAadhaar + ", farmerPan=" + farmerPan + ", farmerCertificate=" + farmerCertificate
				+ ", farmerDetails=" + farmerDetails + "]";
	}
	
	
	
}
