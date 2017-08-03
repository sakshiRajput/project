package com.swtshop.ShopBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name="Supplier")

public class Supplier {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int supId;
	@Column(name="Supplier_Name")
	private String supName;
	@Column(name="Supplier_Description")
	private String supDesc;
	@Column(name="Price")
	private int supPrice;
	public int getSupId() {
		return supId;
	}
	public void setSupId(int supId) {
		this.supId = supId;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupDesc() {
		return supDesc;
	}
	public void setSupDesc(String supDesc) {
		this.supDesc = supDesc;
	}
	public int getSupPrice() {
		return supPrice;
	}
	public void setSupPrice(int supPrice) {
		this.supPrice = supPrice;
	}
	
	

}
