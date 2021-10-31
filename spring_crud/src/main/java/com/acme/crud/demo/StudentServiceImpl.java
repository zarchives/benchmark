package com.acme.crud.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService{

	StudentRepository studentRepository;
	
	public StudentServiceImpl(@Autowired StudentRepository repo) {
		this.studentRepository = repo;
	}
	
	@Override
	public Response<Student> getStudents() {
		List<Student> result = new ArrayList<Student>();
		long count = 0;
		PageRequest page = PageRequest.of(0,20);	
		count = studentRepository.count();
		Page<Student> pageResult= studentRepository.findAll(page);
		pageResult.get().forEach(result::add);
		return new Response<Student>(count, result);
	}

	@Override
	public Student getStudent(Long id) {		
		return studentRepository.findById(id).get();
	}
	
}
