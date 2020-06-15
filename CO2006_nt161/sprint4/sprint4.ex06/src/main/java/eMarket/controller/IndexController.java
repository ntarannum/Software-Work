/**
 * (C) Artur Boronat, 2016
 */
package eMarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
	
    @RequestMapping("/")
    public String index() {
        return "index";
    }
    
    @RequestMapping("/test")
    public String test() {
    		return "security/success-login";
    }

    @RequestMapping("/test2")
    public String test2() {
    		return "security/success-login";
    }
    
}
