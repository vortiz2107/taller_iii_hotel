-- =====================================================
-- PARTE 5. VISTAS
-- =====================================================

BEGIN;

-- =====================================================
-- VISTA 1
-- Reservas activas con datos del cliente y habitacion
-- =====================================================

CREATE VIEW vista_reservas_activas AS
SELECT
    r.id_reserva,
    c.id_cliente,
    c.nombre AS cliente,
    h.id_habitacion,
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
  AND r.fecha_salida > CURRENT_DATE;


-- =====================================================
-- VISTA 2
-- Ingresos generados por mes
-- =====================================================

CREATE VIEW vista_ingresos_mensuales AS
SELECT
    DATE_TRUNC('month', fecha_pago) AS mes,
    SUM(monto) AS total_ingresos
FROM pago
GROUP BY DATE_TRUNC('month', fecha_pago);

COMMIT;

SELECT *
FROM vista_reservas_activas
ORDER BY fecha_entrada;

SELECT
    TO_CHAR(mes, 'MM/YYYY') AS mes,
    total_ingresos
FROM vista_ingresos_mensuales
ORDER BY mes;