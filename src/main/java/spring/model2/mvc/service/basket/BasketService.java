package spring.model2.mvc.service.basket;
import java.util.List;
import java.util.Map;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Basket;

public interface BasketService {
	
	public void addBasket(Basket basket) throws Exception;
	
	public Map<String,Object> getBasketList(Search search, String userId) throws Exception;
	
	public void removeBasket(Basket basket) throws Exception;
	
	public void removeBasketList(String userId) throws Exception;
	
	public void updateBasketQuantity(Basket basket) throws Exception;
	
	public List<Basket> purchaseBasketList(String userId) throws Exception;

}
