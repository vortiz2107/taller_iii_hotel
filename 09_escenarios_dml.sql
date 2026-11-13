-- =====================================================
-- ESCENARIO 1
-- Cambiar el estado de una habitacion
-- =====================================================

BEGIN;

SELECT
    id_habitacion,
    numero,
    estado
FROM habitacion
WHERE numero = '102';

UPDATE habitacion
SET estado = 'Mantenimiento'
WHERE numero = '102'
RETURNING
    id_habitacion,
    numero,
    estado;

COMMIT;


-- =====================================================
-- ESCENARIO 2
-- Registrar un nuevo pago
-- =====================================================

BEGIN;

SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida,
    (r.fecha_salida - r.fecha_entrada) * h.precio_noche AS total_reserva
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE r.id_reserva = 6;

INSERT INTO pago (
    id_reserva,
    fecha_pago,
    monto,
    metodo
)
VALUES (
    6,
    '2026-11-25',
    540000.00,
    'Tarjeta'
)
RETURNING
    id_pago,
    id_reserva,
    fecha_pago,
    monto,
    metodo;

COMMIT;

-- =====================================================
-- ESCENARIO 3
-- Cancelar una reserva
-- =====================================================

BEGIN;

SELECT
    r.id_reserva,
    r.id_cliente,
    r.id_habitacion,
    p.id_pago
FROM reserva r
LEFT JOIN pago p
    ON r.id_reserva = p.id_reserva
WHERE r.id_reserva = 30
  AND p.id_pago IS NULL;

DELETE FROM reserva
WHERE id_reserva = 30
RETURNING
    id_reserva,
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida;

COMMIT;