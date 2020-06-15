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

import app.domain.UserInfoLogin;

@Controller
@RequestMapping("/")
public class LoginController {
	
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
    		binder.addValidators(new UserInfoLoginValidator());
    }
	
    @RequestMapping("/")
    public String index() {
        return "Landing";
    }
    
    @RequestMapping("/main")
    public String main() {
    		return "Main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("userInfoLogin") UserInfoLogin userInfoLogin) {
    		return "Login";
    }

    @RequestMapping(value = "/authenticate", params = "accept", method = RequestMethod.POST)
    public String authenticate(@Valid @ModelAttribute("userInfoLogin") UserInfoLogin UserInfoLogin, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "Login";
		} else {
			return "Main";
		}
    }

    @RequestMapping(value = "/authenticate", params = "cancel", method = RequestMethod.POST)
    public String cancelAuthenticate(@ModelAttribute("userInfoLogin") UserInfoLogin userInfoLogin, Model model) {
    		return "Landing";
    }
    
    @RequestMapping("/logoff")
    public String logoff() {
    		return "Landing";
    }

}
