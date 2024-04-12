package spring.model2.mvc.service.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.model2.mvc.service.domain.Category;

@Mapper
public interface CategoryDao {
	
	public List<Category> getCategoryList() throws Exception;

}
