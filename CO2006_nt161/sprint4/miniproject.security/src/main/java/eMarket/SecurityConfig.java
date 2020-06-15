package eMarket;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Autowired 
	private UserDetailsService userDetailsService; 	

    @Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
    
    
    //anything need to be done in configureGlobal?
	
    protected void configure(HttpSecurity http) throws Exception {
    	http
		.csrf().disable()
    	
    	//do we have the next three lines or the original coding that's commented above
    	.requiresChannel()
			.anyRequest()
			.requiresSecure()
		 // TODO: AUTHENTICATION AND AUTHORIZATION
		.and()
	    .formLogin()
	    		// to show the page where we enter login credentials 
			.loginPage("/login-form") 
			// to process authentication: /login handler method implemented by Spring Security
			.loginProcessingUrl("/login")
			// where to go after successful login
			.defaultSuccessUrl("/success-login",true) // the second parameter is for enforcing this url always
			// to show an error page if the authentication failed
			.failureUrl("/login-form")
			// everyone can access these requests
			.permitAll()
	.and()
		.logout()
			//what do we do here? confused !?!?!?
			// to logout
			.invalidateHttpSession(true)
			// with CSRF we need to map the POST request /logout
			// if CSRF is disabled the GET request /logout is mapped by default
			// to an internal Spring Security handler method
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.logoutSuccessUrl("/login-form")
			.permitAll()
	// AUTHORIZATION
	.and()
		.authorizeRequests()
//			.antMatchers("/product/**").hasRole("MANAGER")  
//			.antMatchers("/test/**").hasRole("CUSTOMER")  
//			.antMatchers("/test2/**").hasAnyRole("MANAGER","CUSTOMER")
			
			.antMatchers("/system").hasRole("ADMIN")
			.antMatchers("/system/").hasRole("ADMIN")
			.antMatchers("/system/user").hasAnyRole("USER","PREMIUM")
			.antMatchers("/system/user/**").hasAnyRole("USER","PREMIUM")
			.antMatchers("/system/premium").hasRole("PREMIUM")
			.antMatchers("/system/premium/**").hasRole("PREMIUM")
			.antMatchers("/setDate/**").hasRole("ADMIN")
			.antMatchers("/deal/").hasRole("ADMIN")
			.antMatchers("/deal/add/**").hasRole("ADMIN")
			.antMatchers("/deal/delete/**").hasRole("ADMIN")
			.antMatchers("/product/").hasRole("ADMIN")
			.antMatchers("/product/productDetail/**").hasRole("ADMIN")
			.antMatchers("/product/add/**").hasRole("ADMIN")
			.antMatchers("/product/delete/**").hasRole("ADMIN")
			.antMatchers("/signup/").permitAll()
			.antMatchers("/signup/add/**").permitAll()
			.antMatchers("/order").hasAnyRole("USER","PREMIUM")
			.antMatchers("/order/").hasAnyRole("USER","PREMIUM")
			.antMatchers("/order/wishlist/**").hasRole("PREMIUM")
			.anyRequest().authenticated() // all requests ABOVE this statement require authentication
	.and()
		// to redirect the user when trying to access a resource to which access is not granted
        .exceptionHandling().accessDeniedPage("/access-denied");
    }

}
	