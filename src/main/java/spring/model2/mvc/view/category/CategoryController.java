package spring.model2.mvc.view.category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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

@Controller("categoryController")
@RequestMapping("/category/*")
public class CategoryController {

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

	public CategoryController() {
		System.out.println(":: CategoryController default Contrctor call : " + this.getClass());
	}
	@RequestMapping(value = "addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category,Model model) throws Exception, IOException {
		System.out.println("[addCategory().GET start......]\n");
		categoryService.addCategory(category);
		System.out.println("[addCategory().GET end......]\n");
		return "redirect:/success.jsp";
	}
	@RequestMapping(value = "updateCategoryView", method = RequestMethod.GET)
	public String updateCategory(Model model) throws Exception, IOException {
		System.out.println("[updateCategory().GET start......]\n");
		model.addAttribute("listCategory",categoryService.getCategoryList());
		System.out.println("[updateCategory().GET end......]\n");
		return "forward:/category/updateCategoryView.jsp";
	}

}
