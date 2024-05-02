package spring.model2.mvc.view.product;

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
import spring.model2.mvc.service.domain.Product;
import spring.model2.mvc.service.product.ProductService;

@Controller("productController")
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	@Autowired
	@Qualifier("categoryService")
	private CategoryService categoryService;

	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;

	@Value("${imagePath}")
	String imagePath;

	public ProductController() {
		System.out.println(":: ProductController default Contrctor call : " + this.getClass());
	}
	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProductView(Model model) throws Exception, IOException {
		System.out.println("[addProduct().GET end......]\n");
		model.addAttribute("listCategory",categoryService.getCategoryList());
		System.out.println("[addProduct().GET end......]\n");
		return "forward:/product/addProductView.jsp";
	}

//	@RequestMapping("/addProduct.do")
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,
			@RequestParam("imageFileName") List<MultipartFile> imageFileName, Model model) throws Exception, IOException {

//		System.out.println("\n:: ==> addProduct().POST start......]");
//		if (FileUpload.isMultipartContent(request)) {
//			String temDir = "C:\\Users\\SWCOM\\git\\07.Model2MVCShop-URI-pattern-\\07.Model2MVCShop(URI,pattern)\\src\\main\\webapp\\images\\uploadFiles";
////			 String temDir="/uploadFiles/";
//			DiskFileUpload fileUpload = new DiskFileUpload();
//			fileUpload.setRepositoryPath(temDir);
//			fileUpload.setSizeMax(1024 * 1024 * 10);
//			fileUpload.setSizeThreshold(1024 * 100);
//			if (request.getContentLength() < fileUpload.getSizeMax()) {
//				Product product2 = new Product();
//
//				StringTokenizer token = null;
//
//				List fileItemList = fileUpload.parseRequest(request);
//				int Size = fileItemList.size();
//				for (int i = 0; i < Size; i++) {
//					FileItem fileItem = (FileItem) fileItemList.get(i);
//					if (fileItem.isFormField()) {
//						if (fileItem.getFieldName().equals("manuDate")) {
//							token = new StringTokenizer(fileItem.getString("euc-kr"), "-");
//							String manuDate = token.nextToken() + token.nextToken() + token.nextToken();
//							product2.setManuDate(manuDate);
//						} else if (fileItem.getFieldName().equals("prodName"))
//							product2.setProdName(fileItem.getString("euc-kr"));
//						else if (fileItem.getFieldName().equals("prodDetail"))
//							product2.setProdDetail(fileItem.getString("euc-kr"));
//						else if (fileItem.getFieldName().equals("price"))
//							product2.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
//						else if (fileItem.getFieldName().equals("prodQuantity"))
//							product2.setProdQuantity(Integer.parseInt(fileItem.getString("euc-kr")));
//					} else {
//
//						if (fileItem.getSize() > 0) {
//							int idx = fileItem.getName().lastIndexOf("\\");
//							if (idx == -1) {
//								idx = fileItem.getName().lastIndexOf("/");
//							}
//							String fileName = fileItem.getName().substring(idx + 1);
//							product2.setFileName(fileName);
//							try {
//								File uploadedFile = new File(temDir, fileName);
//								fileItem.write(uploadedFile);
//							} catch (IOException e) {
//								System.out.println(e);
//							}
//						}else {
//							product2.setFileName("../../images/empty.GIF");
//						}
//					}//else
//				}//for
//				productService.addProduct(product2);
//				
//				request.setAttribute("product", product2);
//			}else {
//				int overSize=(request.getContentLength()/1000000);
//				System.out.println("<script>alert(������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB�Դϴ�.");
//				System.out.println("history.back();<script>");
//			}
//		}else {
//			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�.");
//		}

//		String imagePath = "C:\\Users\\bitcamp\\git\\07.Model2MVCShop(URI,pattern)\\07.Model2MVCShop(URI,pattern)\\src\\main\\webapp\\images\\uploadFiles\\";

//		product.setFileName(productService.getFileName(imagePath, imageFileName));
		product.setFileList(productService.getFileList(imagePath, imageFileName));
		model.addAttribute("listCategory",categoryService.getCategoryList());
		productService.addProduct(product);
		model.addAttribute("product", product);

		System.out.println("[addProduct().POST end......]\n");

//		return "forward:/product/addProduct.jsp";
		return "forward:/product/addProduct.jsp";
	}

	@RequestMapping(value = "getProduct/{prodNo}/{menu}", method = RequestMethod.GET)
	public String getProduct(@ModelAttribute("product") Product product, @PathVariable String menu,
			HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("\n:: ==> getProduct().GET start......]");
		System.out.println("ProductController.getProduct.manu : " + menu);

		String resultPath = "";
		String history = "";
		String cookieNewValue;
		
//		List<String> listPR=new ArrayList<String>();
//		listPR.add("������");
//		listPR.add("���");
//		listPR.add("������");
//		String listPRS=listPR.toString().substring(listPR.toString().indexOf("[")+1, 
//				listPR.toString().lastIndexOf("]"));
//		System.out.println("listPRS : "+listPRS);
//		listPR=Arrays.asList(listPRS.split(", "));
//		System.out.println("listPS : "+listPR.toString());

		product = productService.getProduct(product.getProdNo());
		model.addAttribute("product", product);

//		for (Cookie cookie : request.getCookies()) {
//			if (!cookie.getName().equals("history")) {
//				cookie = new Cookie("history", "");
//				cookie.setPath("/");
//				response.addCookie(cookie);
//			}
//		}

		history = product.getProdNo() + ":" + product.getProdName().replaceAll(" ", "_") + "/";
		for (Cookie cookie : request.getCookies()) {
			System.out.println(cookie.getName());
			if (!cookie.getName().equals("history")) {
				cookie = new Cookie("history", "");
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			if (cookie.getName().equals("history")) {
				System.out.println("request.getCookies() : " + cookie.getValue());
				cookieNewValue = cookie.getValue().replaceAll(history, "");
				history += cookieNewValue;
				System.out.println("history= " + history);
				cookie.setValue(history);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
//		Cookie cookie = new Cookie("history", history);
//		cookie.setPath("/");
//		response.addCookie(cookie);

		model.addAttribute("listCategory",categoryService.getCategoryList());
		model.addAttribute("menu", menu);

		resultPath = "forward:/product/getProduct.jsp";
		if (menu != null) {
			if (menu.equals("manage")) {
//				resultPath = "forward:/product/notUpdateProduct.jsp"; //�� �̻� �Ⱦ�
				resultPath = "forward:/product/updateProduct.jsp";
			}
		}

		System.out.println("[getProduct().GET end......]\n");
		return resultPath;
	}

	@RequestMapping(value = "listProduct/{menu}")
	public String listProduct(@ModelAttribute("search") Search search, @PathVariable String menu, Model model)
			throws Exception {

		System.out.println("\n:: ==> listProduct().GET/POST start......]");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listProduct.resultPage ::" + resultPage);
		
		model.addAttribute("listCategory", categoryService.getCategoryList());
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		model.addAttribute("menu", menu);

		System.out.println("[listProduct().GET/POST end......]\n");

		return "forward:/product/listProduct.jsp";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product,
			@RequestParam("imageFileName") List<MultipartFile> imageFileName,
			@RequestParam(name="imageFileName2", required = false) String[] imageFileName2, Model model) throws Exception {

		System.out.println("\n:: ==> updateProduct().POST start......]");

//		String temDir = "C:\\Users\\bitcamp\\git\\07.Model2MVCShop(URI,pattern)\\07.Model2MVCShop(URI,pattern)\\src\\main\\webapp\\images\\uploadFiles\\";
//		String temDir = "C:/Users/SWCOM/git/07.Model2MVCShop-URI-pattern-/07.Model2MVCShop(URI,pattern)/src/main/webapp/images/uploadFiles/";
//		String fileString=imageFileName2.trim();
		String fileString="";
		if(imageFileName2!=null) {
		for(int i=0;i<imageFileName2.length;i++) {
			fileString+=((i!=0) ? ", "+imageFileName2[i] : imageFileName2[i]);
		}}
		System.out.println("imageFileName2, fileString : "+fileString);
		String fileString2=productService.getFileList(imagePath, imageFileName).toString();
		fileString2=fileString2.substring(fileString2.indexOf("[") + 1,
				fileString2.lastIndexOf("]"));
		System.out.println("imageFileName, fileString2 : "+fileString2);
		if(fileString2!="") {
			fileString+=((fileString!="") ? (", "+fileString2) : fileString2);
		}
		
		product.setFileName(fileString);

		productService.updateProduct(product);
		model.addAttribute("listCategory",categoryService.getCategoryList());
		model.addAttribute("product", productService.getProduct(product.getProdNo()));

		System.out.println("[updateProduct().POST end......]\n");

		return "redirect:getProduct/" + product.getProdNo() + "/manage_search";
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
