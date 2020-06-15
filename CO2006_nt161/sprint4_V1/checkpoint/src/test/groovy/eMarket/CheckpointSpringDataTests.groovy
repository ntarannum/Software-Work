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
import eMarket.department.Department
import eMarket.department.Module
import eMarket.department.repository.DepartmentRepository
import eMarket.department.repository.ModuleRepository
import eMarket.DbConfig
import eMarket.domain.Deal
import eMarket.domain.Product
import eMarket.domain.Role
import eMarket.domain.UserInfo

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.CoreMatchers.*
import static org.hamcrest.Matchers.*

import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureTestDatabase.Replace;
import org.springframework.dao.DataIntegrityViolationException

import java.time.LocalDate

@DataJpaTest
@SpringBootTest(classes=[EMarketApp.class,DbConfig.class])
@AutoConfigureTestDatabase(replace=Replace.NONE)
public class CheckpointSpringDataTests extends Specification {
	@Autowired
    private DepartmentRepository deptRepo;
	@Autowired
	private ModuleRepository moduleRepo;
	
	@Unroll
	def "Department #description"() {
		when: 
			Department d = deptRepo.findByCode(deptCode)
		then: 
			d.getName() == deptName
		where:
			description | deptCode | deptName  
			"1" | "INF" | "Informatics" 
			"2" | "ENG" | "Engineering" 
	}
	@Unroll
	def "Module #description"() {
		when: 
			Module d = moduleRepo.findByCode(modCode)
		then: 
			d.getTitle() == modTitle
			d.getCredits() == modCredits
		where:
			description | modCode | modTitle | modCredits  
			"1" | "CO2001" | "User Interfaces and HCI" | 10
			"2" | "CO2006" | "Software Engineering and System Development" | 20
			"3" | "CO2011" | "Automata, Languages and Computation" | 20
			"4" | "CO2012" | "Software Project Management and Professionalism" | 10
	}
	def "Modules in departments"() {
		when:
			Department d = deptRepo.findByCode(deptCode)
		then:
			d.getModuleList().size() == noModules
		where:
			deptCode | noModules
			"INF" 	| 4
			"ENG"	| 0
	}
}
