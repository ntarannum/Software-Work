package eMarket;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import eMarket.department.Department;
import eMarket.department.Module;
import eMarket.department.repository.DepartmentRepository;
import eMarket.department.repository.ModuleRepository;
import eMarket.repository.DealRepository;
import eMarket.repository.ProductRepository;
import eMarket.repository.RoleRepository;
import eMarket.repository.UserInfoRepository;

@SpringBootApplication
public class EMarketApp extends WebMvcConfigurerAdapter implements CommandLineRunner {

	@Autowired ProductRepository productRepo;
	@Autowired DealRepository dealRepo;
	@Autowired RoleRepository roleRepo;
	@Autowired UserInfoRepository userRepo;
	@Autowired ModuleRepository moduleRepo;
	@Autowired DepartmentRepository deptRepo;
	
	private static LocalDate systemDate;
	
	public static LocalDate getSystemDate() {
		return systemDate;
	}

	public static void setSystemDate(LocalDate systemDate) {
		EMarketApp.systemDate = systemDate;
	}

	public static void main(String[] args) {
        SpringApplication.run(EMarketApp.class, args);
    }

    public void run(String... args) {
    		// initialize calendar
    	 	Calendar calendar = Calendar.getInstance();
    	 	calendar.setTimeZone(TimeZone.getTimeZone("GMT"));
    	 	systemDate = calendar.getTime().toInstant().atZone(ZoneId.of("GMT")).toLocalDate();
    	 	
    	 	moduleRepo.deleteAll();
    	 	deptRepo.deleteAll();
    	 	
    	 	// BEGIN CHECKPOINT EXERCISE ON SPRING DATA
    	 	Department informaticsDepartment = new Department();
    	 	informaticsDepartment.setCode("INF");
    	 	informaticsDepartment.setName("Informatics");
    	 	
    	 	deptRepo.save(informaticsDepartment);
    	 	
    	 	Department engineeringDepartment = new Department();
    	 	engineeringDepartment.setCode("ENG");
    	 	engineeringDepartment.setName("Engineering");
    	 	
    	 	deptRepo.save(engineeringDepartment);
    	 	
    	 	Module CO2001 = new Module();
    	 	CO2001.setCode("CO2001");
    	 	CO2001.setTitle("User Interfaces and HCI");
    	 	CO2001.setCredits(10);
    	 	
//    	 	moduleRepo.save(CO2001);
    	 	
    	 	informaticsDepartment.getModuleList().add(CO2001);
    	 	
    	 	Module CO2006 = new Module();
    	 	CO2006.setCode("CO2006");
    	 	CO2006.setTitle("Software Engineering and System Development");
    	 	CO2006.setCredits(20);
    	 	
    	 	informaticsDepartment.getModuleList().add(CO2006);
    	 	
    	 	//moduleRepo.save(CO2006);
    	 	
    	 	Module CO2011 = new Module();
    	 	CO2011.setCode("CO2011");
    	 	CO2011.setTitle("Automata, Languages and Computation");
    	 	CO2011.setCredits(20);
    	 	
    	 	//moduleRepo.save(CO2011);
    	 	
    	 	informaticsDepartment.getModuleList().add(CO2011);
    	 	
    	 	Module CO2012 = new Module();
    	 	CO2012.setCode("CO2012");
    	 	CO2012.setTitle("Software Project Management and Professionalism");
    	 	CO2012.setCredits(10);
    	 	
    	 	//moduleRepo.save(CO2012);
    	 	
    	 	informaticsDepartment.getModuleList().add(CO2012);
    	 	
    	 	deptRepo.save(informaticsDepartment);
    	 	
    	 	
    	 	
//    	 	List<Department> list = deptRepo.findByCode("INF");
//    	 	deptRepo.save(managedDepartment);
    	 	
//    	 	Department engineeringDepartment = new Department();
//    	 	Department managedDepartment2 = deptRepo.save(engineeringDepartment);
//    	 	List<Department> list2 = deptRepo.findByCode("ENG");
//    	 	deptRepo.save(managedDepartment2);
//    	 	
//    	 	Module module = new Module();
//    	 	Department managedDepartment = deptRepo.save(informaticsDepartment);
//    	 	List<Department> list = deptRepo.findByCode("INF");
//    	 	deptRepo.save(managedDepartment);
//    	 	
//    	 	Department engineeringDepartment = new Department();
//    	 	Department managedDepartment2 = deptRepo.save(engineeringDepartment);
//    	 	List<Department> list2 = deptRepo.findByCode("ENG");
//    	 	deptRepo.save(managedDepartment2);
    	 	
    	 	
    	 	

    	 	// END CHECKPOINT EXERCISE ON SPRING DATA
    }
}
