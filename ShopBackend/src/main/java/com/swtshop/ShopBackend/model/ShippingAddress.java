package com.swtshop.ShopBackend.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Component
@Table(name="ShippingAddress")
public class ShippingAddress implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int shippingAddressId;
	private String shipstreetName;
	private String shipapartNo;
	private String shipcity;
	private String shipstate;
	private String shipcountry;
	private long shipzipcode;
	public int getShippingAddressId() {
		return shippingAddressId;
	}
	public void setShippingAddressId(int shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}
	public String getShipstreetName() {
		return shipstreetName;
	}
	public void setShipstreetName(String shipstreetName) {
		this.shipstreetName = shipstreetName;
	}
	public String getShipapartNo() {
		return shipapartNo;
	}
	public void setShipapartNo(String shipapartNo) {
		this.shipapartNo = shipapartNo;
	}
	public String getShipcity() {
		return shipcity;
	}
	public void setShipcity(String shipcity) {
		this.shipcity = shipcity;
	}
	public String getShipstate() {
		return shipstate;
	}
	public void setShipstate(String shipstate) {
		this.shipstate = shipstate;
	}
	public String getShipcountry() {
		return shipcountry;
	}
	public void setShipcountry(String shipcountry) {
		this.shipcountry = shipcountry;
	}
	public long getShipzipcode() {
		return shipzipcode;
	}
	public void setShipzipcode(long shipzipcode) {
		this.shipzipcode = shipzipcode;
	}

}
