-- =====================================================
-- CONSULTA AGREGACION 1
-- Obtener el total de ingresos generados por mes
-- =====================================================

SELECT
    TO_CHAR(fecha_pago, 'MM/YYYY') AS mes,
    SUM(monto) AS total_ingresos
FROM pago
GROUP BY
    DATE_TRUNC('month', fecha_pago),
    TO_CHAR(fecha_pago, 'MM/YYYY')
ORDER BY DATE_TRUNC('month', fecha_pago);

EXPLAIN ANALYZE
SELECT
    TO_CHAR(fecha_pago, 'MM/YYYY') AS mes,
    SUM(monto) AS total_ingresos
FROM pago
GROUP BY
    DATE_TRUNC('month', fecha_pago),
    TO_CHAR(fecha_pago, 'MM/YYYY')
ORDER BY DATE_TRUNC('month', fecha_pago);


-- =====================================================
-- CONSULTA AGREGACION 2
-- Numero de reservas realizadas por cada cliente
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    COUNT(r.id_reserva) AS total_reservas
FROM cliente c
LEFT JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    total_reservas DESC,
    c.nombre;

EXPLAIN ANALYZE
SELECT
    c.id_cliente,
    c.nombre,
    COUNT(r.id_reserva) AS total_reservas
FROM cliente c
LEFT JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    total_reservas DESC,
    c.nombre;


-- =====================================================
-- CONSULTA AGREGACION 3
-- Habitaciones reservadas mas de 5 veces
-- =====================================================

SELECT
    h.id_habitacion,
    h.numero,
    h.tipo,
    COUNT(r.id_reserva) AS total_reservas
FROM habitacion h
JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
GROUP BY
    h.id_habitacion,
    h.numero,
    h.tipo
HAVING COUNT(r.id_reserva) > 5
ORDER BY total_reservas DESC;

EXPLAIN ANALYZE
SELECT
    h.id_habitacion,
    h.numero,
    h.tipo,
    COUNT(r.id_reserva) AS total_reservas
FROM habitacion h
JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
GROUP BY
    h.id_habitacion,
    h.numero,
    h.tipo
HAVING COUNT(r.id_reserva) > 5
ORDER BY total_reservas DESC;


-- =====================================================
-- CONSULTA AGREGACION 4
-- Clientes con el mayor gasto total acumulado
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    SUM(p.monto) AS gasto_total
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    gasto_total DESC;


EXPLAIN ANALYZE
SELECT
    c.id_cliente,
    c.nombre,
    SUM(p.monto) AS gasto_total
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    gasto_total DESC;

-- =====================================================
-- CONSULTA AGREGACION 5
-- Clientes que han pagado usando mas de un metodo
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    COUNT(DISTINCT p.metodo) AS total_metodos
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    c.id_cliente,
    c.nombre
HAVING COUNT(DISTINCT p.metodo) > 1
ORDER BY
    total_metodos DESC,
    c.nombre;

EXPLAIN ANALYZE
SELECT
    c.id_cliente,
    c.nombre,
    COUNT(DISTINCT p.metodo) AS total_metodos
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    c.id_cliente,
    c.nombre
HAVING COUNT(DISTINCT p.metodo) > 1
ORDER BY
    total_metodos DESC,
    c.nombre;


-- =====================================================
-- CONSULTA AGREGACION 6
-- Promedio de noches reservadas por tipo de habitacion
-- =====================================================

SELECT
    h.tipo,
    ROUND(AVG(r.fecha_salida - r.fecha_entrada), 2) AS promedio_noches
FROM habitacion h
JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
GROUP BY
    h.tipo
ORDER BY
    promedio_noches DESC;

EXPLAIN ANALYZE
SELECT
    h.tipo,
    ROUND(AVG(r.fecha_salida - r.fecha_entrada), 2) AS promedio_noches
FROM habitacion h
JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
GROUP BY
    h.tipo
ORDER BY
    promedio_noches DESC;

-- =====================================================
-- CONSULTA AGREGACION 7
-- Total de reservas y monto total por tipo de habitacion
-- =====================================================

SELECT
    h.tipo,
    COUNT(DISTINCT r.id_reserva) AS total_reservas,
    COALESCE(SUM(p.monto), 0) AS monto_total
FROM habitacion h
LEFT JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
LEFT JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    h.tipo
ORDER BY
    monto_total DESC;


EXPLAIN ANALYZE
SELECT
    h.tipo,
    COUNT(DISTINCT r.id_reserva) AS total_reservas,
    COALESCE(SUM(p.monto), 0) AS monto_total
FROM habitacion h
LEFT JOIN reserva r
    ON h.id_habitacion = r.id_habitacion
LEFT JOIN pago p
    ON r.id_reserva = p.id_reserva
GROUP BY
    h.tipo
ORDER BY
    monto_total DESC;

-- =====================================================
-- CONSULTA AGREGACION 8
-- Tres clientes con mas noches reservadas en total
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    SUM(r.fecha_salida - r.fecha_entrada) AS total_noches
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    total_noches DESC,
    c.nombre
LIMIT 3;

EXPLAIN ANALYZE
SELECT
    c.id_cliente,
    c.nombre,
    SUM(r.fecha_salida - r.fecha_entrada) AS total_noches
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
ORDER BY
    total_noches DESC,
    c.nombre
LIMIT 3;

-- =====================================================
-- CONSULTA AGREGACION 9
-- Ingreso total por cada metodo de pago
-- =====================================================

SELECT
    metodo,
    SUM(monto) AS ingreso_total
FROM pago
GROUP BY
    metodo
ORDER BY
    ingreso_total DESC;

EXPLAIN ANALYZE
SELECT
    metodo,
    SUM(monto) AS ingreso_total
FROM pago
GROUP BY
    metodo
ORDER BY
    ingreso_total DESC;

-- =====================================================
-- CONSULTA AGREGACION 10
-- Clientes que han reservado mas de una habitacion diferente
-- =====================================================

SELECT
    c.id_cliente,
    c.nombre,
    COUNT(DISTINCT r.id_habitacion) AS habitaciones_diferentes
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
HAVING COUNT(DISTINCT r.id_habitacion) > 1
ORDER BY
    habitaciones_diferentes DESC,
    c.nombre;

EXPLAIN ANALYZE
SELECT
    c.id_cliente,
    c.nombre,
    COUNT(DISTINCT r.id_habitacion) AS habitaciones_diferentes
FROM cliente c
JOIN reserva r
    ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente,
    c.nombre
HAVING COUNT(DISTINCT r.id_habitacion) > 1
ORDER BY
    habitaciones_diferentes DESC,
    c.nombre;