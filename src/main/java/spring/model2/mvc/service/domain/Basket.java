package spring.model2.mvc.service.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Basket {
	
	private int basketNo;
	private int prodNo;
	private String userId;
	private int basketQuantity;
	
	private Product basketProd;

//	public Basket() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public int getBasketNo() {
//		return basketNo;
//	}
//
//	public void setBasketNo(int basketNo) {
//		this.basketNo = basketNo;
//	}
//
//	public int getProdNo() {
//		return prodNo;
//	}
//
//	public void setProdNo(int prodNo) {
//		this.prodNo = prodNo;
//	}
//
//	public String getUserId() {
//		return userId;
//	}
//
//	public void setUserId(String userId) {
//		this.userId = userId;
//	}
//
//	public int getBasketQuantity() {
//		return basketQuantity;
//	}
//
//	public void setBasketQuantity(int basketQuantity) {
//		this.basketQuantity = basketQuantity;
//	}
//
//	public Product getBasketProd() {
//		return basketProd;
//	}
//
//	public void setBasketProd(Product basketProd) {
//		this.basketProd = basketProd;
//	}

}
