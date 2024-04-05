package spring.model2.mvc.service.purchase;

import java.util.Map;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Purchase;

public interface PurchaseService {

	public Purchase addPurchase(Purchase purchase) throws Exception;

	public Purchase getPurchase(int tranNo) throws Exception;

	public Purchase updatePurchase(Purchase purchase) throws Exception;

	public Map<String, Object> getPurchaseList(Search search, String divyRequest) throws Exception;

	public void updateTranCode(Purchase purchase) throws Exception;

	public Map<String, Object> getSaleList(Search search) throws Exception;

	public Map<String, Object> getDeliveryList(Search search) throws Exception;
}
