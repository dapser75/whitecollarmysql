package com.whitecollar.project;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tienda")
public class Tienda {
	
	@Id
	@Column(name="id_tienda")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_tienda;

	@Column(name="name",nullable=false,length=100 )
	private String name;
	
	@Column(name="capacity",nullable=false)
	private int capacity;
	
	public Tienda() {
		
	}

	public Tienda (int id_tienda, String name, int capacity) {
		this.id_tienda=id_tienda;
		this.name=name;
		this.capacity=capacity;

	}

	public int getId_tienda() {
		return id_tienda;
	}
	
	public void setId_tienda(int id_tienda) {
		this.id_tienda = id_tienda;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCapacity() {
		return capacity;
	}
	
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	

}
