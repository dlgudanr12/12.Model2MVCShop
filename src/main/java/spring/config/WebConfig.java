package spring.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import spring.model2.mvc.common.web.LogonCheckInterceptor;


//===================== 추가된 Class  ======================//
// Interceptor 등록하는 WebMvcCongigurer 구현 Bean
//=======================================================//
@Configuration
public class WebConfig implements WebMvcConfigurer {
	
//	@Autowired
//	DataSource dataSource;
	
	@Autowired
	@Qualifier("logonCheckInterceptor")
	private LogonCheckInterceptor logonCheckInterceptor;

	public WebConfig() {
		System.out.println("==> WebConfig default Constructor call.............");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		// URL Pattern 을 확인하고. interceptor 적용유무 등록함.
		registry.addInterceptor(logonCheckInterceptor).addPathPatterns("/user/**", "/product/**", "/purchase/**",
				"/basket/**");
		
	}
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		PropertySourcesPlaceholderConfigurer configurer=new PropertySourcesPlaceholderConfigurer();
		configurer.setLocation( new ClassPathResource("config/common.properties") );
		return configurer;
	}

}
