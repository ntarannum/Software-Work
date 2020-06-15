package eMarket.domain;


import javax.persistence.*;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Transient;

@Entity(name="users")
public class UserInfo {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="id", nullable=false, length=11)
	int id;
	@Column(name="login", nullable=false, unique=true)
	String login;
	@Column(name="password", nullable=false)
	String password;
	//@Column(name="password2", nullable=false)
	//why is there a password 2?
	@Transient
	String password2;
	@Column(name="forenames", nullable=true)
	String forenames;
	@Column(name="lastnames", nullable=true)
	String lastnames;
	@Transient
	String userType;
	@Column(name="enabled", nullable=false, length=11)
	private int enabled = 1;
	//@Column(name="role", referencedColumnName="id" nullable=true, length=11)
	@Transient
	private Role role;
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getForenames() {
		return forenames;
	}
	public void setForenames(String forenames) {
		this.forenames = forenames;
	}
	public String getLastnames() {
		return lastnames;
	}
	public void setLastnames(String lastnames) {
		this.lastnames = lastnames;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int isEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserInfo [login=" + login + ", password=" + password + ", password2=" + password2 + ", forenames="
				+ forenames + ", lastnames=" + lastnames + ", userType=" + userType + ", role=" + role + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEnabled() {
		return enabled;
	}	
	
}
