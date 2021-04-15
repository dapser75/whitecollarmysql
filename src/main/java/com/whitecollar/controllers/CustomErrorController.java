package com.whitecollar.controllers;


import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomErrorController implements ErrorController{
	
	@RequestMapping("/error")
	@ResponseBody
	public String handleError(HttpServletRequest request) {
	    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
	    Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
	    
	    if (statusCode == 400) {
	    	return String.format("<html><body><h2>Error Page</h2><div>Status code: <b>%s</b></div>"
	    		+ "<div>Exception Message: <b>%s</b></div><body></html>",
	              statusCode, exception==null? "URL Incorrecta": exception.getMessage());
	    } 
	    else if (statusCode== 404){
	    	return String.format("<html><body><h2>Error Page</h2><div>Status code: <b>%s</b></div>"
		    		+ "<div>Exception Message: <b>%s</b></div><body></html>",
		              statusCode, exception==null? "URL INEXISTENTE": exception.getMessage());
	    }
	    else if (statusCode== 500){
	    	return String.format("<html><body><h2>Error Page</h2><div>Status code: <b>%s</b></div>"
		    		+ "<div>Exception Message: <b>%s</b></div><body></html>",
		              statusCode, exception==null? "URL INEXISTENTE": exception.getMessage());
	    }
	    else {
	    	return String.format("<html><body><h2>Error Page</h2><div>Status code: <b>%s</b></div>"
		    		+ "<div>Exception Message: <b>%s</b></div><body></html>",
		              statusCode, exception==null? "Error desconcido": exception.getMessage());
	    }
	}

	@Override
	public String getErrorPath() {
	    return "/error";
	}

 	


}
