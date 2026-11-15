-- =====================================================
-- CONSULTA JOIN 1
-- Clientes que han reservado una habitacion tipo Suite
-- =====================================================

SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    c.nacionalidad
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE h.tipo = 'Suite'
ORDER BY c.nombre;

EXPLAIN ANALYZE
SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    c.nacionalidad
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE h.tipo = 'Suite'
ORDER BY c.nombre;


-- =====================================================
-- CONSULTA JOIN 2
-- Clientes de Colombia que hayan realizado reservas
-- =====================================================

SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    c.nacionalidad
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
WHERE c.nacionalidad = 'Colombia'
ORDER BY c.nombre;

EXPLAIN ANALYZE
SELECT DISTINCT
    c.id_cliente,
    c.nombre,
    c.nacionalidad
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
WHERE c.nacionalidad = 'Colombia'
ORDER BY c.nombre;

