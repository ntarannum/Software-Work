package jpa.b;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Ex2_Employee")
public class Ex2_Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="employee_id", nullable=false)
	private int employee_id;
	@Column(name="employee_name", nullable=false)
	private String employee_name;
	@Column(name="job_title")
	private String job_title;
}
