package eMarket.department.repository;

import org.springframework.data.repository.CrudRepository;

import eMarket.department.Module;

public interface ModuleRepository extends CrudRepository<Module, String> {
	Module findByCode(String code);
}