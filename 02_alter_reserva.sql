ALTER TABLE reserva
ADD CONSTRAINT ck_reserva_fechas
CHECK (fecha_salida > fecha_entrada);
