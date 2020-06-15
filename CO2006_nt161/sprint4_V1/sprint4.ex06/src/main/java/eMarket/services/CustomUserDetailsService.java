package eMarket.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import eMarket.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepo;	

	public UserDetails loadUserByUsername(String login)
			throws UsernameNotFoundException {
		
		eMarket.domain.UserInfo domainUser = userRepo.findByLogin(login);
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if (domainUser.getRole().getRole().equals("MANAGER")) {
			System.out.println("Authority for MANAGER created.");
			authorities.add(new SimpleGrantedAuthority("ROLE_MANAGER"));
		} else if (domainUser.getRole().getRole().equals("CUSTOMER")) {
			System.out.println("Authority for CUSTOMER created.");
			authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
		}
		
		return new User(
				domainUser.getLogin(), 
				domainUser.getPassword(), 
				enabled, 
				accountNonExpired, 
				credentialsNonExpired, 
				accountNonLocked,
				authorities
		);
	}
	
}
