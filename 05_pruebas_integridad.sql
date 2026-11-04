-- ============================================
-- PRUEBAS POSITIVAS
-- ============================================

-- Prueba positiva 1: cliente valido
INSERT INTO cliente (
    nombre,
    correo,
    telefono,
    nacionalidad
)
VALUES (
    'Ana Torres',
    'ana.torres@example.com',
    '3001234567',
    'Colombia'
);


-- Prueba positiva 2: habitacion valida
INSERT INTO habitacion (
    numero,
    tipo,
    precio_noche,
    estado
)
VALUES (
    '101',
    'Sencilla',
    180000.00,
    'Disponible'
);


-- Prueba positiva 3: reserva valida
INSERT INTO reserva (
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida
)
VALUES (
    (
        SELECT id_cliente
        FROM cliente
        WHERE correo = 'ana.torres@example.com'
        ORDER BY id_cliente DESC
        LIMIT 1
    ),
    (
        SELECT id_habitacion
        FROM habitacion
        WHERE numero = '101'
    ),
    '2026-11-10',
    '2026-11-13'
);


-- ============================================
-- PRUEBAS NEGATIVAS
-- Ejecutar cada una por separado
-- ============================================

-- Prueba negativa 1:
-- Violacion de UNIQUE en numero de habitacion
INSERT INTO habitacion (
    numero,
    tipo,
    precio_noche,
    estado
)
VALUES (
    '101',
    'Doble',
    250000.00,
    'Disponible'
);


-- Prueba negativa 2:

-- Violacion del CHECK de fechas
INSERT INTO reserva (
    id_cliente,
    id_habitacion,
    fecha_entrada,
    fecha_salida
)
VALUES (
    (
        SELECT id_cliente
        FROM cliente
        WHERE correo = 'ana.torres@example.com'
        ORDER BY id_cliente DESC
        LIMIT 1
    ),
    (
        SELECT id_habitacion
        FROM habitacion
        WHERE numero = '101'
    ),
    '2026-11-20',
    '2026-11-18'
);


-- Prueba negativa 3:

-- Violacion del CHECK monto > 0
INSERT INTO pago (
    id_reserva,
    fecha_pago,
    monto,
    metodo
)
VALUES (
    (
        SELECT id_reserva
        FROM reserva
        ORDER BY id_reserva DESC
        LIMIT 1
    ),
    '2026-11-10',
    0,
    'Tarjeta'
);