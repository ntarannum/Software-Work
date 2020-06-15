/**
 * (C) Artur Boronat, 2015
 */
package labMvc.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import labMvc.domain.Student;

@Controller
public class IndexController {
	
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/student", method = RequestMethod.GET)
    //TODO
    public String student(@ModelAttribute("student") Student student) {
    	//the type is always string
    	//the next word is the method name which has to start with a small letter by convention
    	//we use model attribute for forms else we use model
    	//furthermore, the command object is student hence we create an instance of that object
    	//hence the Student student
    	return "form/form";
    }
    
    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    
    public String addStudent(@ModelAttribute("student") Student student, Model model) {
    	model.addAttribute("name", student.getName());
    	model.addAttribute("id", student.getId());
    	model.addAttribute("age", student.getAge());
    	return "form/result";
    }
    
    //TODO
}
