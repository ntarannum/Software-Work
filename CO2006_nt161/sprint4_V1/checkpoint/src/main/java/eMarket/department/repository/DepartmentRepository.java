package eMarket.department.repository;

import org.springframework.data.repository.CrudRepository;

import eMarket.department.Department;

public interface DepartmentRepository extends CrudRepository<Department, String> {
	Department findByCode(String code);
}