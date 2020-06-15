package eMarket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import eMarket.domain.Role;
import eMarket.domain.Store;
import eMarket.domain.UserInfo;
import eMarket.repository.StoreRepository;
import eMarket.repository.UserRepository;

@SpringBootApplication
public class EMarketApp implements CommandLineRunner { 

	@Autowired 
	StoreRepository repo;
	@Autowired
	private UserRepository userRepo;	

	public static final String STORE_NAME = "MyEMarket";
	
    public static void main(String[] args) {
        SpringApplication.run(EMarketApp.class, args);
    }

    @Override
    public void run(String... strings) throws Exception {
		// creation of instance according to the object diagram in Fig. 2
		
		if (repo.findByName(STORE_NAME).size() == 0) {
			Store store = new Store(STORE_NAME);
			repo.save(store);
		}
		
		BCryptPasswordEncoder pe = new  BCryptPasswordEncoder();

		UserInfo user = new UserInfo();
		user.setLogin("Bob");
		user.setPassword(pe.encode("admin"));
		Role role = new Role();
		role.setId(0);
		role.setRole("MANAGER");
		user.setRole(role);
		userRepo.save(user);
		
		// TODO: exercise 6.b
		// END exercise 6.b
		
    }   

}
