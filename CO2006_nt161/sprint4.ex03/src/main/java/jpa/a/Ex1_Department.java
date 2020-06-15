package jpa.a;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Ex1_Department")
public class Ex1_Department {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="dept_code", nullable=false)
	private String dept_code;
	@Column(name="dept_name", nullable=false)
	private String dept_name;
}