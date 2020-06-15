package jpa.e;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Ex4b_Department")
public class Ex4_Department {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="dept_code", nullable=false)
	private String dept_code;
	@Column(name="dept_name", nullable=false)
	private String dept_name;
}