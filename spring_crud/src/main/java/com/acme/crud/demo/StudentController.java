package com.acme.crud.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/Student")
public class StudentController {
	StudentService service;
	public StudentController(@Autowired StudentService service) {
		this.service = service;
	}
	
	@GetMapping("")
	public ResponseEntity<Response<Student>> getAllStudents(){
		Response<Student> students = service.getStudents();
		return new ResponseEntity<Response<Student>>(students, HttpStatus.OK);
	}
}
