package eMarket.department;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="Module")
public class Module {
	@Id
	@Column(name="module_code", nullable=false)
	private String code;
	@Column(name="module_title", nullable=false)
	private String title;
	@Column(name="module_credits", nullable=false)
	private int credits;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	
}
