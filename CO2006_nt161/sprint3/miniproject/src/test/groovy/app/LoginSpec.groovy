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
import app.controller.*
import app.domain.UserType

@ContextConfiguration
@WebMvcTest(controllers=[SignupController.class,LoginController.class])
def class LoginSpec extends Specification {
	@Autowired
    private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	private ResultActions result;
	
	// TODO: test cases
	/*def "smoke test"(){
		expect: true == true;
	}*/
	
	
	//can also write isOk() instead of is(200) - the 200 refers to the http status code?
	
	//0
	def "0"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a get '/'"
			result = this.mockMvc.perform(get("/"));
		then:"I should see the view 'Landing'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Landing')); 
	}
	
	
	//1
	def "1"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a get '/main'"
			result = this.mockMvc.perform(get("/main"));
		then:"I should see the view 'Main'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Main'));
	}
	
	
	//2
	def "2"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a get '/login'"
			result = this.mockMvc.perform(get("/login"));
		then:"I should see the view 'Login'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Login'));
	}
	
	
	//3
	def "3"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/authenticate' with login 'a' and password ''"
			result = this.mockMvc.perform(post('/authenticate')
			.param("accept", '')
			.param("login", 'a')
			.param("password", ''));
		then: "I should see the view 'Login'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Login'));
	}
	
	
	//4
	def "4"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/authenticate' with login '' and password 'a'"
			result = this.mockMvc.perform(post('/authenticate')
			.param("accept", '')
			.param("login", '')
			.param("password", 'a'));
		then: "I should see the view 'Login'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Login'));
	}
	
	
	//5
	def "5"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames 'Smith', login 'js100', password 'js100' and password2 'js100'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", 'Smith')
			.param("login", 'js100')
			.param("password", 'js100')
			.param("password2", 'js100'));
		then: "I should see the view redirect to 'Login'"
			result
			.andExpect(status().is(302))
			.andExpect(view().name('redirect:login/'));
	}
	
	//6
	def "6"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames '', lastnames 'Smith', login 'js100', password 'js100' and password2 'js100'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", '')
			.param("lastnames", 'Smith')
			.param("login", 'js100')
			.param("password", 'js100')
			.param("password2", 'js100'));
		then: "I should see the view 'Signup'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Signup'));
	}
	
	
	//7
	def "7"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames '', login 'js100', password 'js100' and password2 'js100'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", '')
			.param("login", 'js100')
			.param("password", 'js100')
			.param("password2", 'js100'));
		then: "I should see the view 'Signup'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Signup'));
	}
	
	
	//8
	def "8"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a get '/signup'"
			result = this.mockMvc.perform(get("/signup"));
		then: "I should get the view 'Signup'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Signup'));
	}

	
	//9
	def "9"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/authenticate' with login 'user' and password 'a'"
			result = this.mockMvc.perform(post("/authenticate")
			.param("accept", '')
			.param("login", 'user')
			.param("password", 'a'));
		then: "I should get the view 'Login'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Login'));
	}
	
	
	//10
	def "10"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames 'Smith', login '', password 'js100'and password2 'js100'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", 'Smith')
			.param("login", '')
			.param("password", 'js100')
			.param("password2", 'js100'));
		then: "I should see the view 'Signup'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Signup'));
	}
	
	//11
	def "11"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames 'Smith', login 'js100', password '' and password2 'js100'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", 'Smith')
			.param("login", 'js100')
			.param("password", '')
			.param("password2", 'js100'));
		then: "I should see the view 'Signup'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Signup'));
	}
	
	//testing userType - test 12
	def "12"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames 'Smith', login 'js100', password 'js100', password2 'js100 and userType 'user'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", 'Smith')
			.param("login", 'js100')
			.param("password", 'js100')
			.param("password2", 'js100')
			.param("userType", 'user'));
		then: "I should see the view redirect to 'Login'"
			result
			.andExpect(status().is(302))
			.andExpect(view().name('redirect:login/'));
	}
	
	//testing userType - test 13
	def "13"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames 'Joe', lastnames 'Smith', login 'js100', password 'js100', password2 'js100 and userType 'user'"
			result = this.mockMvc.perform(post("/add")
			.param("add", '')
			.param("forenames", 'Joe')
			.param("lastnames", 'Smith')
			.param("login", 'js100')
			.param("password", 'js100')
			.param("password2", 'js100')
			.param("userType", 'premium'));
		then: "I should see the view redirect to 'Login'"
			result
			.andExpect(status().is(302))
			.andExpect(view().name('redirect:login/'));
	}
	
	//test 14
	def "14"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/authenticate' with login '' and password 'a'"
			result = this.mockMvc.perform(post('/authenticate')
			.param("accept", '')
			.param("login", 'user')
			.param("password", 'password'));
		then: "I should see the view 'Main'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Main'));
	}
	
	//testing cancel - test 15
	def "15"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/add' with forenames '', lastnames '', login '', password '' and password2 ''"
			result = this.mockMvc.perform(post("/add")
			.param("cancel", ''));
		then: "I should see the view redirect to 'Login'"
			result
			.andExpect(status().is(302))
			.andExpect(view().name('redirect:login/'));
	}
	
	//testing landing view when cancel is pressed - test 16
	def "16"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a post '/authenticate' with username '' and password ''"
			result = this.mockMvc.perform(post("/authenticate")
			.param("cancel", ''));
		then: "I should see the view 'Landing'"
			result
			.andExpect(status().is(200))
			.andExpect(view().name('Landing'));
	}
	
	//testing logoff - test 17
	def "17"(){
		given: "the context of the controller is set up"
			mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		when: "I do a get '/logoff'"
			result = this.mockMvc.perform(get("/logoff"));
		then: "I should see the view 'Landing'"
		result
		.andExpect(status().is(200))
		.andExpect(view().name('Landing'));
	}
	
	
}
