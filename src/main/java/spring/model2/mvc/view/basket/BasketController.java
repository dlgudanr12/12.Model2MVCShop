package spring.model2.mvc.view.basket;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.model2.mvc.common.Page;
import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.basket.BasketService;
import spring.model2.mvc.service.domain.Basket;
import spring.model2.mvc.service.domain.Purchase;
import spring.model2.mvc.service.domain.User;
import spring.model2.mvc.service.product.ProductDao;
import spring.model2.mvc.service.product.ProductService;
import spring.model2.mvc.service.purchase.PurchaseService;
import spring.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/basket/*")
public class BasketController {

	@Autowired
	@Qualifier("basketService")
	private BasketService basketService;
	
	@Autowired
	@Qualifier("purchaseService")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productService")
	private ProductService productService;

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;

	public BasketController() {
		System.out.println(":: BasketController default Contrctor call : " + this.getClass());
	}

	@RequestMapping(value="addBasket/{prodNo}", method = RequestMethod.GET)
	public ModelAndView addBasket(@ModelAttribute("basket") Basket basket, HttpSession session,
			ModelAndView modelAndView) throws Exception {

		System.out.println("\n:: ==> addBasket().GET start......]");
		User user = (User) session.getAttribute("user");
		basket.setUserId(user.getUserId());
		basket.setBasketQuantity(1);

		basketService.addBasket(basket);
		modelAndView.setViewName("redirect:/product/getProduct/"+basket.getProdNo()+"/search");

		System.out.println("[addBasket().GET end......]\n");

		return modelAndView;
	}

	@RequestMapping(value="listBasket")
	public ModelAndView listBasket(@ModelAttribute("search") Search search, HttpSession session,
			ModelAndView modelAndView) throws Exception {
		System.out.println("\n:: ==> listBasket().GET start......]");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = basketService.getBasketList(search,
				((User) session.getAttribute("user")).getUserId());
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listBasket.resultPage ::" + resultPage);

		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/basket/listBasket.jsp");

		System.out.println("[listBasket().GET end......]\n");
		return modelAndView;
	}

	@RequestMapping(value="removeBasket/{basketNo}", method = RequestMethod.GET)
	public ModelAndView removeBasket(@ModelAttribute("basket") Basket basket, @ModelAttribute("search") Search search,
			HttpSession session, ModelAndView modelAndView) throws Exception {

		System.out.println("\n:: ==> removeBasket().GET start......]");
		User user = (User) session.getAttribute("user");
		
		System.out.println("basketController.removeBasket.basketNo : "+basket.getBasketNo());
		basket.setUserId(user.getUserId());

		basketService.removeBasket(basket);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/basket/listBasket");

		System.out.println("[removeBasket().GET end......]\n");

		return modelAndView;
	}

	@RequestMapping(value="removeBasketList", method = RequestMethod.GET)
	public ModelAndView removeBasketList(@ModelAttribute("search") Search search,
			HttpSession session, ModelAndView modelAndView) throws Exception {

		System.out.println("\n:: ==> removeBasketList().GET start......]");
		User user = (User) session.getAttribute("user");
		
		basketService.removeBasketList( user.getUserId() );
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/basket/listBasket");

		System.out.println("[removeBasketList().GET end......]\n");

		return modelAndView;
	}

	@RequestMapping(value="purchaseBasketList", method = RequestMethod.GET)
	public ModelAndView purchaseBasketListView(@ModelAttribute("search") Search search,
			HttpSession session, ModelAndView modelAndView) throws Exception {

		System.out.println("\n:: ==> purchaseBasketList().GET start......]");
		User user = (User) session.getAttribute("user");

		modelAndView.addObject("user",user);
		modelAndView.addObject("list",basketService.purchaseBasketList( user.getUserId() ));
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/basket/purchaseBasketListView.jsp");

		System.out.println("[purchaseBasketList().GET end......]\n");

		return modelAndView;
	}

	@RequestMapping(value="purchaseBasketList", method = RequestMethod.POST)
	public ModelAndView purchaseBasketList(@RequestParam("buyerId") String buyerId,@RequestParam("prodNo") int[] prodNo,
			@RequestParam("tranQuantity") int[] tranQuantity,@ModelAttribute("purchase") Purchase purchase, 
			@ModelAttribute("search") Search search,HttpSession session, 
			ModelAndView modelAndView) throws Exception {

		System.out.println("\n:: ==> purchaseBasketList().POST start......]");
//		User user = (User) session.getAttribute("user");
		purchase.setBuyer(userService.getUser(buyerId));
		
		for(int i=0;i<prodNo.length;i++) {
			purchase.setPurchaseProd(productService.getProduct(prodNo[i]));
			purchase.setTranQuantity(tranQuantity[i]);
			purchaseService.addPurchase(purchase);
		}

		modelAndView.addObject("purchase",purchase);
		modelAndView.addObject("list",basketService.purchaseBasketList( buyerId ));
		
		basketService.removeBasketList(buyerId);
		
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/basket/purchaseBasketList.jsp");

		System.out.println("[purchaseBasketList().POST end......]\n");

		return modelAndView;
	}

}
