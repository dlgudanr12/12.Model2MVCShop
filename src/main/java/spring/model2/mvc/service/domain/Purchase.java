package spring.model2.mvc.service.domain;

import java.sql.Date;
import java.util.List;

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
public class Purchase {
	
	private int tranNo;
	private Product purchaseProd;
	private User buyer;
	private String paymentOption;
	private String receiverName;
	private String receiverPhone;
	private String divyAddr;
	private String divyRequest;
	private String tranCode;
	private Date orderDate;
	private String divyDate;
	private int tranQuantity;
	
//	public Purchase(){
//	}
//	
//	public User getBuyer() {
//		return buyer;
//	}
//	public void setBuyer(User buyer) {
//		this.buyer = buyer;
//	}
//	public String getDivyAddr() {
//		return divyAddr;
//	}
//	public void setDivyAddr(String divyAddr) {
//		this.divyAddr = divyAddr;
//	}
//	public String getDivyDate() {
//		return divyDate;
//	}
//	public void setDivyDate(String divyDate) {
//		this.divyDate = divyDate;
//	}
//	public String getDivyRequest() {
//		return divyRequest;
//	}
//	public void setDivyRequest(String divyRequest) {
//		this.divyRequest = divyRequest;
//	}
//	public Date getOrderDate() {
//		return orderDate;
//	}
//	public void setOrderDate(Date orderDate) {
//		this.orderDate = orderDate;
//	}
//	public String getPaymentOption() {
//		return paymentOption;
//	}
//	public void setPaymentOption(String paymentOption) {
//		this.paymentOption = paymentOption;
//	}
//	public Product getPurchaseProd() {
//		return purchaseProd;
//	}
//	public void setPurchaseProd(Product purchaseProd) {
//		this.purchaseProd = purchaseProd;
//	}
//	public String getReceiverName() {
//		return receiverName;
//	}
//	public void setReceiverName(String receiverName) {
//		this.receiverName = receiverName;
//	}
//	public String getReceiverPhone() {
//		return receiverPhone;
//	}
//	public void setReceiverPhone(String receiverPhone) {
//		this.receiverPhone = receiverPhone;
//	}
//	public String getTranCode() {
//		return tranCode;
//	}
//	public void setTranCode(String tranCode) {
//		this.tranCode = tranCode;
//	}
//	public int getTranNo() {
//		return tranNo;
//	}
//	public void setTranNo(int tranNo) {
//		this.tranNo = tranNo;
//	}
//	
//	public int getTranQuantity() {
//		return tranQuantity;
//	}
//
//	public void setTranQuantity(int tranQuantity) {
//		this.tranQuantity = tranQuantity;
//	}
//
//	@Override
//	public String toString() {
//		return "PurchaseVO [buyer=" + buyer + ", divyAddr=" + divyAddr
//				+ ", divyDate=" + divyDate + ", divyRequest=" + divyRequest
//				+ ", orderDate=" + orderDate + ", paymentOption="
//				+ paymentOption + ", purchaseProd=" + purchaseProd
//				+ ", receiverName=" + receiverName + ", receiverPhone="
//				+ receiverPhone + ", tranCode=" + tranCode + ", tranNo="
//				+ tranNo + "]";
//	}
}