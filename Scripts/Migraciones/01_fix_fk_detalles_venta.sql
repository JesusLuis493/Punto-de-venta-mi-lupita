-- Corrige FK mal definida y agrega AUTO_INCREMENT a Detalles_venta.id_Detalles
ALTER TABLE mydb.Detalles_venta
  DROP FOREIGN KEY fk_Detalles_venta_Productos1;

ALTER TABLE mydb.Detalles_venta
  MODIFY id_Detalles INT NOT NULL AUTO_INCREMENT;

ALTER TABLE mydb.Detalles_venta
  ADD CONSTRAINT fk_Detalles_venta_Productos1
  FOREIGN KEY (id_Productos) REFERENCES mydb.Productos(id_Productos)
  ON DELETE CASCADE ON UPDATE CASCADE;
