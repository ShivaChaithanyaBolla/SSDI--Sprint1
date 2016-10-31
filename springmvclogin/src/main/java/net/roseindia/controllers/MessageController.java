package net.roseindia.controllers;
/*
@Author: Chaithanya
*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MessageController {
	@RequestMapping("messageForm.html")
	public String home(){
	return "messagepage";
	
	}
}
