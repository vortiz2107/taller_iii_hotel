-- =====================================================
-- DATOS SINTETICOS GENERADOS CON IA
-- 20 clientes
-- 10 habitaciones
-- 30 reservas
-- 30 pagos
-- =====================================================

TRUNCATE TABLE pago, reserva, habitacion, cliente RESTART IDENTITY;


-- =====================================================
-- CLIENTES
-- =====================================================

INSERT INTO cliente (nombre, correo, telefono, nacionalidad) VALUES
('Ana Torres', 'ana.torres@example.com', '3001000001', 'Colombia'),
('Carlos Ramirez', 'carlos.ramirez@example.com', '3001000002', 'Mexico'),
('Laura Gomez', 'laura.gomez@example.com', '3001000003', 'Colombia'),
('Mateo Herrera', 'mateo.herrera@example.com', '3001000004', 'Peru'),
('Sofia Martinez', 'sofia.martinez@example.com', '3001000005', 'Argentina'),
('Juan Castro', 'juan.castro@example.com', '3001000006', 'Colombia'),
('Valentina Rojas', 'valentina.rojas@example.com', '3001000007', 'Chile'),
('Daniel Lopez', 'daniel.lopez@example.com', '3001000008', 'Ecuador'),
('Camila Vargas', 'camila.vargas@example.com', '3001000009', 'Colombia'),
('Nicolas Perez', 'nicolas.perez@example.com', '3001000010', 'Mexico'),
('Mariana Diaz', 'mariana.diaz@example.com', '3001000011', 'Peru'),
('Andres Moreno', 'andres.moreno@example.com', '3001000012', 'Colombia'),
('Gabriela Ruiz', 'gabriela.ruiz@example.com', '3001000013', 'Ecuador'),
('Felipe Sanchez', 'felipe.sanchez@example.com', '3001000014', 'Argentina'),
('Isabella Restrepo', 'isabella.restrepo@example.com', '3001000015', 'Colombia'),
('Santiago Mejia', 'santiago.mejia@example.com', '3001000016', 'Chile'),
('Paula Fernandez', 'paula.fernandez@example.com', '3001000017', 'Colombia'),
('Tomas Cardona', 'tomas.cardona@example.com', '3001000018', 'Venezuela'),
('Juliana Arias', 'juliana.arias@example.com', '3001000019', 'Colombia'),
('Sebastian Marin', 'sebastian.marin@example.com', '3001000020', 'Espana');


-- =====================================================
-- HABITACIONES
-- =====================================================

INSERT INTO habitacion (numero, tipo, precio_noche, estado) VALUES
('101', 'Sencilla', 180000.00, 'Ocupada'),
('102', 'Doble', 260000.00, 'Disponible'),
('103', 'Suite', 420000.00, 'Disponible'),
('104', 'Sencilla', 175000.00, 'Disponible'),
('105', 'Doble', 250000.00, 'Disponible'),
('106', 'Suite', 400000.00, 'Disponible'),
('107', 'Sencilla', 170000.00, 'Disponible'),
('108', 'Doble', 245000.00, 'Disponible'),
('109', 'Suite', 390000.00, 'Disponible'),
('110', 'Sencilla', 165000.00, 'Mantenimiento');


-- =====================================================
-- RESERVAS
-- =====================================================

INSERT INTO reserva (
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida
) VALUES
(1, 1, '2026-10-01', '2026-10-04'),
(2, 1, '2026-10-05', '2026-10-08'),
(3, 1, '2026-10-10', '2026-10-14'),
(4, 1, '2026-10-15', '2026-10-19'),
(5, 1, '2026-11-01', '2026-11-05'),
(1, 1, '2026-12-01', '2026-12-04'),

(6, 2, '2026-10-02', '2026-10-06'),
(7, 2, '2026-11-10', '2026-11-13'),
(8, 2, '2026-12-15', '2026-12-19'),

(9, 3, '2026-10-05', '2026-10-08'),
(10, 3, '2026-11-01', '2026-11-04'),
(2, 3, '2026-12-05', '2026-12-10'),

(11, 4, '2026-10-12', '2026-10-14'),
(12, 4, '2026-11-16', '2026-11-20'),
(3, 4, '2026-12-20', '2026-12-23'),

(13, 5, '2026-10-20', '2026-10-24'),
(14, 5, '2026-11-05', '2026-11-09'),
(4, 5, '2026-12-01', '2026-12-05'),

(15, 6, '2026-10-07', '2026-10-11'),
(16, 6, '2026-11-18', '2026-11-22'),
(5, 6, '2026-12-12', '2026-12-16'),

(17, 7, '2026-10-03', '2026-10-05'),
(18, 7, '2026-11-07', '2026-11-11'),
(6, 7, '2026-12-22', '2026-12-26'),

(19, 8, '2026-10-14', '2026-10-18'),
(20, 8, '2026-11-21', '2026-11-24'),
(7, 8, '2026-12-03', '2026-12-07'),

(8, 9, '2026-10-25', '2026-10-29'),
(9, 9, '2026-11-12', '2026-11-16'),
(10, 9, '2026-12-18', '2026-12-22');


-- =====================================================
-- PAGOS
-- =====================================================

INSERT INTO pago (
    id_reserva,
    fecha_pago,
    monto,
    metodo
) VALUES
(1, '2026-09-25', 270000.00, 'Tarjeta'),
(1, '2026-10-01', 270000.00, 'Transferencia'),

(2, '2026-10-05', 540000.00, 'Efectivo'),
(3, '2026-10-10', 720000.00, 'Tarjeta'),
(4, '2026-10-15', 720000.00, 'Transferencia'),
(5, '2026-11-01', 720000.00, 'Efectivo'),

(7, '2026-09-28', 500000.00, 'Tarjeta'),
(7, '2026-10-02', 540000.00, 'Transferencia'),

(8, '2026-11-10', 780000.00, 'Efectivo'),
(9, '2026-12-15', 1040000.00, 'Tarjeta'),
(10, '2026-10-05', 1260000.00, 'Transferencia'),
(11, '2026-11-01', 1260000.00, 'Efectivo'),

(13, '2026-10-10', 175000.00, 'Tarjeta'),
(13, '2026-10-12', 175000.00, 'Efectivo'),

(14, '2026-11-16', 700000.00, 'Transferencia'),
(15, '2026-12-20', 525000.00, 'Efectivo'),
(16, '2026-10-20', 1000000.00, 'Tarjeta'),
(17, '2026-11-05', 1000000.00, 'Transferencia'),

(19, '2026-10-01', 800000.00, 'Efectivo'),
(19, '2026-10-07', 800000.00, 'Transferencia'),

(20, '2026-11-18', 1600000.00, 'Tarjeta'),
(21, '2026-12-12', 1600000.00, 'Tarjeta'),
(22, '2026-10-03', 340000.00, 'Efectivo'),
(23, '2026-11-07', 680000.00, 'Transferencia'),

(25, '2026-10-10', 490000.00, 'Tarjeta'),
(25, '2026-10-14', 490000.00, 'Efectivo'),

(26, '2026-11-21', 735000.00, 'Transferencia'),
(27, '2026-12-03', 980000.00, 'Efectivo'),
(28, '2026-10-25', 1560000.00, 'Tarjeta'),
(29, '2026-11-12', 1560000.00, 'Transferencia');