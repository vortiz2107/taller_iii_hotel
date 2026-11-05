-- ============================================
-- VERIFICACION DE CANTIDAD DE REGISTROS
-- ============================================
SELECT 'cliente' AS tabla, COUNT(*) AS cantidad
FROM cliente

UNION ALL

SELECT 'habitacion', COUNT(*)
FROM habitacion

UNION ALL

SELECT 'reserva', COUNT(*)
FROM reserva

UNION ALL

SELECT 'pago', COUNT(*)
FROM pago;

-- ============================================
-- VERIFICACION DE CLAVES FORANEAS
-- ============================================

SELECT COUNT(*) AS reservas_con_cliente_invalido
FROM reserva r
LEFT JOIN cliente c
    ON r.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

SELECT COUNT(*) AS reservas_con_habitacion_invalida
FROM reserva r
LEFT JOIN habitacion h
    ON r.id_habitacion = h.id_habitacion
WHERE h.id_habitacion IS NULL;

SELECT COUNT(*) AS pagos_con_reserva_invalida
FROM pago p
LEFT JOIN reserva r
    ON p.id_reserva = r.id_reserva
WHERE r.id_reserva IS NULL;

-- ============================================
-- VERIFICACION DE FECHAS
-- ============================================

SELECT
    id_reserva,
    TO_CHAR(fecha_entrada, 'DD/MM/YYYY') AS fecha_entrada,
    TO_CHAR(fecha_salida, 'DD/MM/YYYY') AS fecha_salida
FROM reserva
WHERE fecha_salida <= fecha_entrada;

-- ============================================
-- VERIFICACION DE RESERVAS SUPERPUESTAS
-- ============================================

SELECT
    r1.id_habitacion,
    r1.id_reserva AS reserva_1,
    TO_CHAR(r1.fecha_entrada, 'DD/MM/YYYY') AS entrada_1,
    TO_CHAR(r1.fecha_salida, 'DD/MM/YYYY') AS salida_1,
    r2.id_reserva AS reserva_2,
    TO_CHAR(r2.fecha_entrada, 'DD/MM/YYYY') AS entrada_2,
    TO_CHAR(r2.fecha_salida, 'DD/MM/YYYY') AS salida_2
FROM reserva r1
JOIN reserva r2
    ON r1.id_habitacion = r2.id_habitacion
    AND r1.id_reserva < r2.id_reserva
WHERE daterange(r1.fecha_entrada, r1.fecha_salida, '[)')
      &&
      daterange(r2.fecha_entrada, r2.fecha_salida, '[)');
