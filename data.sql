USE Veterinaria;
GO

-- Insertar Veterinario
INSERT INTO Veterinarios (nombre, cedula, telefono) 
VALUES ('Dr. Carlos Mendoza', 'CED-987654', '6461234567');

-- ESCENARIO 1: Un cliente con 3 mascotas
INSERT INTO Clientes (nombre, telefono, email, direccion) 
VALUES ('Ana Martínez', '6465551234', 'ana.martinez@email.com', 'Av. Reforma #123');

INSERT INTO Mascotas (nombre, especie, raza, fecha_nacimiento, id_cliente) 
VALUES 
('Max', 'Perro', 'Golden Retriever', '2021-03-15', 1),
('Luna', 'Gato', 'Siames', '2022-06-10', 1),
('Rocky', 'Perro', 'Pug', '2023-01-20', 1);

-- ESCENARIO 2: Una mascota (Max, id_mascota = 1) con 3 consultas
INSERT INTO Consultas (fecha_hora, motivo, diagnostico, tratamiento, id_mascota, id_veterinario) 
VALUES 
('2024-01-10 10:00:00', 'Vacunación anual', 'Sano', 'Aplicación de vacuna múltiple', 1, 1),
('2024-03-05 15:30:00', 'Infección en oído', 'Otitis externa', 'Limpieza y gotas óticas', 1, 1),
('2024-05-20 11:00:00', 'Revisión general', 'Leve sobrepeso', 'Ajuste de dieta', 1, 1);

-- ESCENARIO 3: Una consulta (Consulta 2) genera una receta con varios medicamentos
INSERT INTO Recetas (fecha, id_consulta) 
VALUES ('2024-03-05', 2);

INSERT INTO Medicamentos (nombre, descripcion) 
VALUES 
('Otoxil Gotas', 'Solución ótica antibiótica'),
('Meloxicam', 'Antiinflamatorio no esteroideo');

INSERT INTO DetalleReceta (id_receta, id_medicamento, dosis, indicaciones) 
VALUES 
(1, 1, '3 gotas en oído afectado', 'Aplicar cada 12 horas por 7 días'),
(1, 2, '1 tableta de 2.5mg', 'Administrar con alimento cada 24 horas por 3 días');