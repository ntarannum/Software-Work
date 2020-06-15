package jpa.c;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="Ex3_Department")
public class Ex3_Department {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="dept_code", nullable=false)
	private String dept_code;
	@Column(name="dept_name", nullable=false)
	private String dept_name;
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, orphanRemoval=true)
	@JoinColumn(name="module_dept", referencedColumnName="dept_code")
	private List<Ex3_Module> moduleList = new ArrayList<>();
	
}