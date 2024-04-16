package spring.model2.mvc.view.category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.model2.mvc.common.Page;
import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.category.CategoryService;
import spring.model2.mvc.service.domain.Category;
import spring.model2.mvc.service.domain.Product;
import spring.model2.mvc.service.product.ProductService;

@Controller("categoryRestController")
@RequestMapping("/categoryRest/*")
public class CategoryRestController {

//	@Autowired
//	@Qualifier("productService")
//	private ProductService productService;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryService categoryService;

//	@Value("${pageUnit}")
//	int pageUnit;
//
//	@Value("${pageSize}")
//	int pageSize;
//
//	@Value("${imagePath}")
//	String imagePath;

	public CategoryRestController() {
		System.out.println(":: CategoryController default Contrctor call : " + this.getClass());
	}
	@RequestMapping(value = "json/addCategory", method = RequestMethod.POST)
	public Map<String,Object> addCategory(@RequestBody Category category) throws Exception, IOException {
		System.out.println("[addCategory().POST start......]\n");
		System.out.println("categoryService.addCategory(category) : "+category.getCategoryName()+"/"+category.getCategoryDetail());
		categoryService.addCategory(category);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("success","success!");
		System.out.println("[addCategory().POST end......]\n");
		
		return map;
	}
	@RequestMapping(value = "json/updateCategory", method = RequestMethod.POST)
	public Map<String,Object> updateCategory(@RequestBody Category category) throws Exception, IOException {
		System.out.println("[updateCategory().POST start......]\n");
		System.out.println("categoryService.updateCategory(category) : "+category.getCategoryName()+"/"+category.getCategoryDetail());
		categoryService.updateCategory(category);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("success","success!");
		System.out.println("[updateCategory().POST end......]\n");
		
		return map;
	}

}
