BEGIN;

CREATE EXTENSION IF NOT EXISTS btree_gist;

ALTER TABLE reserva
ADD CONSTRAINT ex_reserva_sin_superposicion
EXCLUDE USING gist (
    id_habitacion WITH =,
    daterange(fecha_entrada, fecha_salida, '[)') WITH &&
);

COMMIT;