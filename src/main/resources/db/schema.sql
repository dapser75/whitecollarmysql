DROP TABLE IF EXISTS cuadros_tiendas;
DROP TABLE IF EXISTS cuadro;
DROP TABLE IF EXISTS tienda;

CREATE TABLE tienda (
  id_tienda INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  capacity INT NULL,
  PRIMARY KEY (id_tienda));

CREATE TABLE cuadro (
  id_cuadro INT NOT NULL AUTO_INCREMENT,
  tittle VARCHAR(200) NULL,
  author VARCHAR(45) NULL DEFAULT 'Anonimo',
  prize DOUBLE NULL,
  PRIMARY KEY (id_cuadro));
  
 
CREATE TABLE cuadros_tiendas (
  tienda_id INT NOT NULL,
  cuadro_id INT NOT NULL,
  date DATETIME NULL,
  PRIMARY KEY (tienda_id, cuadro_id),
  CONSTRAINT fktienda_id
    FOREIGN KEY (tienda_id)
    REFERENCES tienda (id_tienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fkcuadro_id
    FOREIGN KEY (cuadro_id)
    REFERENCES cuadro (id_cuadro)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

