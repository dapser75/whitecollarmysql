package com.whitecollar.project;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;




import com.sun.istack.NotNull;


@Entity
//@Repository
//@EnableJpaRepositories
@Table(name="cuadros_tiendas")

public class Cuadro_Tienda{
	
	public Cuadro_Tienda(){
		
	}
	
	public Cuadro_Tienda(Cuadro_Tienda.PK pk, LocalDateTime localDateTime) {
		this.pk_cuadrotienda = pk;
		this.date = localDateTime;
		// TODO Auto-generated constructor stub
	}

	@EmbeddedId
	protected Cuadro_Tienda.PK pk_cuadrotienda;
	
	
	public Cuadro_Tienda.PK getPk_cuadrotienda() {
		return pk_cuadrotienda;
	}



	@Column (name="date", nullable=false)
	private LocalDateTime date;

	
	public LocalDateTime getDate() {
		return date;
	}
	
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	@Embeddable
	public static class PK implements Serializable {
		
		@Column (name = "tienda_id")
		@NotNull
		private int id_tienda;
		
		
		@Column(name = "cuadro_id")
		@NotNull
		private int id_cuadro;
		
		public PK() {
			
		}
		
		public PK (int id_tienda,int id_cuadro) {
			this.id_tienda = id_tienda;
			this.id_cuadro = id_cuadro;
		}

		public int getId_tienda() {
			return id_tienda;
		}

		public void setId_tienda(int id_tienda) {
			this.id_tienda = id_tienda;
		}

		public int getId_cuadro() {
			return id_cuadro;
		}

		public void setId_cuadro(int id_cuadro) {
			this.id_cuadro = id_cuadro;
		}
	
	}
	

}
