package com.whitecollar.controllers;

import java.time.LocalDateTime;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.whitecollar.dao.CuadrosDAO;
import com.whitecollar.dao.Cuadros_TiendasDAO;
import com.whitecollar.dao.TiendaViewDAO;
import com.whitecollar.dao.TiendasDAO;
import com.whitecollar.project.Cuadro;
import com.whitecollar.project.Cuadro_Tienda;
import com.whitecollar.project.Cuadro_Tienda.PK;
import com.whitecollar.project.Tienda;
import com.whitecollar.project.TiendaView;

/*
 * 
 * Crear botiga: li direm el nom i la capacitat (POST /shops/). 
Llistar botigues: retorna la llista de botigues amb el seu nom i la capacitat (GET /shops/). 
Afegir quadre: li donarem el nom del quadre i el del autor (POST /shops/{ID}/pictures) 
Llistar els quadres de la botiga (GET /shops/{ID}/pictures). 
Incendiar quadres: per si ve la policia, es poden eliminar tots els quadres de la botiga sense deixar rastre (DELETE /shops/{ID}/pictures). 
 * 
 * 
 */
@RestController("/")
@CrossOrigin(origins = "http://localhost:8080")
public class ControllerRest {
	
	@Autowired
	private Cuadros_TiendasDAO cuadros_tiendasDAO;
	
	@Autowired
	private CuadrosDAO cuadrosDAO;
	
	@Autowired
	private TiendasDAO tiendasDAO;
	
	@Autowired
	private TiendaViewDAO tiendaviewDAO;
	
	@GetMapping("GET/cuadrostiendas")
	public ResponseEntity<List<Cuadro_Tienda>> getCuadrosTienda() {
		List<Cuadro_Tienda> cuadrostiendas = cuadros_tiendasDAO.findAll();
		return ResponseEntity.ok(cuadrostiendas);
	}
	
	//Metodo para devolver todos los cuadros de una tienda
	@RequestMapping(path = "/GET/shops/{idtienda}/pictures", method = RequestMethod.GET)
	public ResponseEntity<List<Cuadro>> getTiendaViewbyid(@PathVariable(value = "idtienda")  String idtienda) {
		Integer id2=0;
		try {
			id2=Integer.valueOf(idtienda);
		}catch (Exception e) {
			return new ResponseEntity("Parámetro incorrecto", HttpStatus.OK);
		}
		//Integer i=Integer.valueOf(s); 
		if (idtienda == null) return new ResponseEntity("Falta partámetro de consulta o parámetro de consulta incorrecto", HttpStatus.OK);
		else {
			List<Cuadro> cuadros= cuadrosDAO.findpicturesbyidtienda(id2);
			if (cuadros.isEmpty()) return new ResponseEntity("La tienda no tiene cuadros asociados.", HttpStatus.OK);
			else return ResponseEntity.ok(cuadros);
		}
	}

	//Método para devolver todas las tiendas
	@RequestMapping(value = "/GET/shops", method = RequestMethod.GET)
	public ResponseEntity<List<Tienda>> getTienda() {

		List<Tienda> tiendas = tiendasDAO.findAll();
		return ResponseEntity.ok(tiendas);
		
	}
	
	//Método para ver todos los cuadros
	@GetMapping("GET/cuadros")
	public ResponseEntity<List <Cuadro>> getCuadro() {
		List<Cuadro> cuadros = cuadrosDAO.findAll();
		return ResponseEntity.ok(cuadros);
		
	}
	
	//Método para devolver la ocupación de la tienda
	@GetMapping("GET/shopoccupation")
	public ResponseEntity<List <TiendaView>> getTiendaView() {
		List<TiendaView> tiendasviews = tiendaviewDAO.findAll();
		return ResponseEntity.ok(tiendasviews);
		
	}
		
	//Método para devolver la ocupacion de una tienda
	@GetMapping("GET/shopoccupation/{id}")
	public ResponseEntity<List<TiendaView>> getTiendaViewbyID(@PathVariable ("id")  String idtienda) {
		int id2;
		try {
			id2=Integer.valueOf(idtienda);
			
		} catch (Exception e) {
			return new ResponseEntity("Parámetro incorrecto" + e, HttpStatus.OK);
 
		}
		List<TiendaView> tiendasviews = tiendaviewDAO.findbyidtienda(id2);
		if (tiendasviews.isEmpty()) {
			return new ResponseEntity("Tienda no encontrada", HttpStatus.OK);
		}else {
			return ResponseEntity.ok(tiendasviews);
		}
	}

