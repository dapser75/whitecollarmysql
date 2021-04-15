package com.whitecollar.project;


import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;


@Entity
@Table(name="tiendaview")
@Immutable
public class TiendaView {
	
	@Id
	@Column(name="id_tienda")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_tienda;

	@Column(name="name")
	private String name;
	
	@Column(name="capacity")
	private int capacity;
	
	@Column(name="occupation")
	private int occupation;

	public int getId_tienda() {
		return id_tienda;
	}
	
	public String getName() {
		return name;
	}
		
	public int getCapacity() {
		return capacity;
	}

	public int getOccupation() {
		return occupation;
	}
	
	
	

}
