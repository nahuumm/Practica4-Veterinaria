USE Veterinaria;
GO

-- ESCENARIO 1: Demostrar que un cliente (Ana Martínez) tiene 3 mascotas
SELECT 
    c.nombre AS Cliente,
    c.telefono,
    m.nombre AS Mascota,
    m.especie,
    m.raza
FROM Clientes c
INNER JOIN Mascotas m ON c.id_cliente = m.id_cliente
WHERE c.id_cliente = 1;

-- ESCENARIO 2: Demostrar que una mascota (Max) tiene 3 consultas asociadas
SELECT 
    m.nombre AS Mascota,
    co.fecha_hora,
    co.motivo,
    co.diagnostico,
    v.nombre AS Veterinario
FROM Mascotas m
INNER JOIN Consultas co ON m.id_mascota = co.id_mascota
INNER JOIN Veterinarios v ON co.id_veterinario = v.id_veterinario
WHERE m.id_mascota = 1;

-- ESCENARIO 3: Demostrar una consulta que genera una receta con múltiples medicamentos
SELECT 
    co.id_consulta,
    co.fecha_hora,
    m.nombre AS Mascota,
    r.id_receta,
    med.nombre AS Medicamento,
    dr.dosis,
    dr.indicaciones
FROM Consultas co
INNER JOIN Mascotas m ON co.id_mascota = m.id_mascota
INNER JOIN Recetas r ON co.id_consulta = r.id_consulta
INNER JOIN DetalleReceta dr ON r.id_receta = dr.id_receta
INNER JOIN Medicamentos med ON dr.id_medicamento = med.id_medicamento
WHERE co.id_consulta = 2;