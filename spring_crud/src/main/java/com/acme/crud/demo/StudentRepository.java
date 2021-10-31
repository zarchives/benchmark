package com.acme.crud.demo;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface StudentRepository extends PagingAndSortingRepository<Student, Long> {

	List<Student> findByStudentName(@Param("studentName") String name);

}
