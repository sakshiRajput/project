package com.swtshop.ShopBackend.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import org.springframework.stereotype.Component;


@Entity
@Component
@Table(name="Cart")
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getProdName() {
		return ProdName;
	}
	public void setProdName(String prodName) {
		ProdName = prodName;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String username;
	private Long Price;
	
	
	public Long getPrice() {
		return Price;
	}
	public void setPrice(Long price) {
		Price = price;
	}
	//private String cartProdId;
	@Column(name = "product_name")
	private String ProdName;
	private int Quantity;
	private String status;
	@Column(name = "date_added")
	private Date dateAdded;
    private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false, updatable = false, insertable = false)
	private User user;
    

	
}
