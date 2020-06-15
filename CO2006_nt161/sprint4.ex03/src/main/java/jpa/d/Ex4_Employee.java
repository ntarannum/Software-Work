package jpa.d;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity(name="Ex4_Employee")
public class Ex4_Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="employee_id", nullable=false)
	private int employee_id;
	@Column(name="employee_name", nullable=false)
	private String employee_name;
	@Column(name="job_title")
	private String job_title;
	@ManyToMany(mappedBy="employeeList")
	private List<Ex4_Department> departmentList = new ArrayList<>();
}
