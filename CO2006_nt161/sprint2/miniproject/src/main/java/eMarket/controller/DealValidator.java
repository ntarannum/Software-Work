package eMarket.controller;

import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eMarket.EMarketApp;
import eMarket.domain.Deal;

public class DealValidator implements Validator {
		
	public boolean supports(Class<?> clazz) {
        return DealFormDto.class.equals(clazz);
    }

	@Override
	public void validate(Object target, Errors errors) {
		DealFormDto dto = (DealFormDto) target;
		
		// TODO: add validation code here

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startDate", "", "Field cannot be empty.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "discount", "", "Field cannot be empty.");
		
		if(dto.getProductId() == -1){
			errors.rejectValue("productId", "", "Product invalid: have to choose a product.");
		}
			

		if ((dto.getDiscount() >= 1) || (dto.getDiscount() <= 0)) {
			errors.rejectValue("discount", "", "Discount invalid: cannot be less than/equal to 0 or greater than 1.");
		}
		
		if((dto.getStartDate() == null)) {
			errors.rejectValue("startDate", "", "Start date invalid: cannot be before empty.");
		}
		
		if((dto.getEndDate() != null) && (dto.getStartDate() != null) && (dto.getEndDate().isBefore(dto.getStartDate()))) {
			errors.rejectValue("endDate", "", "End date invalid: cannot be before system date.");
		}
		

		if((dto.getStartDate()!= null)){
			if((dto.getEndDate()== null)){
				for(int i = 0; i<EMarketApp.getStore().getDealList().size(); i++){
					if(dto.getProductId() == EMarketApp.getStore().getDealList().get(i).getId()){
						if(EMarketApp.getStore().getDealList().get(i).getEndDate().isAfter(dto.getStartDate())){
							errors.rejectValue("startDate", "", "Start date invalid: overlapping dates.");
							}
						}
					}
				}
			}
			if(dto.getEndDate()!=null){
				for(int i = 0; i<EMarketApp.getStore().getDealList().size(); i++){
					if(dto.getProductId() == EMarketApp.getStore().getDealList().get(i).getId()){	
						if (!(EMarketApp.getStore().getDealList().get(i).getEndDate().isBefore(dto.getStartDate()) || EMarketApp.getStore().getDealList().get(i).getStartDate().isAfter(dto.getEndDate()))) {
							errors.rejectValue("endDate", "", "Date invalid: overlapping dates.");
						}
					}
				}
			}
			
		}
}