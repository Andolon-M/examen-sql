INSERT INTO `tipo_medico` (`nombre`) VALUES 
('Médico Titular'),
('Médico Interino'),
('Médico Sustituto');

INSERT INTO `medico` (`nombre`, `direccion`, `telefono`, `poblacion`, `provincia`, `codigo_postal`, `nif`, `numero_seguridad_social`, `numero_colegiado`, `tipo_medico_id_fk`) VALUES 
('Dr. Juan Pérez', 'Calle Falsa 123', '555-1234', 'Madrid', 'Madrid', '28001', '12345678A', 'SS12345678', 'C12345678', 1),
('Dra. María López', 'Avenida Siempre Viva 456', '555-5678', 'Barcelona', 'Barcelona', '08001', '23456789B', 'SS23456789', 'C23456789', 2),
('Dr. Carlos García', 'Paseo del Prado 789', '555-9101', 'Sevilla', 'Sevilla', '41001', '34567890C', 'SS34567890', 'C34567890', 3),
('Dra. Ana Fernández', 'Calle Gran Vía 101', '555-1122', 'Valencia', 'Valencia', '46001', '45678901D', 'SS45678901', 'C45678901', 1),
('Dr. Pedro Martínez', 'Plaza Mayor 202', '555-3344', 'Zaragoza', 'Zaragoza', '50001', '56789012E', 'SS56789012', 'C56789012', 2),
('Dra. Lucía Gómez', 'Calle de Alcalá 303', '555-5566', 'Bilbao', 'Vizcaya', '48001', '67890123F', 'SS67890123', 'C67890123', 3),
('Dr. Javier Rodríguez', 'Calle Serrano 404', '555-7788', 'Málaga', 'Málaga', '29001', '78901234G', 'SS78901234', 'C78901234', 1),
('Dra. Laura Sánchez', 'Calle Bailén 505', '555-9900', 'Murcia', 'Murcia', '30001', '89012345H', 'SS89012345', 'C89012345', 2),
('Dr. David Ruiz', 'Calle Mayor 606', '555-1123', 'Palma', 'Baleares', '07001', '90123456I', 'SS90123456', 'C90123456', 3),
('Dra. Elena Ramírez', 'Avenida Libertad 707', '555-4455', 'Valladolid', 'Valladolid', '47001', '01234567J', 'SS01234567', 'C01234567', 1);

INSERT INTO `tipo_empleado` (`nombre`) VALUES 
('ATS'),
('ATS de zona'),
('Auxiliar de Enfermería'),
('Celador'),
('Administrativo');

INSERT INTO `empleado` (`nombre`, `direccion`, `telefono`, `poblacion`, `provincia`, `codigo_postal`, `nif`, `numero_seguridad_social`, `tipo_empleado_id_fk`) VALUES 
('Luis Torres', 'Calle Secundaria 123', '600-1234', 'Madrid', 'Madrid', '28002', 'A12345678', 'E12345678', 1),
('Marta Castillo', 'Avenida Central 456', '600-5678', 'Barcelona', 'Barcelona', '08002', 'B23456789', 'E23456789', 2),
('José Vega', 'Plaza de la Luz 789', '600-9101', 'Sevilla', 'Sevilla', '41002', 'C34567890', 'E34567890', 3),
('Laura Medina', 'Paseo de las Flores 101', '600-1122', 'Valencia', 'Valencia', '46002', 'D45678901', 'E45678901', 4),
('Manuel Ortiz', 'Calle del Sol 202', '600-3344', 'Zaragoza', 'Zaragoza', '50002', 'E56789012', 'E56789012', 5),
('Paula Morales', 'Avenida del Parque 303', '600-5566', 'Bilbao', 'Vizcaya', '48002', 'F67890123', 'E67890123', 1),
('Santiago Reyes', 'Calle del Río 404', '600-7788', 'Málaga', 'Málaga', '29002', 'G78901234', 'E78901234', 2),
('Carmen Alonso', 'Calle de la Playa 505', '600-9900', 'Murcia', 'Murcia', '30002', 'H89012345', 'E89012345', 3),
('Antonio Blanco', 'Calle de los Pinos 606', '600-1123', 'Palma', 'Baleares', '07002', 'I90123456', 'E90123456', 4),
('Elena Navarro', 'Avenida de la Paz 707', '600-4455', 'Valladolid', 'Valladolid', '47002', 'J01234567', 'E01234567', 5);

