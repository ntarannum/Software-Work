package eMarket.domain;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="roles")
public class Role {
	
	@Id
	private int id;
	
	private String role;
	
	@OneToMany(mappedBy="role")
	private Set<UserInfo> userRoles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Set<UserInfo> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserInfo> userRoles) {
		this.userRoles = userRoles;
	}
	
}
