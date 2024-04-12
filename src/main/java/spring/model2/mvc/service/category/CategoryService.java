package spring.model2.mvc.service.category;

import java.util.List;

import spring.model2.mvc.service.domain.Category;

public interface CategoryService {
	
	public List<Category> getCategoryList() throws Exception;
	
}
