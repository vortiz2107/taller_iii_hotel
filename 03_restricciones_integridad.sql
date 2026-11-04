ALTER TABLE habitacion
ADD CONSTRAINT ck_habitacion_tipo
CHECK (tipo IN ('Sencilla', 'Doble', 'Suite'));

ALTER TABLE habitacion
ADD CONSTRAINT ck_habitacion_estado
CHECK (estado IN ('Disponible', 'Ocupada', 'Mantenimiento'));

ALTER TABLE pago
ADD CONSTRAINT ck_pago_monto
CHECK (monto > 0);

ALTER TABLE pago
ADD CONSTRAINT ck_pago_metodo
CHECK (metodo IN ('Tarjeta', 'Efectivo', 'Transferencia'));