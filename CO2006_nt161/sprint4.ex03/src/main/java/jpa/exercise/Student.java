/**
 * (C) Artur Boronat, 2016
 */
package jpa.exercise;

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name="Students")
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name="Students_id")
    private int id;
	@Column(name="Students_fullName")
    private String fullName;
    @ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
    @JoinTable(name="StudentsModules",
    	joinColumns=@JoinColumn(
    			name="Modules_Students_id",
    			referencedColumnName="Students_id"
    	),
    	inverseJoinColumns=@JoinColumn(
    		name="Students_modules_id",
    		referencedColumnName="Modules_id"
    	)
    )
	private List<Module> moduleList = new ArrayList<Module>();
    

}