<link rel='stylesheet' href='web/swiss.css'/>

# Spring MVC: exercise 05 - form validation and redirections

Import the project `sprint2/SpringMvc_ex05` from your local GitHub repository into your STS workspace using `Import>Existing Gradle Project`.

In this exercise, we are going to develop a web application with a form that submits information about students. We are going to focus on:
* adding form validation using Spring annotations; and 
* using redirections in order to allow our controller to trigger http requests (to **delegate** work to other controllers)

## Skeleton of the web application

By the end of these exercises, the presentation layer should implement the following navigational model as a state machine, where screenshots represent `views` (states) and links represent transitions (http requests available from a particular view):

<img src="web/sm.pdf" alt="navigational model" width="750" height="400">

The architecture of the codebase available in the repository is as follows:

		/src
		|-- main
	        |-- java
	            |-- labMvc
	                |-- LabMvcApplication.java: 
	                |-- WebConfig.java
	                |-- control
	                    |-- IndexController.java
	                |-- domain
	                    |-- Student.java
	        |-- resources
	            |-- application.properties
		    |-- webapp
		        |-- WEB-INF
		            |-- views: where the JSP files can be found
		                |-- index.jsp
		                |-- forms
		                	|-- error.jsp
		                	|-- final.jsp
		                    |-- form.jsp
		                    |-- result.jsp

The differences with the codebase of `exercise 04` are as follows:

* class [src/main/java/labMvc/control/StudentValidator.java](./src/main/java/labMvc/control/StudentValidator.java) implements the conditions that need to be checked on objects `Student` in the method `validate(Object target, Errors errors)`. Objects `Student` are used as **command objects** (a JavaBean which will be populated with the data from your forms, aka **data transfer object**) when the form in the JSP view [src/main/webapp/WEB-INF/views/form/form.jsp](./src/main/webapp/WEB-INF/views/form/form.jsp) is sent in a POST request;
* class [src/main/java/labMvc/control/IndexController.java](./src/main/java/labMvc/control/IndexController.java) links the validator for the command object `Student` by using the binding below and by annotating a model attribute with the annotation `@Valid` in a request handler method:

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
    		binder.addValidators(new StudentValidator());
    }
    

## :star: a. Validation

In this exercise, we are going to implement a basic form validation mechanism that will allow us to check the information that users provide through web forms using Spring annotations.
* In the method `addStudent()` of the controller class [src/main/java/labMvc/control/IndexController.java](./src/main/java/labMvc/control/IndexController.java), add a Spring annotation to enable validation of the information received from the web form in the view [src/main/webapp/WEB-INF/views/form/form.jsp](./src/main/webapp/WEB-INF/views/form/form.jsp). 
* In the method `validate()` of the validator class [src/main/java/labMvc/control/StudentValidator.java](./src/main/java/labMvc/control/StudentValidator.java), add code to check the following conditions:  
    * `name too short`: the student name has less than 5 characters
    * `low age`: the student age is less than 18


## :star::star: b. Redirection

In this exercise, you are going to implement how to perform an automatic URL redirection to `/finalPage` when the request `/redirect` reaches the controller. Add this code in the method `redirect()` of the class [src/main/java/labMvc/control/IndexController.java](./src/main/java/labMvc/control/IndexController.java).

<!--
	    // REDIRECTION 
	    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
	    public String redirect() {  
			return "redirect:/finalPage";
	    }    
	    @RequestMapping(value = "/finalPage", method = RequestMethod.GET)
	    public String finalPage() {      
	       return "/form/final";
	    }
The only part that is unusual in the code above is the use of the statement `redirect:`, which triggers an HTTP request `/finalPage`.
-->

Hint: revise :movie_camera: [the section chaining](https://app.pluralsight.com/player?course=springmvc-intro&author=bryan-hansen&name=springmvc-m5-views&clip=5&mode=live) of the tutorial [Introduction to Spring MVC](https://app.pluralsight.com/library/courses/springmvc-intro/table-of-contents) on Pluralsight.

## Additional Resources

The code used in this tutorial has been adapted from the following sources:
* [Handling forms](http://www.tutorialspoint.com/spring/spring_mvc_form_handling_example.htm)
* [Handling exceptions](http://www.tutorialspoint.com/spring/spring_exception_handling_example.htm)
* [Page redirection](http://www.tutorialspoint.com/spring/spring_page_redirection_example.htm)

***
&copy; Artur Boronat, 2015-17