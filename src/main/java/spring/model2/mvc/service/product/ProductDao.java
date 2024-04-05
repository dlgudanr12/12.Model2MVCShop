package spring.model2.mvc.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.Product;

@Mapper
public interface ProductDao {

	public void addProduct(Product product) throws Exception;// end of insertProduct(ProductVO productVO) method

	public Product getProduct(int productNo) throws Exception;

	public List<Product> getProductList(Search search) throws Exception;

	public List<Product> getFullProductList(Search search) throws Exception;

	public void updateProduct(Product product) throws Exception;

	public int getTotalCount(Search search) throws Exception;

	public void updateQuantity(Product product) throws Exception;
}// end of class
