package spring.model2.mvc.service.basket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Basket;
@Mapper
public interface BasketDao {

	public void addBasket(Basket basket) throws Exception;
	
	public List<Basket> getBasketList(Search search, String userId) throws Exception;
	
	public int getTotalCount(String userId) throws Exception;
	
	public void deleteBasket(Basket basket) throws Exception;
	
	public void deleteBasketList(String userId) throws Exception;

}
