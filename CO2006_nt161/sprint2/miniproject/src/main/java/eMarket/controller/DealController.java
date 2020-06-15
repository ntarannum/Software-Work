package eMarket.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import eMarket.EMarketApp;
import eMarket.domain.*;
@Controller
@RequestMapping("/deal")

public class DealController {
    Deal deal;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) {
    		binder.addValidators(new DealValidator());
    }
    
    // TODO: implement handler methods
	@RequestMapping("/")
    public String index(@ModelAttribute("dealFormDto") DealFormDto dealFormDto, Model model) {
		dealFormDto.setProductId(-1);
		model.addAttribute("dealList", EMarketApp.getStore().getDealList());
    	return"form/productDeal";
    }
	
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String productDeal(@Valid @ModelAttribute("dealFormDto") DealFormDto dealFormDto, BindingResult result, Model model) {
    	if (!result.hasErrors()) {
    	deal = new Deal();
		deal.setProduct(EMarketApp.getStore().getProductList().stream().filter(p -> (((Product) p).getId() == dealFormDto.getProductId())).findAny().get());
		deal.setId();
		deal.setDiscount(dealFormDto.getDiscount());
		deal.setStartDate(dealFormDto.getStartDate());
		deal.setEndDate(dealFormDto.getEndDate());
		EMarketApp.getStore().getDealList().removeIf(p -> (p.getId() == deal.getId()));
		EMarketApp.getStore().getDealList().add(deal);
    	}
    	model.addAttribute("dealList", EMarketApp.getStore().getDealList());
    	return "form/productDeal";
    }
    	
	    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String productDeal(@ModelAttribute("dealFormDto") DealFormDto dealFormDto, Model model) {
    	if(deal.isActive()){
    	EMarketApp.getStore().getDealList().get(deal.getId()).close();
    	deal.setEndDate(EMarketApp.getSystemDate());
    	}
    	model.addAttribute("dealList", EMarketApp.getStore().getDealList());
    	return "form/productDeal";
    }
    
    
}    