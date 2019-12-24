package com.rsvp.entity;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name = "TBL_KISAANCROP")
public class Crop {

	@Id
	@GeneratedValue
	private int cropId;
	private String cropType;
	private String cropName;
	private String cropFertilizerType;
	private int cropQuantity;
	private String cropSoilPHCertificate;
	private LocalDate cropLastDateForBid;
	private int cropBasicPrice;
	private int cropSoldPrice;
	private int cropCurrentBid;
	private String cropActiveStatus;
	private String cropSoldStatus;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "farmerId")
	Farmer farmerCrop;
	
	public int getCropId() {
		return cropId;
	}

	public void setCropId(int cropId) {
		this.cropId = cropId;
	}

	public String getCropType() {
		return cropType;
	}

	public void setCropType(String cropType) {
		this.cropType = cropType;
	}

	public String getCropName() {
		return cropName;
	}

	public void setCropName(String cropName) {
		this.cropName = cropName;
	}

	public String getCropFertilizerType() {
		return cropFertilizerType;
	}

	public void setCropFertilizerType(String cropFertilizerType) {
		this.cropFertilizerType = cropFertilizerType;
	}

	public int getCropQuantity() {
		return cropQuantity;
	}

	public void setCropQuantity(int cropQuantity) {
		this.cropQuantity = cropQuantity;
	}

	public String getCropSoilPHCertificate() {
		return cropSoilPHCertificate;
	}

	public void setCropSoilPHCertificate(String cropSoilPHCertificate) {
		this.cropSoilPHCertificate = cropSoilPHCertificate;
	}

	public LocalDate getCropLastDateForBid() {
		return cropLastDateForBid;
	}

	public void setCropLastDateForBid(LocalDate cropLastDateForBid) {
		this.cropLastDateForBid = cropLastDateForBid;
	}

	public int getCropBasicPrice() {
		return cropBasicPrice;
	}

	public void setCropBasicPrice(int cropBasicPrice) {
		this.cropBasicPrice = cropBasicPrice;
	}

	public int getCropSoldPrice() {
		return cropSoldPrice;
	}

	public void setCropSoldPrice(int cropSoldPrice) {
		this.cropSoldPrice = cropSoldPrice;
	}

	public int getCropCurrentBid() {
		return cropCurrentBid;
	}

	public void setCropCurrentBid(int cropCurrentBid) {
		this.cropCurrentBid = cropCurrentBid;
	}

	public String getCropActiveStatus() {
		return cropActiveStatus;
	}

	public void setCropActiveStatus(String cropActiveStatus) {
		this.cropActiveStatus = cropActiveStatus;
	}

	public String getCropSoldStatus() {
		return cropSoldStatus;
	}

	public void setCropSoldStatus(String cropSoldStatus) {
		this.cropSoldStatus = cropSoldStatus;
	}

	public Farmer getFarmerCrop() {
		return farmerCrop;
	}

	public void setFarmerCrop(Farmer farmerCrop) {
		this.farmerCrop = farmerCrop;
	}

	@Override
	public String toString() {
		return "Crop [cropId=" + cropId + ", cropType=" + cropType + ", cropName=" + cropName + ", cropFertilizerType="
				+ cropFertilizerType + ", cropQuantity=" + cropQuantity + ", cropSoilPHCertificate="
				+ cropSoilPHCertificate + ", cropLastDateForBid=" + cropLastDateForBid + ", cropBasicPrice="
				+ cropBasicPrice + ", cropSoldPrice=" + cropSoldPrice + ", cropCurrentBid=" + cropCurrentBid
				+ ", cropActiveStatus=" + cropActiveStatus + ", cropSoldStats=" + cropSoldStatus + ", farmerCrop="
				+ farmerCrop + "]";
	}

}
