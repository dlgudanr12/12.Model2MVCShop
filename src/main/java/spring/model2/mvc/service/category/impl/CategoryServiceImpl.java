package spring.model2.mvc.service.category.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.model2.mvc.service.category.CategoryDao;
import spring.model2.mvc.service.category.CategoryService;
import spring.model2.mvc.service.domain.Category;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	@Qualifier("categoryDao")
	CategoryDao categoryDao;

	public CategoryServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Category> getCategoryList() throws Exception {
		return categoryDao.getCategoryList();
	}

}