	//Método para insertar cuadro en una tienda
	@RequestMapping (value="/POST/shops/{id}/pictures", method=RequestMethod.POST)
	public ResponseEntity<Cuadro_Tienda> postpictureinshop(@RequestBody Cuadro cuadro, @PathVariable("id") String idtienda) {
		Integer id2=0;
				
		try {
			id2=Integer.valueOf(idtienda);
		}catch (Exception e) {
			return new ResponseEntity("Parámetro incorrecto", HttpStatus.OK);
		}
		if (idtienda == null) return new ResponseEntity("Falta partámetro de consulta o parámetro de consulta incorrecto", HttpStatus.OK);
		else {
			List<TiendaView> tiendasviews = tiendaviewDAO.findbyidtienda(id2);
			
			if (tiendasviews.isEmpty()) {
				return new ResponseEntity("Tienda no encontrada, no se ha podido insertar el cuadro", HttpStatus.OK);
			}else {
				TiendaView tv=tiendasviews.get(0);
				if (tv.getCapacity() <= tv.getOccupation()) {
					return new ResponseEntity("La tienda no tiene capacidad para almacenar más cuadros", HttpStatus.OK);
				}
				else {
					if (cuadro.getAuthor()==null) cuadro.setAuthor("Anónimo");//Insertar autor anonimo
					
					Cuadro newcuadro = cuadrosDAO.save(cuadro);
					PK pk=new Cuadro_Tienda.PK(id2,newcuadro.getId_cuadro());
					Cuadro_Tienda ct = new Cuadro_Tienda(pk,LocalDateTime.now());
					Cuadro_Tienda newct = cuadros_tiendasDAO.save(ct);
					return ResponseEntity.ok(newct);
				} //end else
			} //end if-else
		}//end else if
	} //end metodo

	//Método para añadir tiendas
	@PostMapping("/POST/shops/")
	public ResponseEntity <Tienda> crearTienda(@RequestBody Tienda tienda) {
		Tienda newtienda = tiendasDAO.save(tienda);
		return ResponseEntity.ok(newtienda);
	}
	
	//Método para añadir cuadros sin tienda
	@PostMapping("/POST/picture/")
	public ResponseEntity <Cuadro> crearCuadro(@RequestBody Cuadro cuadro) {
		if (cuadro.getAuthor()==null) cuadro.setAuthor("Anónimo");//Insertar autor anonimo
		Cuadro newcuadro = cuadrosDAO.save(cuadro);
		return ResponseEntity.ok(newcuadro);
	}
	
		
	//Metodo para borrar 1 cuadro en concreto
	@RequestMapping(value = "/DELETE/picture/{id}", method = RequestMethod.DELETE)
	public ResponseEntity <Void> deleteCuadro(@PathVariable ("id")  int id) {
		cuadrosDAO.deleteById((long) id);
		return ResponseEntity.ok(null);
	}
	
	
	//Método para borrar todos los cuadros de una tienda
	@RequestMapping(value = "/DELETE/shops/{id}/pictures", method = RequestMethod.GET)
	public ResponseEntity <Void> deleteCuadrobytienda(@PathVariable ("id")  String idtienda) {
		
		Integer id2=0;
		try {
			id2=Integer.valueOf(idtienda);
		}catch (Exception e) {
			return new ResponseEntity("Parámetro incorrecto", HttpStatus.OK);
		}
		if (id2 == null) return new ResponseEntity("Falta parámetro de consulta o parámetro de consulta incorrecto", HttpStatus.OK);
		else {	
			List<TiendaView> tiendasviews = tiendaviewDAO.findbyidtienda(id2);
			if (tiendasviews.isEmpty()) {
				return new ResponseEntity("Tienda no encontrada, no hay nada que borrar", HttpStatus.OK);
			}else {
				List<Cuadro> cuadros= cuadrosDAO.findpicturesbyidtienda(id2);
				if (cuadros.isEmpty()) return new ResponseEntity("La tienda no tiene cuadros asociados", HttpStatus.OK);
				else {
					for (Cuadro c :cuadros) { //Recorremos la lista para borrar todos los cuadros
						cuadrosDAO.delete(c); // Borrar el cuadro en cuestión
					}// end for
					return new ResponseEntity("Borrado con éxito", HttpStatus.OK); 
				} // end 3er if-else
			} //end 2º if-else
		
		} //end 1er if-else*/
		
	}//end metodo @DeleteMapping("DELETE/shops/{idtienda}/pictures")

}
