-- =====================================================
-- PARTE 5.2
-- TRANSACCION: REGISTRAR RESERVA Y PAGO INICIAL
-- =====================================================

BEGIN;

-- Registrar nueva reserva
INSERT INTO reserva (
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida
)
VALUES (
    11,
    2,
    '2026-11-25',
    '2026-11-28'
)
RETURNING id_reserva;

-- Registrar pago inicial de la reserva creada
INSERT INTO pago (
    id_reserva,
    fecha_pago,
    monto,
    metodo
)
VALUES (
    currval(pg_get_serial_sequence('reserva', 'id_reserva')),
    CURRENT_DATE,
    390000.00,
    'Tarjeta'
)
RETURNING
    id_pago,
    id_reserva,
    fecha_pago,
    monto,
    metodo;

COMMIT;


SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida,
    p.id_pago,
    p.fecha_pago,
    p.monto,
    p.metodo
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
JOIN pago p
    ON r.id_reserva = p.id_reserva
WHERE r.id_cliente = 11
  AND r.id_habitacion = 2
  AND r.fecha_entrada = '2026-11-25';


BEGIN;

INSERT INTO reserva (
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida
)
VALUES (
    12,
    4,
    '2026-11-25',
    '2026-11-28'
);

INSERT INTO pago (
    id_reserva,
    fecha_pago,
    monto,
    metodo
)
VALUES (
    currval(pg_get_serial_sequence('reserva', 'id_reserva')),
    CURRENT_DATE,
    0,
    'Efectivo'
);

