package spring.model2.mvc.view.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model2.mvc.common.Page;
import spring.model2.mvc.common.Search;
import spring.model2.mvc.service.domain.User;
import spring.model2.mvc.service.user.UserService;

//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {

	/// Field
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	// setter Method ���� ����

	public UserRestController() {
		System.out.println(this.getClass());
	}

	@Value("${pageUnit}")
	int pageUnit;
	

	@Value("${pageSize}")
	int pageSize;

	@RequestMapping(value = "json/addUser/{message}", method = RequestMethod.GET)
	public Map<String, Object> addUser(@PathVariable String message) throws Exception {

		System.out.println("/user/addUser : GET");
		System.out.println("message : " + message);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);

		return map;
	}

	@RequestMapping(value = "json/addUser", method = RequestMethod.POST)
	public User addUser( /* @ModelAttribute("user") User user */@RequestBody User user) throws Exception {

		System.out.println("/user/addUser : POST");
		// Business Logic
		userService.addUser(user);

		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping(value = "json/updateUser/{userId}", method = RequestMethod.GET)
	public Map<String, Object> updateUser(@PathVariable("userId") String userId) throws Exception {

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);

		return map;
	}

	@RequestMapping(value = "json/updateUser", method = RequestMethod.POST)
	public Map<String, Object> updateUser(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/updateUser : POST");
		// Business Logic
		userService.updateUser(user);

		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(userService.getUser(user.getUserId()));
		map.put("user", userService.getUser(user.getUserId()));

		return map;
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}

	@RequestMapping(value = "json/checkDuplication", method = RequestMethod.POST)
	public Map<String, Object> checkDuplication(@RequestBody String userId) throws Exception {

		System.out.println("/user/checkDuplication : POST");
		// Business Logic
		boolean result = userService.checkDuplication(userId);
		// Model �� View ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", new Boolean(result));
		map.put("userId", userId);

//		return "forward:/user/checkDuplication.jsp";
		return map;
	}

	@RequestMapping(value = "json/listUser")
	public Map<String, Object> listUser(@RequestBody Search search, HttpServletRequest request) throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}
}