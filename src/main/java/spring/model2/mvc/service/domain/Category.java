package spring.model2.mvc.service.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Category {
	
	private int categoryNo;
	private String categoryName;
	private String categoryDetail;

//	public Category() {
//		// TODO Auto-generated constructor stub
//	}

}
