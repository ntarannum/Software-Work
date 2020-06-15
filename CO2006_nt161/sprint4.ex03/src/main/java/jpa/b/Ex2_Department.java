package jpa.b;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="Ex2_Department")
public class Ex2_Department {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	private String dept_code;
	@Column(name="dept_name", nullable=false)
	private String dept_name;
	@OneToOne(optional=false)
	@JoinColumn(name="dept_hod")
	private Ex2_Employee dept_hod;
}