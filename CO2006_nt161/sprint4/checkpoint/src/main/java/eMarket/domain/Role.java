package eMarket.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.Id;
//import javax.persistence.OneToMany;

import eMarket.domain.UserInfo;

@Entity(name="roles")
public class Role {
	@Id
	@Column(name="id", nullable=false, length=11)
	private int id;
	@Column(name="role", nullable=false)
	private String role;
	@OneToMany(fetch=FetchType.LAZY)
	//do I have to add this to the line above (cascade=CascadeType.ALL, orphanRemoval=true)?s
	@JoinColumn(name="role", referencedColumnName="id")
	private Set<UserInfo> users = new HashSet<>();
	
	// HIBERNATE CONSTRAINT:
	// when a constructor different from default is present
	// the default constructor needs to be declared
	public Role() { }
	
	public Role(int id, String role) {
		this.id = id; 
		this.role = role; 
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Set<UserInfo> getUsers() {
		return users;
	}

	public void setUsers(Set<UserInfo> users) {
		this.users = users;
	}
	
	
}
