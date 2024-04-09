package spring.model2.mvc.service.purchase.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Purchase;
import spring.model2.mvc.service.product.ProductDao;
import spring.model2.mvc.service.purchase.PurchaseDao;
import spring.model2.mvc.service.purchase.PurchaseService;
import spring.model2.mvc.service.user.UserDao;

@Service("purchaseService")
@Transactional
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	@Qualifier("purchaseDao")
	private PurchaseDao purchaseDao;
	@Autowired
	@Qualifier("productDao")
	private ProductDao productDao;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Purchase addPurchase(Purchase purchase) throws Exception {
		// ��� ������ ��ǰ ���� ��� �� SQL�� �� �� �����ϱ�.
		purchase.setTranCode("1");
		int newProdQuantity = productDao.getProduct(purchase.getPurchaseProd().getProdNo()).getProdQuantity()
				- purchase.getTranQuantity();
		if (newProdQuantity < 0) {
			purchase.setTranQuantity(purchase.getTranQuantity() + newProdQuantity);
			newProdQuantity = 0;
		}
		purchase.getPurchaseProd().setProdQuantity(newProdQuantity);

		// ����ֱ�
		productDao.updateQuantity(purchase.getPurchaseProd());

		purchase.setPurchaseProd(productDao.getProduct(purchase.getPurchaseProd().getProdNo()));
		if (purchase.getDivyDate() == null || purchase.getDivyDate().equals("")) {
			LocalDate localDate = LocalDate.now();
			purchase.setDivyDate(localDate.plusDays(3).toString());
		}
		purchaseDao.addPurchase(purchase);

		return purchase;
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		Purchase purchase = purchaseDao.getPurchase(tranNo);
		purchase.setBuyer(userDao.getUser(purchase.getBuyer().getUserId()));
		purchase.setPurchaseProd(productDao.getProduct(purchase.getPurchaseProd().getProdNo()));
		
		purchase.setDivyDate(purchase.getDivyDate().substring(0,10));//��¥ �԰�ȭ
		
		purchase.setPaymentOption(purchase.getPaymentOption().trim());
		purchase.setTranCode(purchase.getTranCode().trim());

		return purchase;
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyer_Id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("buyer_Id", buyer_Id);

		List<Purchase> list = purchaseDao.getPurchaseList(map);
		List<Purchase> listPurchase = new ArrayList<Purchase>();
		for (Purchase purchase : list) {
			purchase.setPurchaseProd(productDao.getProduct(purchase.getPurchaseProd().getProdNo()));
			purchase.setPaymentOption(purchase.getPaymentOption().trim());
			purchase.setTranCode(purchase.getTranCode().trim());
			listPurchase.add(purchase);
		}
		map.put("list", listPurchase);
		map.put("totalCount", purchaseDao.getTotalCount(map));

		return map;
	}

	@Override
	public Purchase updatePurchase(Purchase purchase) throws Exception {
		// ��� ������ ��ǰ ���� ��� �� SQL�� �� �� �����ϱ�.
		Purchase defaultPurchase = purchaseDao.getPurchase(purchase.getTranNo());
		int newProdQuantity = productDao.getProduct(defaultPurchase.getPurchaseProd().getProdNo()).getProdQuantity()
				+ defaultPurchase.getTranQuantity()
				- purchase.getTranQuantity();
		System.out.println("PurchaseServiceImpl.���� ��ǰ ��� : " + productDao.getProduct(defaultPurchase.getPurchaseProd().getProdNo()).getProdQuantity());
		System.out.println("PurchaseServiceImpl.���� ���� ���� : " + defaultPurchase.getTranQuantity());
		System.out.println("PurchaseServiceImpl.���� ����� ���� : " + purchase.getTranQuantity());

		if (newProdQuantity < 0) {
			purchase.setTranQuantity(purchase.getTranQuantity() + newProdQuantity);
			newProdQuantity = 0;
		}
		System.out.println("PurchaseServiceImpl.updatePurchase.newProdQuantity : " + newProdQuantity);
		defaultPurchase.getPurchaseProd().setProdQuantity(newProdQuantity);

		// ����ֱ�
		productDao.updateQuantity(defaultPurchase.getPurchaseProd());

		if (purchase.getDivyDate() == null || purchase.getDivyDate().equals("")) {
			LocalDate localDate = LocalDate.now();
			purchase.setDivyDate(localDate.plusDays(3).toString());
		}
		purchaseDao.updatePurchase(purchase);

		return purchaseDao.getPurchase(purchase.getTranNo());
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer tranCode = Integer.parseInt(purchase.getTranCode()) + 1;
		map.put("tranCode", tranCode);
		map.put("purchase", purchase);
		purchaseDao.updateTranCode(map);
	}

	@Override
	public Map<String, Object> getSaleList(Search search) throws Exception {
		return null;
	}

	public Map<String, Object> getDeliveryList(Search search) throws Exception {
		List<Purchase> list = purchaseDao.getDeliveryList(search);
		List<Purchase> listPurchase = new ArrayList<Purchase>();
		for (Purchase purchase : list) {
			purchase.setPurchaseProd(productDao.getProduct(purchase.getPurchaseProd().getProdNo()));
			purchase.setPaymentOption(purchase.getPaymentOption().trim());
			purchase.setTranCode(purchase.getTranCode().trim());
			listPurchase.add(purchase);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", listPurchase);
		map.put("totalCount", purchaseDao.getTotalCountOfDeliveryList(search));

		return map;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

}
