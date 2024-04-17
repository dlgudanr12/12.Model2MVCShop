package spring.model2.mvc.service.category;

import java.util.List;

import spring.model2.mvc.service.domain.Category;

public interface CategoryService {

	public Category getCategory(int categoryNo) throws Exception;
	
	public List<Category> getCategoryList() throws Exception;
	
	public void addCategory(Category category) throws Exception;
	
	public void updateCategory(Category category) throws Exception;
	
}
