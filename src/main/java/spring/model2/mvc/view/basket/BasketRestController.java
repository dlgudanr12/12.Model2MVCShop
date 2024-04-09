package spring.model2.mvc.view.basket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import spring.model2.mvc.common.Page;
import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.basket.BasketService;
import spring.model2.mvc.service.domain.Basket;
import spring.model2.mvc.service.domain.User;
import spring.model2.mvc.service.product.ProductService;
import spring.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/basketRest/*")
public class BasketRestController {

	@Autowired
	@Qualifier("basketService")
	private BasketService basketService;

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

	public BasketRestController() {
		System.out.println(":: BasketRestController default Contrctor call : " + this.getClass());
	}
	
	@RequestMapping(value="json/updateBasketQuantity/{basketNo}/{basketQuantity}",method=RequestMethod.GET)
	public String updateBasketQuantity(@PathVariable("basketNo") int basketNo,@PathVariable("basketQuantity") int basketQuantity) throws Exception {
		System.out.println("\n:: ==> updateBasketQuantity().GET start......]");
		Basket basket=new Basket();
		basket.setBasketNo(basketNo);
		basket.setBasketQuantity(basketQuantity);
		
		basketService.updateBasketQuantity(basket);

		System.out.println("[updateBasketQuantity().GET end......]\n");
		return "Success!";
	}

}
