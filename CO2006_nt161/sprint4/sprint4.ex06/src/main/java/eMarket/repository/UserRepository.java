package eMarket.repository;

import org.springframework.data.repository.CrudRepository;

import eMarket.domain.UserInfo;

public interface UserRepository extends CrudRepository<UserInfo, Integer> {
	
	public UserInfo findById(Integer id);
	public UserInfo findByLogin(String login);

}
