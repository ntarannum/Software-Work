package app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.runner.RunWith
import spock.lang.Specification;
import spock.lang.Unroll
import eMarket.controller.*
import eMarket.domain.*

@ContextConfiguration
@WebMvcTest(controllers=[/*SignupController.class,LoginController.class*/DealController.class])
public class Tests extends Specification {
	@Autowired
    private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	private ResultActions result;
	
		def "test 1: navigationGet request"() {
			given: "the controller is setup"
				this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
			when: "I perform a get '/'"
				result = this.mockMvc.perform(get("/"));
			then: "I should see the view productDeal"
				result.andExpect(status().is(200))
					.andExpect(view().name('form/productDeal'));
					
	
	
	
	
	
	
	
	
	
	
	
//	@Unroll
//	def "test #testId: navigationGet #request"() {
//		given: "the controller is setup"
//			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build()
//		when: "I perform a get #request"
//			result = this.mockMvc.perform(get("/$request"))
//		then: "I should see the view #viewName"
//			result.andExpect(status().is(200))
//				.andExpect(view().name(viewName))
//		where:
//			testId | request | viewName
//			0 | '' | 'Landing'
//			1 | 'main' | 'Main'
//			2 | 'login' | 'Login'
//			8 | 'signup' | 'Signup'
//			12 | 'logoff' | 'Landing'
//	}
//
//	@Unroll
//	def "test #testId: navigationAuthenticatePost #action - #login - #password -> #viewName"() {
//		given:
//			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build()
//		when:
//			result = this.mockMvc.perform(post("/$request")
//				.param('login',login)
//				.param('password',password)
//				.param(action,''))
//		then:
//			result.andExpect(status().is(200))
//				.andExpect(view().name(viewName))
//		where:
//			testId | request | action | login | password | viewName 
//			3 | 'authenticate' | 'accept' | 'a' | '' | 'Login'
//			4 | 'authenticate' | 'accept' | '' | 'a' | 'Login'
//			9 | 'authenticate' | 'accept' | 'user' | 'a' | 'Login'
//			13 | 'authenticate' | 'accept' | 'user' | 'password' | 'Main'
//			14 | 'authenticate' | 'cancel' | '' | '' | 'Landing'
//	}
//
//	@Unroll
//	def "navigationSignUpPost #request (#forenames,#lastnames,#login,#password,#password2) #action --> #viewName"() {
//		given:
//			this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build()
//		when:
//			result = this.mockMvc.perform(post("/$request")
//				.param('forenames',forenames)
//				.param('lastnames',lastnames)
//				.param('login',login)
//				.param('password',password)
//				.param('password2',password2)
//				.param('userType',UserType.user.toString())
//				.param(action,''))
//		then:
//			result.andExpect(view().name(viewName))
//		where:
//			testId | request | action | forenames | lastnames | login | password | password2 | viewName
//			5 | 'add' | 'add' | 'Joe' | 'Smith' | 'js100' | 'js100' | 'js100' | 'redirect:login/'
//			6 | 'add' | 'add' | '' | 'Smith' | 'js100' | 'js100' | 'js100' | 'Signup'
//			7 | 'add' | 'add' | 'Joe' | '' | 'js100' | 'js100' | 'js100' | 'Signup'
//			10 | 'add' | 'add' | 'Joe' | 'Smith' | '' | 'js100' | 'js100' | 'Signup'
//			11 | 'add' | 'add' | 'Joe' | 'Smith' | 'js100' | '' | 'js100' | 'Signup'
//			15 | 'add' | 'add' | 'Joe' | 'Smith' | 'js100' | 'js100' | '' | 'Signup'
//			16 | 'add' | 'add' | 'Joe' | 'Smith' | 'js100' | 'js100' | 'js101' | 'Signup'
//			17 | 'add' | 'cancel' | '' | '' | '' | '' | '' | 'redirect:login/'
	}
}
