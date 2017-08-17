package com.swtshop.ShopBackend.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Component
@Table(name="CartDetails")
public class Cart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cartId;
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	public String getCartProdId() {
		return cartProdId;
	}
	public void setCartProdId(String cartProdId) {
		this.cartProdId = cartProdId;
	}
	public String getCartProdName() {
		return cartProdName;
	}
	public void setCartProdName(String cartProdName) {
		this.cartProdName = cartProdName;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getUsermailId() {
		return usermailId;
	}
	public void setUsermailId(String usermailId) {
		this.usermailId = usermailId;
	}
	public MultipartFile getCartImage() {
		return cartImage;
	}
	public void setCartImage(MultipartFile cartImage) {
		this.cartImage = cartImage;
	}
	private int cartPrice;
	private String cartProdId;
	private String cartProdName;
	private int cartQuantity;
	private String usermailId;
	@Transient
	MultipartFile cartImage;
	
}
