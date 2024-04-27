package spring.model2.mvc.view.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import spring.model2.mvc.common.Page;
import spring.model2.mvc.common.Search;
import spring.model2.mvc.dto.ProductDto;
import spring.model2.mvc.service.category.CategoryService;
import spring.model2.mvc.service.domain.Product;
import spring.model2.mvc.service.product.ProductService;

@RestController("productRestController")
@RequestMapping("/productRest/*")
public class ProductRestController {

	@Autowired
	@Qualifier("productService")
	private ProductService productService;

	@Autowired
	@Qualifier("categoryService")
	private CategoryService categoryService;

	@Value("${pageUnit}")
//	@Value("${pageUnit!=0 ? pageUnit : 3}")
	int pageUnit;

	@Value("${pageSize}")
//	@Value("${pageSize!=0 ? pageSize : 2}")
	int pageSize;

	@Value("${imagePath}")
//	@Value("${imagePath!=null ? imagePath : '/uploadFiles/'}")
	String imagePath;

	public ProductRestController() {
		System.out.println(":: ProductController default Contrctor call : " + this.getClass());
	}

//	@RequestMapping("/addProduct.do")
	@RequestMapping(value = "/json/addProduct", method = RequestMethod.POST)
	public Map<String, Object> addProduct(@RequestBody ProductDto productDto) throws Exception {
		Product product = productDto.getProduct();
		List<MultipartFile> imageFileName = productDto.getImageFileName();

		System.out.println("\n:: ==> /json/addProduct.POST start......");

		product.setFileList(productService.getFileList(imagePath, imageFileName));
		productService.addProduct(product);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);

		System.out.println("/json/addProduct.POST end......\n");

		return map;
	}

	@RequestMapping(value = "/json/getProduct/{prodNo}/{menu}", method = RequestMethod.GET)
	public Map<String, Object> getProduct(@ModelAttribute("product") Product product, @PathVariable String menu,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\n:: ==> /json/getProduct.GET start......");
		System.out.println("ProductController.getProduct.manu : " + menu);

		String resultPath = "";
		String history = "";
		String cookieNewValue;
		Map<String, Object> map = new HashMap<String, Object>();
		product = productService.getProduct(product.getProdNo());
		map.put("product", product);
		map.put("menu", menu);

		System.out.println("/json/getProduct.GET end......\n");
		return map;
	}

	@RequestMapping(value = "/json/listProduct")
	public Map<String, Object> listProduct(@RequestBody Search search) throws Exception {

		System.out.println("\n:: ==> /json/listProduct.GET/POST start......");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listProduct.resultPage ::" + resultPage);

		map.put("listCategory", categoryService.getCategoryList());
		map.put("resultPage", resultPage);
		map.put("search", search);

		System.out.println("/json/listProduct.GET/POST end......\n");

		return map;
	}

	@RequestMapping(value = "/reactGet/listProduct", method = RequestMethod.GET)
	public Map<String, Object> reactGetListProduct() throws Exception {

		System.out.println("\n:: ==> /reactGet/listProduct.GET start......");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listProduct.resultPage ::" + resultPage);

		map.put("listCategory", categoryService.getCategoryList());
		map.put("resultPage", resultPage);
		map.put("search", search);

		System.out.println("/reactGet/listProduct.GET end......\n");

		return map;
	}
	@RequestMapping(value = "/reactPost/listProduct",method=RequestMethod.POST)
	public Map<String, Object> reactPostlistProduct(@RequestBody Search search) throws Exception {

		System.out.println("\n:: ==> /reactPost/listProduct.POST start......");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listProduct.resultPage ::" + resultPage);

		map.put("listCategory", categoryService.getCategoryList());
		map.put("resultPage", resultPage);
		map.put("search", search);

		System.out.println("/reactPost/listProduct.POST end......\n");

		return map;
	}

	@RequestMapping(value = "/json/fullListProduct", method = RequestMethod.POST)
	public Map<String, Object> fullListProduct(@RequestBody Search search) throws Exception {

		System.out.println("\n:: ==> /json/fullListProduct.POST start......");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getFullProductList(search);

		map.put("search", search);

		System.out.println("/json/fullListProduct.POST end......\n");

		return map;
	}

	@RequestMapping(value = "/json/updateProduct", method = RequestMethod.POST)
	public Map<String, Object> updateProduct(@RequestBody ProductDto productDto) throws Exception {
		Product product = productDto.getProduct();
		List<MultipartFile> imageFileName = productDto.getImageFileName();

		System.out.println("\n:: ==> /json/updateProduct.POST start......]");

		product.setFileList(productService.getFileList(imagePath, imageFileName));
		productService.updateProduct(product);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", productService.getProduct(product.getProdNo()));

		System.out.println("/json/updateProduct.POST end......]\n");

		return map;
	}

//	@RequestMapping("/updateProductView.do")
//	public String updateProductView(@ModelAttribute("product") Product product, Model model) throws Exception {
//
//		System.out.println("\n:: ==> updateProductView() start......]");
//
//		model.addAttribute("product", productService.getProduct(product.getProdNo()));
//
//		System.out.println("[updateProductView() end......]\n");
//
//		return "forward:/product/updateProduct.jsp";
//	}

//	@RequestMapping("/updateQuantity.do")
//	public String updateQuantity(@ModelAttribute("product") Product product, @ModelAttribute("search") Search search,
//			Model model) throws Exception {
//
//		System.out.println("\n:: ==> updateQuantity() start......]");
//
//		productService.updateQuantity(product);
//
//		model.addAttribute("search", search);
//
//		System.out.println("[updateQuantity() end......]\n");
//
//		return "forward:/listProduct.do?menu=manage";
//	}

}
