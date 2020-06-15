package labMvc.control;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import labMvc.domain.Student;

public class StudentValidator implements Validator {
		
	public boolean supports(Class<?> clazz) {
        return Student.class.equals(clazz);
    }

	@Override
	public void validate(Object target, Errors errors) {
		Student dto = (Student) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "", "Field cannot be empty.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "", "Field cannot be empty.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "", "Field cannot be empty.");
		
		if ((dto.getId()!=null) && (dto.getId() < 0)) {
			errors.rejectValue("id", "", "Id invalid.");
		} 
		
		// tag::exercise()
		if ((dto.getName()!=null) && (dto.getName().length() < 5)) {
			errors.rejectValue("name", "", "The student name has less than 5 characters.");
		}
		if ((dto.getAge() != null) && (dto.getAge() < 18)) {
			errors.rejectValue("age", "", "The student age is less than 18.");
		}
		// end::exercise()
		
	}
	
	
}
