package com.whitecollar.dao;

import java.util.List;

import javax.transaction.Transactional;

//import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.whitecollar.project.Cuadro_Tienda;

@Repository
@Transactional
public interface Cuadros_TiendasDAO extends JpaRepository<Cuadro_Tienda, Long> {
	
	@Query(value = "SELECT * FROM cuadros_tiendas as c where c.tienda_id = :id", nativeQuery = true)
	List<Cuadro_Tienda> findallbyidtienda(@Param(value = "id") int id);	
	
	
	
}