package jpa.e;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="Ex4b_DepartmentEmployee")
public class Ex4_DepartmentEmployee implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@ManyToOne
	@JoinColumn(name="dept_code")
	private Ex4_Department department; 
	@Id
	@ManyToOne
	@JoinColumn(name="employee_id")
	private Ex4_Employee employee; 
	@Column(name="role", nullable=false)
	private String role;
}