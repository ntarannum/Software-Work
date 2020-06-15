/**
 * (C) Artur Boronat, 2016
 */
package app.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import app.domain.UserInfo;
import app.domain.UserType;

@Controller
@RequestMapping("/")
public class SignupController {
	
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.addValidators(new UserInfoValidator());
    }
	
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(@ModelAttribute("userInfo") UserInfo userInfo, Model model) {
    		model.addAttribute("userTypeValues",UserType.values());
    		return "Signup";
    }
    
    @RequestMapping(value="add", params = "add", method = RequestMethod.POST)
    public String addNewUser(@Valid @ModelAttribute("userInfo") UserInfo userInfo, BindingResult result, Model model) {
    		if (result.hasErrors()) {
    			model.addAttribute("userTypeValues",UserType.values());
    			return "Signup";
    		} else {
    			return "redirect:login/";
    		}
    }
    
    @RequestMapping(value="add", params = "cancel", method = RequestMethod.POST)
    public String cancelNewUser(@ModelAttribute("userInfo") UserInfo userInfo, Model model) {
    		return "redirect:login/";
    }

}
