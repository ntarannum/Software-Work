package eMarket.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

// TODO: imports and annotations may be required

import eMarket.EMarketApp;
import eMarket.domain.*;

public class DealFormDto {
	// TODO: implement this class
	
	private List<Product> productList;
	private int productId;
	private double discount;
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private LocalDate startDate; 
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private LocalDate endDate;
	
	public List<Product> getProductList() {
		return EMarketApp.getStore().getProductList();
	}
	
	public void setProductList(List<Product> productList) {
		this.productList = productList;	
	}

	public int getProductId() {
		return productId;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public double getDiscount() {
		return discount;
	}
	
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	public LocalDate getStartDate() {
		return startDate;
	}
	
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	
	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	
}
