package spring.model2.mvc.service.basket.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.basket.BasketDao;
import spring.model2.mvc.service.basket.BasketService;
import spring.model2.mvc.service.domain.Basket;
import spring.model2.mvc.service.product.ProductDao;

@Service("basketService")
@Transactional
public class BasketServiceImpl implements BasketService {

	@Autowired
	@Qualifier("basketDao")
	BasketDao basketDao;
	
	@Autowired
	@Qualifier("productDao")
	ProductDao productDao;

	public BasketServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addBasket(Basket basket) throws Exception {
		basketDao.addBasket(basket);
	}

	@Override
	public Map<String, Object> getBasketList(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Basket> listBasket = new ArrayList<Basket>();
		List<Basket> baskets=basketDao.getBasketList(search, userId);
		for (Basket basket : baskets) {
			basket.setBasketProd(productDao.getProduct(basket.getProdNo()));
			listBasket.add(basket);
		}
		map.put("list", listBasket);
		map.put("totalCount", basketDao.getTotalCount(userId));
		
		return map;
	}

	@Override
	public void removeBasket(Basket basket) throws Exception {
		basketDao.deleteBasket(basket);
	}

	@Override
	public void removeBasketList(String userId) throws Exception {
		basketDao.deleteBasketList(userId);
	}

	@Override
	public void updateBasketQuantity(Basket basket) throws Exception {
		basketDao.updateBasketQuantity(basket);
	}

	@Override
	public List<Basket> purchaseBasketList(String userId) throws Exception {
		List<Basket> listBasket = new ArrayList<Basket>();
		List<Basket> baskets=basketDao.purchaseBasketList(userId);
		for (Basket basket : baskets) {
			basket.setBasketProd(productDao.getProduct(basket.getProdNo()));
			listBasket.add(basket);
		}
		return listBasket;
	}

//	public void setBasketDao(BasketDao basketDao) {
//		this.basketDao = basketDao;
//	}

}
