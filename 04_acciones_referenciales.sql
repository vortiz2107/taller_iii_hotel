ALTER TABLE reserva
DROP CONSTRAINT reserva_id_cliente_fkey;

ALTER TABLE reserva
ADD CONSTRAINT fk_reserva_cliente
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON UPDATE CASCADE
ON DELETE RESTRICT;


ALTER TABLE reserva
DROP CONSTRAINT reserva_id_habitacion_fkey;

ALTER TABLE reserva
ADD CONSTRAINT fk_reserva_habitacion
FOREIGN KEY (id_habitacion)
REFERENCES habitacion(id_habitacion)
ON UPDATE CASCADE
ON DELETE RESTRICT;


ALTER TABLE pago
DROP CONSTRAINT pago_id_reserva_fkey;

ALTER TABLE pago
ADD CONSTRAINT fk_pago_reserva
FOREIGN KEY (id_reserva)
REFERENCES reserva(id_reserva)
ON UPDATE CASCADE
ON DELETE RESTRICT;