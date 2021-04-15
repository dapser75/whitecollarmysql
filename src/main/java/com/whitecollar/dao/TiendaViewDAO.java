package com.whitecollar.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.whitecollar.project.Cuadro_Tienda;
import com.whitecollar.project.TiendaView;

public interface TiendaViewDAO extends JpaRepository<TiendaView, Long> {

	@Query(value = "SELECT * FROM tiendaview as c where c.id_tienda= :id", nativeQuery = true)
	List<TiendaView> findbyidtienda(@Param(value = "id") int id);

}
