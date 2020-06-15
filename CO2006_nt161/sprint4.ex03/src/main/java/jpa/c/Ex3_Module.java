package jpa.c;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Ex3_Module")
public class Ex3_Module {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	@Column(name="module_code", nullable=false)
	private String module_code;
	@Column(name="module_title", nullable=false)
	private String module_title;
	@Column(name="module_credits", nullable=false)
	private int module_credits;
	
}
