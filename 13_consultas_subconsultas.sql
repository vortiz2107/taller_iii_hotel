-- =====================================================
-- SUBCONSULTA 1
-- Habitaciones cuyo precio es mayor al precio promedio
-- =====================================================

SELECT
    id_habitacion,
    numero,
    tipo,
    precio_noche,
    estado
FROM habitacion
WHERE precio_noche > (
    SELECT AVG(precio_noche)
    FROM habitacion
)
ORDER BY precio_noche DESC;


EXPLAIN ANALYZE
SELECT
    id_habitacion,
    numero,
    tipo,
    precio_noche,
    estado
FROM habitacion
WHERE precio_noche > (
    SELECT AVG(precio_noche)
    FROM habitacion
)
ORDER BY precio_noche DESC;


-- =====================================================
-- SUBCONSULTA 2
-- Cliente que ha realizado la reserva mas costosa
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    r.id_reserva,
    h.numero AS habitacion,
    h.tipo,
    (r.fecha_salida - r.fecha_entrada) * h.precio_noche AS total_reserva
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE (r.fecha_salida - r.fecha_entrada) * h.precio_noche = (
    SELECT MAX(
        (r2.fecha_salida - r2.fecha_entrada) * h2.precio_noche
    )
    FROM reserva r2
    JOIN habitacion h2
        ON r2.id_habitacion = h2.id_habitacion
);



-- =====================================================
-- SUBCONSULTA 3
-- Habitaciones que nunca han sido reservadas
-- =====================================================

SELECT
    h.id_habitacion,
    h.numero,
    h.tipo,
    h.precio_noche,
    h.estado
FROM habitacion h
WHERE h.id_habitacion NOT IN (
    SELECT r.id_habitacion
    FROM reserva r
)
ORDER BY h.numero;

EXPLAIN ANALYZE
SELECT
    h.id_habitacion,
    h.numero,
    h.tipo,
    h.precio_noche,
    h.estado
FROM habitacion h
WHERE h.id_habitacion NOT IN (
    SELECT r.id_habitacion
    FROM reserva r
)
ORDER BY h.numero;

-- =====================================================
-- SUBCONSULTA 4
-- Reservas que no tienen pagos registrados
-- =====================================================

SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE r.id_reserva NOT IN (
    SELECT p.id_reserva
    FROM pago p
)
ORDER BY r.id_reserva;

EXPLAIN ANALYZE
SELECT
    r.id_reserva,
    c.nombre AS cliente,
    h.numero AS habitacion,
    r.fecha_entrada,
    r.fecha_salida
FROM reserva r
JOIN cliente c
    ON r.id_cliente = c.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE r.id_reserva NOT IN (
    SELECT p.id_reserva
    FROM pago p
)
ORDER BY r.id_reserva;


-- =====================================================
-- SUBCONSULTA 5
-- Habitacion mas cara reservada por cada cliente
-- =====================================================
SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    h.id_habitacion,
    h.numero AS habitacion,
    h.tipo,
    h.precio_noche
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE h.precio_noche = (
    SELECT MAX(h2.precio_noche)
    FROM reserva r2
    JOIN habitacion h2
        ON r2.id_habitacion = h2.id_habitacion
    WHERE r2.id_cliente = c.id_cliente
)
ORDER BY
    c.nombre,
    h.numero;
	

EXPLAIN ANALYZE
SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    h.id_habitacion,
    h.numero AS habitacion,
    h.tipo,
    h.precio_noche
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE h.precio_noche = (
    SELECT MAX(h2.precio_noche)
    FROM reserva r2
    JOIN habitacion h2
        ON r2.id_habitacion = h2.id_habitacion
    WHERE r2.id_cliente = c.id_cliente
)
ORDER BY
    c.nombre,
    h.numero;

