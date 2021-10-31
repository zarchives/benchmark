package com.acme.crud.demo;

import java.util.List;

public interface StudentService {
	public Response<Student> getStudents();

	public Student getStudent(Long id);
}
