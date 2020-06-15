package eMarket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager
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

import eMarket.EMarketApp
import eMarket.DbConfig
import eMarket.domain.Deal
import eMarket.domain.Product
import eMarket.domain.Role
import eMarket.domain.UserInfo
import eMarket.repository.DealRepository
import eMarket.repository.ProductRepository
import eMarket.repository.RoleRepository
import eMarket.repository.UserInfoRepository

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.CoreMatchers.*
import static org.hamcrest.Matchers.*

import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.dao.DataIntegrityViolationException

import java.time.LocalDate

@DataJpaTest
@SpringBootTest(classes=[EMarketApp.class,DbConfig.class])
@AutoConfigureTestDatabase(replace=Replace.NONE)
public class CheckpointJpaTests extends Specification {
	@Autowired
    private DealRepository dealRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private RoleRepository roleRepo;
	@Autowired
	private UserInfoRepository userRepo;
	
	def setup() {
		dealRepo.deleteAll()
		productRepo.deleteAll()
		roleRepo.deleteAll()
		userRepo.deleteAll()
	}
	
	def "INSTANCE. product"() {
		given: 
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedObject = productRepo.save(p)
		when: 
			Product p2 = productRepo.findById(managedObject.getId())
		then: 
			assertThat("", p2, hasProperty("name", equalTo(p.getName())));
	}
	def "NNV. product with no name"() {
		given: 
			Product p = new Product()
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedObject = productRepo.save(p)
		when: 
			Product p2 = productRepo.findById(managedObject.getId())
		then: 
			thrown(DataIntegrityViolationException)
	}
	def "NNV. product with no price"() {
		given: 
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			Product managedObject = productRepo.save(p)
		when: 
			Product p2 = productRepo.findById(managedObject.getId())
		then: 
			thrown(DataIntegrityViolationException)
	}
	
	def "INSTANCE. role"() {
		given:
			def o = new Role()
			o.setId(4)
			o.setRole("User")
			def managedObject = roleRepo.save(o)
		when:
			def o2 = roleRepo.findByRole("User")
		then:
			assertThat("", o2, hasProperty("role", equalTo(o.getRole())));
	}
	def "NNV. role with no name"() {
		given:
			def o = new Role()
			o.setId(4)
			def managedObject = roleRepo.save(o)
		when:
			def o2 = roleRepo.findById(4)
		then:
			thrown(DataIntegrityViolationException)
	}
	def "FK. role with two users"() {
		given:
			def o = new Role()
			o.setId(4)
			o.setRole("User")
			def r = roleRepo.save(o)
			
			o = new UserInfo()
			o.setForenames("David")
			o.setLastnames("Bowie")
			o.setLogin("d.bowie")
			o.setPassword("d.bowie")
			o.setPassword2("d.bowie")
			o.setEnabled(1)
			def user1 = userRepo.save(o)
			
			o = new UserInfo()
			o.setForenames("Ray")
			o.setLastnames("Charles")
			o.setLogin("r.charles")
			o.setPassword("r.charles")
			o.setPassword2("d.bowie")
			o.setEnabled(1)
			def user2 = userRepo.save(o)
			
			r.getUsers().add(user1)
			r.getUsers().add(user2)
			roleRepo.save(r)
		when:
			def r2 = roleRepo.findByRole("User")
			System.out.println(r2.getUsers())
		then:
			assertThat("", r2.getUsers(), hasSize(2));
	}
	def "INSTANCE. userInfo"() {
		given:
			def o = new UserInfo()
			o.setForenames("David")
			o.setLastnames("Bowie")
			o.setLogin("d.bowie")
			o.setPassword("d.bowie")
			o.setPassword2("d.bowie")
			o.setEnabled(1)
			def managedObject = userRepo.save(o)
		when:
			def o2 = userRepo.findById(managedObject.getId())
		then:
			assertThat("", o2, hasProperty("login", equalTo(o.getLogin())));
	}
	def "NNV. userInfo with no login"() {
		given:
			def o = new UserInfo()
			o.setForenames("David")
			o.setLastnames("Bowie")
//			o.setLogin("d.bowie")
			o.setPassword("d.bowie")
			o.setPassword2("d.bowie")
			o.setEnabled(1)
			def managedObject = userRepo.save(o)
		when:
			def o2 = userRepo.findById(managedObject.getId())
		then	:
			thrown(DataIntegrityViolationException)
	}
	def "NNV. userInfo with no password"() {
		given:
			def o = new UserInfo()
			o.setForenames("David")
			o.setLastnames("Bowie")
			o.setLogin("d.bowie")
//			o.setPassword("d.bowie")
			o.setPassword2("d.bowie")
			o.setEnabled(1)
			def managedObject = userRepo.save(o)
		when:
			def o2 = userRepo.findById(managedObject.getId())
		then	:
			thrown(DataIntegrityViolationException)
	}
	def "FK. deal"() {
		given:
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedProduct = productRepo.save(p)
			
			def o = new Deal()
			o.setStartDate(LocalDate.now())
			o.setEndDate(LocalDate.now())
			o.setDiscount(0.2)
			o.setProduct(managedProduct)
			def managedObject = dealRepo.save(o)
		when:
			def o2 = dealRepo.findById(managedObject.getId())
		then:
			assertThat("", o2, hasProperty("startDate", equalTo(o.getStartDate())));
	}

	def "NNV. deal with no start date"() {
		given:
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedProduct = productRepo.save(p)
			
			def o = new Deal()
//			o.setStartDate(LocalDate.now())
			o.setEndDate(LocalDate.now())
			o.setDiscount(0.2)
			o.setProduct(managedProduct)
			def managedObject = dealRepo.save(o)
		when:
			def o2 = dealRepo.findById(managedObject.getId())
		then	:
			thrown(DataIntegrityViolationException)
	}
	def "FK. deal with no end date"() {
		given:
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedProduct = productRepo.save(p)
			
			def o = new Deal()
			o.setStartDate(LocalDate.now())
//			o.setEndDate(LocalDate.now())
			o.setDiscount(0.2)
			o.setProduct(managedProduct)
			def managedObject = dealRepo.save(o)
		when:
			def o2 = dealRepo.findById(managedObject.getId())
		then:
			assertThat("", o2, hasProperty("startDate", equalTo(o.getStartDate())));
	}
	def "NNV. deal with no product"() {
		given:
			Product p = new Product()
			p.setName("Banana")
			p.setDescription("Banana")
			p.setPrice(0.16)
			Product managedProduct = productRepo.save(p)
			
			def o = new Deal()
			o.setStartDate(LocalDate.now())
			o.setEndDate(LocalDate.now())
			o.setDiscount(0.2)
//			o.setProduct(managedProduct)
			def managedObject = dealRepo.save(o)
		when:
			def o2 = dealRepo.findById(managedObject.getId())
		then	:
			thrown(DataIntegrityViolationException)
	}
}
