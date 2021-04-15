package com.whitecollar.project;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="cuadro")
public class Cuadro {

	@Id
	@Column(name="id_cuadro")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_cuadro;
	
	@Column(name="tittle", nullable=false,length=200)
	private String tittle;
	
	@Column(name="author",length=45)
	private String author;

	@Column(name="prize", nullable=false)
	private float prize;

	public Cuadro() {
		
	}
	
	public Cuadro(int id_cuadro, String tittle, float prize) {
		this.id_cuadro=id_cuadro;
		this.author="Anónimo";
		this.tittle=tittle;
		this.prize=prize;
	}
	
	public Cuadro(int id_cuadro,String author, String tittle, float prize) {
		this.id_cuadro=id_cuadro;
		this.author=author;
		this.tittle=tittle;
		this.prize=prize;
	}
		
	public int getId_cuadro() {
		return id_cuadro;
	}
	
	public void setId_cuadro(int id_cuadro) {
		this.id_cuadro = id_cuadro;
	}
	
	public String getTittle() {
		return tittle;
	}
	
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrize() {
		return prize;
	}
	
	public void setPrize(long prize) {
		this.prize = prize;
	}
	
}

