package jpa.d;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name="Ex4_Department")
public class Ex4_Department {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="dept_code", nullable=false)
	private String dept_code;
	@Column(name="dept_name", nullable=false)
	private String dept_name;
	@ManyToMany 
	@JoinTable(name="Ex4_DepartmentEmployee",
		joinColumns=@JoinColumn(name="department", referencedColumnName="dept_code"),
		inverseJoinColumns=@JoinColumn(name="employee", referencedColumnName="employee_id"))	
	private List<Ex4_Employee> employeeList = new ArrayList<>(); 
}