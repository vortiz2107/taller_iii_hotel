-- =====================================================
-- CONSULTA BASICA 1
-- Listar todas las habitaciones disponibles
-- =====================================================

SELECT
    id_habitacion,
    numero,
    tipo,
    precio_noche,
    estado
FROM habitacion
WHERE estado = 'Disponible'
ORDER BY numero;


EXPLAIN ANALYZE
SELECT
    id_habitacion,
    numero,
    tipo,
    precio_noche,
    estado
FROM habitacion
WHERE estado = 'Disponible'
ORDER BY numero;


-- =====================================================
-- CONSULTA BASICA 2
-- Mostrar las reservas activas en la fecha actual
-- =====================================================

SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    h.tipo,
    r.fecha_entrada,
    r.fecha_salida
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE r.fecha_entrada <= CURRENT_DATE
  AND r.fecha_salida > CURRENT_DATE
ORDER BY r.fecha_entrada;


EXPLAIN ANALYZE
SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    h.tipo,
    r.fecha_entrada,
    r.fecha_salida
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE r.fecha_entrada <= CURRENT_DATE
  AND r.fecha_salida > CURRENT_DATE
ORDER BY r.fecha_entrada;

-- =====================================================
-- CONSULTA BASICA 3
-- Mostrar las reservas con mas de 3 noches de estadia
-- =====================================================

SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida,
    (r.fecha_salida - r.fecha_entrada) AS noches
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE (r.fecha_salida - r.fecha_entrada) > 3
ORDER BY noches DESC, r.id_reserva;

EXPLAIN ANALYZE
SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida,
    (r.fecha_salida - r.fecha_entrada) AS noches
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE (r.fecha_salida - r.fecha_entrada) > 3
ORDER BY noches DESC, r.id_reserva;