INSERT INTO `paciente` (`nombre`, `direccion`, `telefono`, `codigo_postal`, `nif`, `numero_seguridad_social`, `medico_id`) VALUES 
('Andrés Martínez', 'Calle Prado 1', '700-1234', '28003', 'P12345678', 'P12345678', 1),
('Beatriz Torres', 'Avenida Mar 2', '700-5678', '08003', 'Q23456789', 'P23456789', 2),
('Carlos Ramírez', 'Calle Sol 3', '700-9101', '41003', 'R34567890', 'P34567890', 3),
('Daniela Pérez', 'Paseo de la Esperanza 4', '700-1122', '46003', 'S45678901', 'P45678901', 4),
('Elena Jiménez', 'Plaza de la Cultura 5', '700-3344', '50003', 'T56789012', 'P56789012', 5),
('Fernando García', 'Calle de las Estrellas 6', '700-5566', '48003', 'U67890123', 'P67890123', 6),
('Gloria López', 'Avenida del Valle 7', '700-7788', '29003', 'V78901234', 'P78901234', 7),
('Hugo Martínez', 'Calle de la Fuente 8', '700-9900', '30003', 'W89012345', 'P89012345', 8),
('Isabel Fernández', 'Calle de las Rosas 9', '700-1123', '07003', 'X90123456', 'P90123456', 9),
('Javier González', 'Avenida del Rio 10', '700-4455', '47003', 'Y01234567', 'P01234567', 10),
('Karina Ruiz', 'Calle de los Olivos 11', '700-5678', '28004', 'Z12345678', 'P12345679', 1),
('Laura Herrera', 'Avenida del Sol 12', '700-1234', '08004', 'A23456780', 'P23456790', 2),
('Manuel Romero', 'Calle de la Luna 13', '700-9101', '41004', 'B34567891', 'P34567891', 3),
('Nuria Vázquez', 'Paseo de la Amistad 14', '700-1122', '46004', 'C45678902', 'P45678902', 4),
('Óscar Gil', 'Plaza de la Justicia 15', '700-3344', '50004', 'D56789013', 'P56789013', 5),
('Patricia Ruiz', 'Calle de las Flores 16', '700-5566', '48004', 'E67890124', 'P67890124', 6),
('Raúl López', 'Avenida del Norte 17', '700-7788', '29004', 'F78901235', 'P78901235', 7),
('Silvia Martínez', 'Calle del Centro 18', '700-9900', '30004', 'G89012346', 'P89012346', 8),
('Tomás Fernández', 'Calle del Sur 19', '700-1123', '07004', 'H90123457', 'P90123457', 9),
('Verónica Gómez', 'Avenida del Este 20', '700-4455', '47004', 'I01234568', 'P01234568', 10);


-- Inserciones en horario_medico
INSERT INTO `horario_medico` (`medico_id`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES 
(1, 'lunes', '08:00:00', '14:00:00'),
(1, 'miércoles', '14:00:00', '20:00:00'),
(2, 'martes', '08:00:00', '14:00:00'),
(2, 'jueves', '14:00:00', '20:00:00'),
(3, 'lunes', '08:00:00', '14:00:00'),
(3, 'viernes', '14:00:00', '20:00:00'),
(4, 'miércoles', '08:00:00', '14:00:00'),
(4, 'jueves', '14:00:00', '20:00:00'),
(5, 'martes', '08:00:00', '14:00:00'),
(5, 'viernes', '14:00:00', '20:00:00'),
(6, 'lunes', '08:00:00', '14:00:00'),
(6, 'jueves', '14:00:00', '20:00:00'),
(7, 'martes', '08:00:00', '14:00:00'),
(7, 'miércoles', '14:00:00', '20:00:00'),
(8, 'viernes', '08:00:00', '14:00:00'),
(8, 'jueves', '14:00:00', '20:00:00'),
(9, 'lunes', '08:00:00', '14:00:00'),
(9, 'viernes', '14:00:00', '20:00:00'),
(10, 'miércoles', '08:00:00', '14:00:00'),
(10, 'jueves', '14:00:00', '20:00:00');

-- Inserciones en vacaciones_medico
INSERT INTO `vacaciones_medico` (`medico_id`, `fecha_inicio`, `fecha_fin`, `disfrutadas`) VALUES 
(1, '2024-07-01', '2024-07-15', 0),
(2, '2024-08-01', '2024-08-10', 1),
(3, '2024-06-15', '2024-06-30', 0),
(4, '2024-09-10', '2024-09-20', 1),
(5, '2024-12-01', '2024-12-15', 0),
(6, '2024-07-20', '2024-07-30', 1),
(7, '2024-10-01', '2024-10-15', 0),
(8, '2024-11-01', '2024-11-10', 1),
(9, '2024-04-01', '2024-04-10', 0),
(10, '2024-05-01', '2024-05-15', 1);

-- Inserciones en vacaciones_empleado
INSERT INTO `vacaciones_empleado` (`empleado_id`, `fecha_inicio`, `fecha_fin`, `disfrutadas`) VALUES 
(1, '2024-07-05', '2024-07-20', 0),
(2, '2024-08-15', '2024-08-25', 1),
(3, '2024-06-10', '2024-06-25', 0),
(4, '2024-09-15', '2024-09-25', 1),
(5, '2024-12-10', '2024-12-20', 0),
(6, '2024-07-25', '2024-08-05', 1),

(7, '2024-10-10', '2024-10-20', 0),
(8, '2024-11-15', '2024-11-25', 1),
(9, '2024-04-15', '2024-04-25', 0),
(10, '2024-05-10', '2024-05-25', 1);

-- Inserciones en sustitucion
INSERT INTO `sustitucion` (`medico_id`, `fecha_alta`, `fecha_baja`) VALUES 
(3, '2023-01-10', '2024-02-10'),
(3, '2023-03-01', '2024-03-15'),
(6, '2023-05-01', '2024-06-15'),
(9, '2023-07-01', '2024-07-15'),
(9, '2023-08-01', '2024-08-10'),
(3, '2023-09-01', '2024-09-20'),
(6, '2023-10-01', '2024-10-15'),
(9, '2024-11-01', '2024-11-10'),
(3, '2024-12-01', '2024-12-15'),
(3, '2024-01-10', null),
(3, '2024-03-01', null),
(6, '2024-05-01', null);


INSERT INTO `vacaciones_empleado` (`empleado_id`, `fecha_inicio`, `fecha_fin`, `disfrutadas`) VALUES 
(6, '2024-09-05', '2024-11-20', 1);

INSERT into supervision(medico_id, empleado_id, fecha_inicio, fecha_fin)VALUES
(1,1, '2023-01-10', '2024-02-10'),
(2,2, '2023-01-10', '2023-04-10'),
(2,3, '2023-01-10', '2024-06-27')