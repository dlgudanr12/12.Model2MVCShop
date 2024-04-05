package spring.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Purchase;
@Mapper
public interface PurchaseDao {

	public Purchase getPurchase(int tranNo) throws Exception;

	public void addPurchase(Purchase purchase) throws Exception;

	public void updatePurchase(Purchase purchase) throws Exception;

	public void updateTranCode(Map<String, Object> map) throws Exception;

	public List<Purchase> getPurchaseList(Map<String, Object> map) throws Exception;

	public int getTotalCount(Map<String, Object> map) throws Exception;

	public Map<String, Object> getSaleList(Search search);

	public List<Purchase> getDeliveryList(Search search) throws Exception;

	public int getTotalCountOfDeliveryList(Search search) throws Exception;
}
