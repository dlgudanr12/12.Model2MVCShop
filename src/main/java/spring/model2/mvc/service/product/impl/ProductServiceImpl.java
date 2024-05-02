package spring.model2.mvc.service.product.impl;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Product;
import spring.model2.mvc.service.product.ProductDao;
import spring.model2.mvc.service.product.ProductService;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	@Qualifier("productDao")
	private ProductDao productDao;

	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
	}

	public Product getProduct(int productNo) throws Exception {
		return productDao.getProduct(productNo);
	}

	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public Map<String, Object> getFullProductList(Search search) throws Exception {
		List<Product> fullList = productDao.getFullProductList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullList", fullList);
		return map;
	}

	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}

	public void setProductDAO(ProductDao productDao) {
		this.productDao = productDao;
	}

	public void updateQuantity(Product product) throws Exception {
		productDao.updateQuantity(product);
	}

	@Override
	public String getFileName(String imagePath, MultipartFile imageFileName) throws Exception {
		String originFileName="";
		if( !(imageFileName.getOriginalFilename()==null ||imageFileName.getOriginalFilename().trim().equals("")) ) {
		originFileName = imageFileName.getOriginalFilename();
//		UUID uuid = UUID.randomUUID();
//		String savedFileName = uuid.toString().substring(0,8) + "_" + originFileName;
//		File newFile = new File(imagePath + savedFileName);
//		imageFileName.transferTo(newFile);
//		return savedFileName;
		
//		File newFile = new File(imagePath + originFileName);
//		imageFileName.transferTo(newFile);
		FileCopyUtils.copy(imageFileName.getInputStream(), new FileOutputStream(imagePath + originFileName));
		}
		return originFileName;
	}

	@Override
	public List<String> getFileList(String imagePath, List<MultipartFile> imageFileName) throws Exception {
		List<String> originFileName=new ArrayList<String>();
		for(MultipartFile multipartFile:imageFileName) {
			if( !(multipartFile.getOriginalFilename()==null ||multipartFile.getOriginalFilename().trim().equals("")) ) {
			originFileName.add(multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(imagePath + multipartFile.getOriginalFilename()));
			}
		}
		System.out.println("originFileName.toString() :"+originFileName.toString());
		return originFileName;
	}
}
