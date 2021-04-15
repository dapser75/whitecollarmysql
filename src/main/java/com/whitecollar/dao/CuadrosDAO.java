package com.whitecollar.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.whitecollar.project.Cuadro;
import com.whitecollar.project.Cuadro_Tienda;


public interface CuadrosDAO extends JpaRepository<Cuadro, Long>{
	//SELECT cuadro.* from cuadro join cuadros_tiendas on cuadro.id_cuadro=cuadros_tiendas.cuadro_id and cuadros_tiendas.tienda_id=1
	
	@Query(value = "SELECT cuadro.* from cuadro join cuadros_tiendas on cuadro.id_cuadro=cuadros_tiendas.cuadro_id and cuadros_tiendas.tienda_id= :id", nativeQuery = true)
	List<Cuadro> findpicturesbyidtienda(@Param(value = "id") int id);	
}
