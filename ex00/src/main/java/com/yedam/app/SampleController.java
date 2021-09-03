package com.yedam.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.java.Log;

// pojo: 상속X
@Controller    // -> @Component 상속해서 @Controller, @Service, @Repository(=dao)
@RequestMapping("/sample/*")
@Log
public class SampleController {
	
	@RequestMapping("/ex09")
	@ResponseBody // 자바 객체 -> json 스트링 변환
	public SampleVO ex09(SampleVO sample) {
		//SampleVO sample = new SampleVO();
		sample.setName("피뱌");
		sample.setAge(20);
		
		
		return sample;
	}
	
	//http://localhost/sample/ex06/phoebe
	@RequestMapping("/ex06/{name}/{age}")
	public void ex06(@PathVariable String name, @PathVariable int age) {
		log.info("name: "+ name);
		log.info("age: "+ age);
	}
	
	@RequestMapping("/ex05")
	public void ex05(SampleVoList list) {
		log.info(list.toString());
	}
	
	@RequestMapping("/ex04")
	public void ex04(@RequestParam List<String> ids) {
		log.info(ids.toString());
	}
	
	
	@RequestMapping("/ex03")
	public void ex03(@RequestParam String[] ids) {
		//String[] ids = request.getParameterValues("ids"); 랑 같은 것이겠냐?
		log.info(Arrays.toString(ids));
	}
	
	
	//http://localhost/sample/ex02?name=Sasha&age=17
	 @GetMapping("/ex02")
	 public void ex02(@RequestParam(name="username") String name,
			 		  @RequestParam(required=false,defaultValue = "10") int age) {
		 //request.getParameter("username");
		 log.info("name: "+ name);
		 log.info("age: "+ age);
		 
	 }
	
	 @GetMapping("/ex01")
	 public String ex01(@ModelAttribute("sam") SampleVO vo,
			 								  Model model) {	// dto = vo = do
		 log.info(vo.toString());
		 //model.addAttribute("sam",vo);
		 model.addAttribute("pageNo","10");
		 return "sample/ex01";
	 }
	
	//@RequestMapping(value="/a" , method= RequestMethod.POST)			// url 끝 주소
	 @GetMapping("/a")
	 public String basic1() {
		 log.info("basic.......1");
		 return "sample/basica"; 	//jsp 뷰페이지를 지정할 수 있다 sample/a
		 
	 }
	 @RequestMapping("/b")
	 public void basic2() {
		 log.info("basic.......2");	//void 인 경우 url과 일치하는 뷰페이지로 포워드
		 
	 }
}
