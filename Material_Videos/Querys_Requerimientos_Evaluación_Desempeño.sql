	DROP TABLE IF EXISTS Reunion;
	DROP TABLE IF EXISTS Retroalimentacion;
	DROP TABLE IF EXISTS Reporte;
	DROP TABLE IF EXISTS Respuesta_Cuestionario;
	DROP TABLE IF EXISTS Cuestionario_Empleado;
	DROP TABLE IF EXISTS Pregunta_Cuestionario;
	DROP TABLE IF EXISTS Cuestionario;
	DROP TABLE IF EXISTS Tipo_Respuesta;
	DROP TABLE IF EXISTS Tipo_Cuestionario;
	
	DROP TABLE IF EXISTS Empleado;
	DROP TABLE IF EXISTS Departamento;
	DROP TABLE IF EXISTS Cargo;
	
		

	CREATE TABLE Cargo (
		ID_Cargo INTEGER PRIMARY KEY,
		Nombre VARCHAR(64) UNIQUE NOT NULL, 
		Descripcion VARCHAR(264) NOT NULL
	);

	CREATE TABLE Departamento (
		ID_Departamento INTEGER PRIMARY KEY,
		Nombre_Departamento VARCHAR(64) UNIQUE NOT NULL
	);

	CREATE TABLE Empleado ( 
		ID_Empleado INTEGER PRIMARY KEY, 
		Nombre_Empleado VARCHAR(32) NOT NULL, 
		Apellido_Empleado VARCHAR(32) NOT NULL, 
		Telefono VARCHAR(15) NOT NULL, 
		Direccion VARCHAR(64) NOT NULL, 
		Correo VARCHAR(32) UNIQUE NOT NULL, 
		Fecha_Nacimiento DATE NOT NULL, 
		Cant_Hijos INTEGER DEFAULT 0 NOT NULL, 
		Estado_Civil VARCHAR(16) NOT NULL, 
		DNI CHAR(8) NOT NULL, 
		Fecha_Ingreso DATE NOT NULL, 
		ID_Departamento INTEGER NOT NULL, 
		ID_Cargo INTEGER NOT NULL,
		FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento), 
		FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
	);
	
	CREATE TABLE Tipo_Cuestionario(
		ID_Tipo_Cuestionario INTEGER NOT NULL primary key,
		Tipo Varchar(12) NOT NULL		
	);
	
	CREATE TABLE Tipo_Respuesta(
		ID_Tipo_Respuesta INTEGER NOT NULL primary key,
		Tipo Varchar(12) NOT NULL		
	);
	
	CREATE TABLE Cuestionario(
		ID_Cuestionario INTEGER primary key,
		ID_Especialista_Relaciones_Laborales INTEGER NOT NULL,
		ID_Tipo_Cuestionario INTEGER NOT NULL UNIQUE,
		Fecha_Creacion DATE NOT NULL,
		Hora_Creacion TIME NOT NULL,
		Estado_Envio VARCHAR (12) NOT NULL, ---------------------
		Fecha_Envio_Gerencia DATE,
		Hora_Envio_Gerencia TIME,
		ID_Gerente INTEGER NOT NULL,
		Estado_Aprobacion VARCHAR (256),
		Fecha_Revision DATE,
		Hora_Revision TIME,
		FOREIGN KEY(ID_Tipo_Cuestionario) REFERENCES Tipo_Cuestionario(ID_Tipo_Cuestionario),
		FOREIGN KEY(ID_Especialista_Relaciones_Laborales) REFERENCES Empleado(ID_Empleado),
		FOREIGN KEY(ID_Gerente) REFERENCES Empleado(ID_Empleado)																  
	);
	
	CREATE TABLE Pregunta_Cuestionario(
		ID_Pregunta INTEGER primary key,
		ID_Cuestionario INTEGER NOT NULL,
		Enunciado_Pregunta VARCHAR(256) NOT NULL UNIQUE,
		FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario)
	);
	
	CREATE TABLE Cuestionario_Empleado(
		ID_Cuestionario_Empleado INTEGER primary key,
		ID_Empleado INTEGER NOT NULL UNIQUE,
		ID_Cuestionario INTEGER NOT NULL,
		Fecha_Rellenado DATE NOT NULL,
		Hora_Rellenado TIME NOT NULL,
		FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
		FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario)
	);
	
	CREATE TABLE Respuesta_Cuestionario(
		ID_Respuesta Integer primary key,
		ID_Pregunta INTEGER NOT NULL,
		ID_Cuestionario_Empleado INTEGER NOT NULL,
		Id_Tipo_Respuesta INTEGER NOT NULL,
		FOREIGN KEY(ID_Pregunta) REFERENCES Pregunta_Cuestionario(ID_Pregunta),
		FOREIGN KEY(ID_Cuestionario_Empleado) REFERENCES Cuestionario_Empleado(ID_Cuestionario_Empleado),
		FOREIGN KEY(ID_Tipo_Respuesta) REFERENCES Tipo_Respuesta(ID_Tipo_Respuesta)
	);
	
	CREATE TABLE Reporte(
		ID_Reporte INTEGER primary key,
		ID_Cuestionario_Empleado INTEGER NOT NULL UNIQUE,
		Fecha_Ingreso_Empleado DATE NOT NULL,
		Calificacion_Empleado INTEGER NOT NULL,
		FOREIGN KEY (ID_Cuestionario_Empleado) REFERENCES Cuestionario_Empleado(ID_Cuestionario_Empleado),
		FOREIGN KEY(Calificacion_Empleado) REFERENCES Tipo_Respuesta(ID_Tipo_Respuesta)
	);
	
	CREATE TABLE Retroalimentacion(
		ID_Retroalimentacion INTEGER primary key,
		ID_Reporte INTEGER NOT NULL,
		Enunciado_Retroalimentacion VARCHAR(256) NOT NULL,
		ID_Evaluador INTEGER NOT NULL,
		Fecha_Retroalimentacion DATE NOT NULL,
		Hora_Retroalimentacion TIME NOT NULL,
		FOREIGN KEY(ID_Reporte) REFERENCES Reporte(ID_Reporte),
		FOREIGN KEY(ID_Evaluador) REFERENCES Empleado(Id_Empleado)
	);
	
	CREATE TABLE Reunion(
		ID_Reunion INTEGER primary key,
		ID_Empleado INTEGER NOT NULL,
		Asunto_Reunion VARCHAR(256) NOT NULL,
		Fecha_Reunion DATE NOT NULL,
		Hora_Reunion TIME NOT NULL,
		FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) 		
	);
	
	-----------------------------------------------------------------------------------
	INSERT INTO Departamento VALUES (1, 'Producción de Fruta Fresca'), (2, 'Recepción y Almacenamiento de Fruta'), (3, 'Control de Calidad'), (4, 'Producción de Mermelada'), (5, 'Producción de Fruta Confitada'), (6, 'Investigación y Desarrollo'), (7, 'Logística y Distribución'), (8, 'Marketing y Ventas'), (9, 'Finanzas y Contabilidad'), (10, 'Recursos Humanos'), (11, 'Mantenimiento y Reparación de Equipos'), (12, 'Seguridad e Higiene'), (13, 'Gestión Ambiental y Sostenibilidad'),(14,'Directorio');
INSERT INTO Cargo (ID_Cargo, Nombre, Descripcion) VALUES (1, 'Gerente', 'Encargado de la dirección de alguna área.'), (2, 'Jefe', 'Persona que tiene autoridad sobre un grupo de trabajadores'), (3, 'Especialista', 'Persona con conocimientos específicos en un área determinada.'), (4, 'Supervisor', 'Encargado de supervisar y coordinar las actividades de un grupo de trabajadores.'), (5, 'Técnico', 'Persona con conocimientos técnicos especializados en una determinada área.'), (6, 'Profesional', 'Persona con formación académica y experiencia en un campo específico.'), (7, 'Asistente', 'Persona que brinda apoyo administrativo o técnico en una organización.'), (8, 'Operario', 'Persona encargada de realizar tareas operativas o de producción en una empresa.'); 
INSERT INTO Empleado (ID_Empleado, Nombre_Empleado, Apellido_Empleado, Telefono, Direccion, Correo, Fecha_Nacimiento, Cant_Hijos, Estado_Civil, DNI, Fecha_Ingreso, ID_Departamento, ID_Cargo) VALUES
	(20200001, 'Juan', 'Pérez', '912345688', 'Av. Arequipa 123, Lima', 'juan.perez@gmail.com', '1975-05-10', 2, 'Casado', '11223344', '2020-01-01', 14, 1),
	(20210001, 'Juan', 'López', '912345678', 'Calle Los Pinos 123, Lima', 'juan.lopez@gmail.com', '1990-01-15', 2, 'Casado', '12345678', '2021-01-01', 1, 7),
	(20210002, 'María', 'García', '912345679', 'Avenida El Sol 456, Arequipa', 'maria.garcia@gmail.com', '1985-05-20', 1, 'Soltero', '23456789', '2021-01-02', 2, 2),
	(20210003, 'Pedro', 'Rodríguez', '912345680', 'Jirón Junín 789, Cusco', 'pedro.rodriguez@gmail.com', '1988-11-10', 0, 'Soltero', '34567890', '2021-01-03', 1, 3),
	(20210004, 'Ana', 'Martínez', '912345681', 'Calle Las Flores 012, Trujillo', 'ana.martinez@gmail.com', '1992-07-03', 3, 'Casado', '45678901', '2021-01-04', 3, 2),
	(20210005, 'Luis', 'Hernández', '912345682', 'Avenida Los Alamos 345, Chiclayo', 'luis.hernandez@gmail.com', '1995-04-18', 0, 'Soltero', '56789012', '2021-01-05', 2, 5),
	(20210006, 'Laura', 'González', '912345683', 'Calle Los Pájaros 678, Piura', 'laura.gonzalez@gmail.com', '1991-09-25', 2, 'Casado', '67890123', '2021-01-06', 3, 3),
	(20210007, 'Carlos', 'Ramírez', '912345684', 'Jirón Los Laureles 901, Huancayo', 'carlos.ramirez@gmail.com', '1987-03-12', 1, 'Soltero', '78901234', '2021-01-07', 7, 2),
	(20210008, 'Diana', 'Vargas', '912345685', 'Avenida Los Cerezos 234, Iquitos', 'diana.vargas@gmail.com', '1993-06-28', 0, 'Soltero', '89012345', '2021-01-08', 8, 3),
	(20210009, 'Roberto', 'Paredes', '912345686', 'Calle Las Palmeras 567, Tacna', 'roberto.paredes@gmail.com', '1989-12-07', 2, 'Casado', '90123456', '2021-01-09', 9, 4),
	(20210010, 'Sandra', 'Torres', '912345687', 'Avenida Los Pinos 890, Puno', 'sandra.torres@gmail.com', '1994-02-14', 1, 'Soltero', '01234567', '2021-01-10', 10, 2),
	(20210011, 'Raúl', 'Rojas', '912345706', 'Calle Las Magnolias 123, Lima', 'raul.rojas@gmail.com', '1985-02-14', 1, 'Soltero', '44556699', '2020-01-11', 8, 5),
	(20210012, 'Pablo', 'Mendoza', '912345707', 'Calle Las Orquídeas 456, Lima', 'pablo.mendoza@gmail.com', '1987-03-21', 0, 'Casado', '55667700', '2020-01-12', 9, 6),
	(20210013, 'Carla', 'Cruz', '912345708', 'Calle Las Gardenias 789, Lima', 'carla.cruz@gmail.com', '1992-11-18', 2, 'Soltero', '66778811', '2020-01-13', 9, 7),
	(20210014, 'Patricia', 'Salazar', '912345709', 'Calle Las Violetas 012, Lima', 'patricia.salazar@gmail.com', '1994-04-12', 3, 'Casado', '77889922', '2020-01-14', 10, 8),
	(20210015, 'Andrea', 'Castro', '912345710', 'Calle Las Dalias 345, Lima', 'andrea.castro@gmail.com', '1991-09-30', 1, 'Soltero', '88990033', '2020-01-15', 10, 2),
	(20220001, 'David', 'Sánchez', '912345696', 'Av. San Felipe 456, Lima', 'david.sanchez2@gmail.com', '1993-04-20', 0, 'Soltero', '44556688', '2020-01-01', 2, 6),
	(20220002, 'Sara', 'Martín', '912345697', 'Av. Benavides 789, Lima', 'sara.martin2@gmail.com', '1988-06-15', 2, 'Casado', '55667799', '2020-01-02', 3, 7),
	(20220003, 'Javier', 'Ruiz', '912345698', 'Av. La Molina 234, Lima', 'javier.ruiz@gmail.com', '1986-02-28', 0, 'Soltero', '66778800', '2020-01-03', 4, 8),
	(20220004, 'Paula', 'Gutiérrez', '912345699', 'Av. Huaylas 567, Lima', 'paula.gutierrez@gmail.com', '1991-10-10', 3, 'Casado', '77889911', '2020-01-04', 5, 3),
	(20220005, 'Daniel', 'López', '912345700', 'Av. Primavera 123, Lima', 'daniel.lopez@gmail.com', '1984-07-03', 0, 'Soltero', '88990022', '2020-01-05', 5, 4),
	(20220006, 'Lucía', 'Hernández', '912345701', 'Av. Javier Prado Oeste 456, Lima', 'lucia.hernandez@gmail.com', '1989-12-25', 1, 'Casado', '99001133', '2020-01-06', 6, 5),
	(20220007, 'Alejandro', 'Pérez', '912345702', 'Av. Universitaria 789, Lima', 'alejandro.perez2@gmail.com', '1981-04-15', 0, 'Soltero', '00112244', '2020-01-07', 6, 6),
	(20220008, 'Marta', 'Flores', '912345703', 'Av. Petit Thouars 123, Lima', 'marta.flores@gmail.com', '1992-11-18', 2, 'Casado', '11223366', '2020-01-08', 7, 7),
	(20220009, 'Luis', 'Ramírez', '912345704', 'Av. Wilson 456, Lima', 'luis.ramirez@gmail.com', '1983-05-23', 1, 'Soltero', '22334477', '2020-01-09', 7, 8),
	(20220010, 'Carmen', 'González', '912345705', 'Av. 28 de Julio 789, Lima', 'carmen.gonzalez@gmail.com', '1990-09-30', 3, 'Casado', '33445588', '2020-01-10', 8, 3),(20230002, 'Ana', 'García', '912345689', 'Av. Javier Prado Este 456, Lima', 'ana.garcia@gmail.com', '1980-08-20', 1, 'Soltero', '22334455', '2020-01-02', 1, 2),
	(20230005, 'Pedro', 'Rodríguez', '912345692', 'Av. Salaverry 234, Lima', 'pedro.rodriguez2@gmail.com', '1985-07-30', 1, 'Soltero', '33445566', '2020-01-05', 4, 2),
	(20230006, 'Laura', 'Fernández', '912345693', 'Av. La Marina 567, Lima', 'laura.fernandez@gmail.com', '1990-01-05', 2, 'Casado', '44556677', '2020-01-06', 1, 3),
	(20230007, 'Miguel', 'Gómez', '912345694', 'Av. Universitaria 890, Lima', 'miguel.gomez@gmail.com', '1987-12-12', 0, 'Soltero', '55667788', '2020-01-07', 1, 4),
	(20230008, 'Elena', 'Díaz', '912345695', 'Av. Colonial 123, Lima', 'elena.diaz@gmail.com', '1983-09-18', 1, 'Casado', '66778899', '2020-01-08', 2, 5),
	(20230009, 'David', 'Sánchez', '912345719', 'Av. Los Girasoles 456, Lima', 'david.sanchez@gmail.com', '1993-04-20', 0, 'Soltero', '77889900', '2020-01-09', 2, 6),
	(20230010, 'Sara', 'Martín', '912345720', 'Av. Los Girasoles 456, Lima', 'sara.martin@gmail.com', '1988-06-15', 2, 'Casado', '88990011', '2020-01-10', 3, 7),
	(20230011, 'Javier', 'Ruiz', '912345721', 'Av. Los Girasoles 456, Lima', 'javier.ruiz2@gmail.com', '1986-02-28', 0, 'Soltero', '99001122', '2020-01-11', 4, 8),
	(20230012, 'Paula', 'Gutiérrez', '912345722', 'Av. Los Girasoles 456, Lima', 'paula.gutierrez2@gmail.com', '1991-10-10', 3, 'Casado', '00112233', '2020-01-12', 5, 3),
	(20230013, 'Daniel', 'López', '912345723', 'Av. Los Girasoles 456, Lima', 'daniel.lopez2@gmail.com', '1984-07-03', 0, 'Soltero', '11223355', '2020-01-13', 5, 4),
	(20230014, 'Lucía', 'Hernández', '912345724', 'Av. Los Girasoles 456, Lima', 'lucia.hernandez2@gmail.com', '1989-12-25', 1, 'Casado', '22334466', '2020-01-14', 6, 5),
	(20230015, 'Alejandro', 'Pérez', '912345725', 'Av. Los Girasoles 456, Lima', 'alejandro.perez@gmail.com', '1981-04-15', 0, 'Soltero', '33445577', '2020-01-15', 6, 6),
(20240001, 'Marcela', 'López', '912345711', 'Av. Los Pinos 123, Lima', 'marcela.lopez@gmail.com', '1993-08-15', 1, 'Soltero', '76543210', '2024-01-01', 1, 2),
	(20240002, 'José', 'Martínez', '912345712', 'Calle Las Rosas 456, Lima', 'jose.martinez@gmail.com', '1990-05-20', 2, 'Casado', '67890123', '2024-01-02', 2, 3),
	(20240003, 'Verónica', 'González', '912345713', 'Av. Las Orquídeas 789, Lima', 'veronica.gonzalez@gmail.com', '1987-11-10', 0, 'Soltero', '56789012', '2024-01-03', 3, 4),
	(20240004, 'Jorge', 'Pérez', '912345714', 'Calle Los Girasoles 012, Lima', 'jorge.perez@gmail.com', '1992-07-03', 1, 'Soltero', '45678901', '2024-01-04', 4, 5),
	(20240005, 'Fernanda', 'Hernández', '912345715', 'Av. Los Jazmines 345, Lima', 'fernanda.hernandez@gmail.com', '1995-04-18', 2, 'Casado', '34567890', '2024-01-05', 5, 6), 
(20240006, 'Mateo', 'Sánchez', '922345716', 'Av. Los Girasoles 678, Lima', 'mateo.sanchez@gmail.com', '1990-05-25', 0, 'Soltero', '23456789', '2024-01-06', 11, 8),
	(20240007, 'Valeria', 'Martínez', '922345717', 'Calle Las Margaritas 901, Lima', 'valeria.martinez@gmail.com', '1988-01-05', 1, 'Casado', '34567890', '2024-01-07', 12, 8),
	(20240008, 'Pablo', 'Gómez', '922345718', 'Av. Los Tulipanes 234, Lima', 'pablo.gomez@gmail.com', '1991-06-20', 0, 'Soltero', '45678901', '2024-01-08', 13, 8),
	(20240009, 'Mariana', 'Fernández', '922345719', 'Av. Los Lirios 567, Lima', 'mariana.fernandez@gmail.com', '1986-08-10', 1, 'Casado', '56789012', '2024-01-09', 14, 6),
	(20240010, 'Gabriel', 'Hernández', '922345720', 'Av. Las Gardenias 890, Lima', 'gabriel.hernandez@gmail.com', '1993-04-20', 2, 'Casado', '67890123', '2024-01-10', 1, 7),
	(20240011, 'Lucía', 'Sánchez', '922345721', 'Calle Los Claveles 123, Lima', 'lucia.sanchez@gmail.com', '1990-01-05', 0, 'Soltero', '78901234', '2024-01-11', 2, 8),
	(20240012, 'Daniel', 'Martínez', '922345722', 'Av. Los Girasoles 456, Lima', 'daniel.martinez@gmail.com', '1987-12-12', 1, 'Casado', '89012345', '2024-01-12', 3, 3),
	(20240013, 'Carolina', 'Gómez', '922345723', 'Calle Las Violetas 789, Lima', 'carolina.gomez@gmail.com', '1983-09-18', 0, 'Soltero', '90123456', '2024-01-13', 4, 4),
	(20240014, 'David', 'Fernández', '922345724', 'Av. Los Tulipanes 012, Lima', 'david.fernandez@gmail.com', '1989-12-25', 1, 'Casado', '01234567', '2024-01-14', 5, 8),
	(20240015, 'Sofía', 'Hernández', '922345725', 'Av. Los Lirios 345, Lima', 'sofia.hernandez@gmail.com', '1981-04-15', 2, 'Casado', '12345678', '2024-01-15', 6, 3),
	(20240016, 'Andrés', 'Martínez', '922345726', 'Calle Las Gardenias 678, Lima', 'andres.martinez@gmail.com', '1994-02-14', 0, 'Soltero', '23456789', '2024-01-16', 7, 4),
	(20240017, 'Valentina', 'Gómez', '922345727', 'Av. Las Violetas 901, Lima', 'valentina.gomez@gmail.com', '1985-02-14', 1, 'Casado', '34567890', '2024-01-17', 8, 5),
	(20240018, 'Juan', 'Fernández', '922345728', 'Av. Los Tulipanes 234, Lima', 'juan.fernandez@gmail.com', '1991-09-30', 0, 'Soltero', '45678901', '2024-01-18', 9, 6),
	(20240019, 'Camila', 'Hernández', '922345729', 'Av. Los Lirios 567, Lima', 'camila.hernandez@gmail.com', '1983-05-23', 1, 'Casado', '56789012', '2024-01-19', 10, 7),
	(20240020, 'Felipe', 'Martínez', '922345730', 'Calle Las Rosas 890, Lima', 'felipe.martinez@gmail.com', '1990-09-30', 0, 'Soltero', '67890123', '2024-01-20', 11, 8),
	(20240021, 'Ricardo', 'Gómez', '912345711', 'Av. Los Lirios 123, Lima', 'ricardo.gomez@gmail.com', '1991-06-20', 0, 'Soltero', '67899120', '2024-05-07', 12, 8),
	(20240022, 'Fernanda', 'Pérez', '922345731', 'Av. Las Orquídeas 456, Lima', 'fernanda.perez@gmail.com', '1988-09-15', 1, 'Casado', '78912340', '2024-05-08', 13, 7),
	(20240023, 'Martín', 'Flores', '922345732', 'Av. Los Tulipanes 789, Lima', 'martin.flores@gmail.com', '1993-02-28', 0, 'Soltero', '89023451', '2024-05-09', 12, 3),
	(20240024, 'Gabriela', 'Martínez', '912345714', 'Av. Los Tulipanes 123, Lima', 'gabriela.martinez@gmail.com', '1988-01-05', 2, 'Soltero', '67348349', '2024-06-02', 3, 8),
	(20240025, 'Tomás', 'Gómez', '966777880', 'Av. Huaylas 890, Lima', 'tomas.gomez@gmail.com', '1986-08-10', 1, 'Casado', '87859349', '2024-03-06', 3, 6),
	(20240026, 'Diego', 'López', '922345736', 'Av. Los Tulipanes 345, Lima', 'diego.lopez@gmail.com', '1994-06-15', 0, 'Soltero', '12345678', '2024-01-25', 6, 6),
	(20240027, 'Renata', 'Hernández', '922345737', 'Calle Los Lirios 678, Lima', 'renata.hernandez@gmail.com', '1992-02-28', 1, 'Casado', '23456789', '2024-01-26', 7, 4),
	(20240028, 'Joaquín', 'Martínez', '922345738', 'Av. Las Rosas 901, Lima', 'joaquin.martinez@gmail.com', '1988-07-20', 0, 'Soltero', '34567890', '2024-01-27', 8, 5),
	(20240029, 'Maite', 'Gómez', '922345739', 'Av. Los Girasoles 234, Lima', 'maite.gomez@gmail.com', '1991-11-10', 1, 'Casado', '45678901', '2024-01-28', 9, 6),
	(20240030, 'Emilio', 'Fernández', '922345740', 'Calle Los Claveles 567, Lima', 'emilio.fernandez@gmail.com', '1985-04-05', 0, 'Soltero', '56789012', '2024-01-29', 2, 7),
	(20240031, 'Luciana', 'Sánchez', '922345741', 'Av. Las Violetas 890, Lima', 'luciana.sanchez@gmail.com', '1990-10-30', 2, 'Casado', '67890123', '2024-01-30', 2, 8),
	(20240032, 'Simón', 'Martínez', '922345742', 'Av. Las Gardenias 123, Lima', 'simon.martinez@gmail.com', '1987-03-25', 0, 'Soltero', '78901234', '2024-01-31', 2, 5),
	(20240033, 'Abril', 'Gómez', '922345743', 'Calle Los Tulipanes 456, Lima', 'abril.gomez@gmail.com', '1993-09-20', 1, 'Casado', '89012345', '2024-02-01', 3, 2),
	(20240034, 'Felipe', 'Fernández', '922345744', 'Av. Los Lirios 789, Lima', 'felipe.fernandez@gmail.com', '1986-05-15', 0, 'Soltero', '90123456', '2024-02-02', 4, 6),
	(20240035, 'Sara', 'Sánchez', '922345745', 'Av. Los Girasoles 012, Lima', 'sara.sanchez@gmail.com', '1991-12-10', 2, 'Casado', '01234567', '2024-02-03', 1, 8),
	(20240036, 'Juan', 'Martínez', '922345746', 'Calle Los Claveles 345, Lima', 'juan.martinez@gmail.com', '1985-08-05', 0, 'Soltero', '12345678', '2024-02-04', 2, 5),
	(20240037, 'Camila', 'Gómez', '922345747', 'Av. Las Violetas 678, Lima', 'camila.gomez@gmail.com', '1990-02-28', 1, 'Casado', '23456789', '2024-02-05', 3, 5),
	(20240038, 'Lucas', 'Fernández', '922345748', 'Av. Las Gardenias 901, Lima', 'lucas.fernandez@gmail.com', '1987-07-20', 0, 'Soltero', '34567890', '2024-02-06', 4, 3),
	(20240039, 'Valentina', 'Sánchez', '922345749', 'Calle Los Tulipanes 234, Lima', 'valentina.sanchez@gmail.com', '1991-11-10', 1, 'Casado', '45678901', '2024-02-07', 5, 6),
	(20240040, 'Mateo', 'Martínez', '922345750', 'Av. Los Lirios 567, Lima', 'mateo.martinez@gmail.com', '1985-04-05', 0, 'Soltero', '56789012', '2024-02-08', 6, 7);

	
	INSERT INTO Tipo_Cuestionario(ID_Tipo_Cuestionario,Tipo) values
	(1,'Subordinados'),
	(2,'Supervisores'),
	(3,'Jefes'),
	(4,'Gerentes');
		
	INSERT INTO Tipo_Respuesta(ID_Tipo_Respuesta,Tipo) values
	(1,'Muy Negativo'),
	(2,'Negativo'),
	(3,'Positivo'),
	(4,'Muy Positivo');	

	---------------------------------------------SELECTS--------------------------------------
	SELECT * FROM Empleado;
	SELECT * FROM Departamento;
	SELECT * FROM Cargo;
	
	SELECT * FROM  Tipo_Cuestionario;
	SELECT * FROM  Tipo_Respuesta;
	SELECT * FROM  Cuestionario;
	SELECT * FROM  Pregunta_Cuestionario;
	SELECT * FROM  Cuestionario_Empleado;
	SELECT * FROM  Respuesta_Cuestionario;
	SELECT * FROM  Reporte;
	SELECT * FROM  Retroalimentacion;
	SELECT * FROM  Reunion;
	
	
	----------------------------------------Requerimientos-------------------------------------------
	
	--- ******************R-022 - CREAR UN CUESTIONARIO***********************
	--#### Eventos
	--1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario
	Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;
	
	--2. Botón 'Crear': Se creará un cuestionario de cierto tipo para la evaluación de desempeño.
	INSERT INTO Cuestionario(ID_Cuestionario,ID_Especialista_Relaciones_Laborales,ID_Tipo_Cuestionario,Fecha_Creacion,Hora_Creacion,Estado_Envio,Fecha_Envio_Gerencia,Hora_Envio_Gerencia,ID_Gerente,Estado_Aprobacion,Fecha_Revision,Hora_Revision) VALUES
		(CASE 
	        WHEN (SELECT MAX(ID_Cuestionario) FROM Cuestionario) IS NULL THEN 1
	        ELSE (SELECT MAX(ID_Cuestionario) FROM Cuestionario) + 1
	    END, 20210006,1,CURRENT_DATE,CURRENT_TIME(0),'No enviado',NULL,NULL,20200001,NULL,NULL,NULL);
		
	INSERT INTO Cuestionario(ID_Cuestionario,ID_Especialista_Relaciones_Laborales,ID_Tipo_Cuestionario,Fecha_Creacion,Hora_Creacion,Estado_Envio,Fecha_Envio_Gerencia,Hora_Envio_Gerencia,ID_Gerente,Estado_Aprobacion,Fecha_Revision,Hora_Revision) VALUES
		(CASE 
	        WHEN (SELECT MAX(ID_Cuestionario) FROM Cuestionario) IS NULL THEN 1
	        ELSE (SELECT MAX(ID_Cuestionario) FROM Cuestionario) + 1
	    END, 20210008,2,CURRENT_DATE,CURRENT_TIME(0),'No enviado',NULL,NULL,20200001,NULL,NULL,NULL);
		
	INSERT INTO Cuestionario(ID_Cuestionario,ID_Especialista_Relaciones_Laborales,ID_Tipo_Cuestionario,Fecha_Creacion,Hora_Creacion,Estado_Envio,Fecha_Envio_Gerencia,Hora_Envio_Gerencia,ID_Gerente,Estado_Aprobacion,Fecha_Revision,Hora_Revision) VALUES
		(CASE 
	        WHEN (SELECT MAX(ID_Cuestionario) FROM Cuestionario) IS NULL THEN 1
	        ELSE (SELECT MAX(ID_Cuestionario) FROM Cuestionario) + 1
	    END, 20220004,3,CURRENT_DATE,CURRENT_TIME(0),'No enviado',NULL,NULL,20200001,NULL,NULL,NULL);
		
	INSERT INTO Cuestionario(ID_Cuestionario,ID_Especialista_Relaciones_Laborales,ID_Tipo_Cuestionario,Fecha_Creacion,Hora_Creacion,Estado_Envio,Fecha_Envio_Gerencia,Hora_Envio_Gerencia,ID_Gerente,Estado_Aprobacion,Fecha_Revision,Hora_Revision) VALUES
		(CASE 
	        WHEN (SELECT MAX(ID_Cuestionario) FROM Cuestionario) IS NULL THEN 1
	        ELSE (SELECT MAX(ID_Cuestionario) FROM Cuestionario) + 1
	    END, 20230006,4,CURRENT_DATE,CURRENT_TIME(0),'No enviado',NULL,NULL,20200001,NULL,NULL,NULL);
		
	Select * from Cuestionario;
	
	--3. Botón 'Editar': Redirecciona a la página para editar el cuestionario.
	



	--- ******************R-023 - EDITAR UN CUESTIONARIO***********************
	-- #### Eventos
	--1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	    Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

	--2. Botón 'Agregar': Agrega una pregunta al cuestionario del tipo elegido.
		
	--
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=1);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Cómo calificarías tu nivel de satisfacción en el trabajo?');
	END $$;	
	
	--		
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=1);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Cómo valoras la efectividad de la retroalimentación que recibes para mejorar tu desempeño laboral?');
	END $$;	
	--
		
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=2);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Cómo calificarías la efectividad de tu estilo de liderazgo en el rendimiento del equipo?');
	END $$;	
	--
	
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=2);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Cómo valorarías el ambiente de trabajo colaborativo y respetuoso que fomentas dentro de tu equipo?');
	END $$;	
	--
	
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=3);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Qué calificación le darías a tu visión para el equipo/departamento/empresa a corto y largo plazo?');
	END $$;	
	--
	
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=3);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Qué calificación le darías a la efectividad de tu comunicación con los miembros del equipo?');
	END $$;	
	--
	
		DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=4);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Cómo calificarías tu capacidad para asegurarte de que las actividades del equipo estén alineadas con los objetivos organizacionales?');
	END $$;	
	--
	
	DO $$
	DECLARE
		vID_Cuestionario INTEGER;
	BEGIN
		vID_Cuestionario=(Select Id_Cuestionario from Cuestionario where Id_Tipo_Cuestionario=4);
		
		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=vID_Cuestionario)=1 AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario 
			WHERE ID_Cuestionario=vID_Cuestionario) IS NULL THEN 1 
		 	ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, vID_Cuestionario,'¿Qué calificación le darías a la cultura organizacional positiva y de alto rendimiento que fomentas?');
	END $$;	
	--
	
	Select * from Pregunta_Cuestionario;

	--3. Mostrar cuestionario actual: Se mostrará preguntas del cuestionario actual de algún tipo:

	   SELECT PC.ID_Pregunta, PC.Enunciado_Pregunta 
	    FROM Pregunta_Cuestionario PC 
	    INNER JOIN Cuestionario C ON PC.ID_Cuestionario = C.ID_Cuestionario 
	    WHERE C.ID_Tipo_Cuestionario = 1;

	--4. Eliminar Pregunta: Se Eliminirá una pregunta dependiendo del tipo de cuestionario.
	
		Select * from Pregunta_Cuestionario;

		DELETE FROM Pregunta_Cuestionario
		WHERE ID_Cuestionario IN (
		SELECT Cu.ID_Cuestionario
		FROM Cuestionario Cu
		WHERE Cu.ID_Tipo_Cuestionario =4) AND ID_Pregunta = 8;

	--5. Estado de envío: Se muestra el estado de envío del cuestionario.
	
		Select Estado_Envio from Cuestionario where Id_Tipo_Cuestionario=1;

	--6. Estado de aprobación: Se muestra el estado de aprobación del cuestionario.

		Select Estado_Aprobacion from Cuestionario where Id_Tipo_Cuestionario=1;

	-- 7. Botón 'Enviar a gerencia': Se envía a Gerencia el cuestionario.
	
		Select * from Cuestionario;

		Update Cuestionario set Estado_Envio='Enviado', Fecha_Envio_Gerencia=Current_Date, Hora_Envio_Gerencia=Current_Time(0) where Id_Tipo_Cuestionario=1;
		Update Cuestionario set Estado_Envio='Enviado', Fecha_Envio_Gerencia=Current_Date, Hora_Envio_Gerencia=Current_Time(0) where Id_Tipo_Cuestionario=2;
		Update Cuestionario set Estado_Envio='Enviado', Fecha_Envio_Gerencia=Current_Date, Hora_Envio_Gerencia=Current_Time(0) where Id_Tipo_Cuestionario=3;
		Update Cuestionario set Estado_Envio='Enviado', Fecha_Envio_Gerencia=Current_Date, Hora_Envio_Gerencia=Current_Time(0) where Id_Tipo_Cuestionario=4;
		
		Select * from Cuestionario;


	--- ******************R-024- APROBAR CUESTIONARIO***********************
	-- #### Eventos
	--1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

	--2. Mostrar cuestionario actual: Se mostrará preguntas del cuestionario actual de algún tipo:

	    SELECT PC.ID_Pregunta, PC.Enunciado_Pregunta 
	    FROM Pregunta_Cuestionario PC 
	    INNER JOIN Cuestionario C ON PC.ID_Cuestionario = C.ID_Cuestionario 
	    WHERE C.ID_Tipo_Cuestionario = 1;

	--3. Mostrar estado de envío: Se muestra el estado de envío del cuestionario.

	   Select Estado_Envio from Cuestionario where Id_Tipo_Cuestionario=1;

	--4. Botón 'Enviar Estado de Aprobación': Se actualiza el estado de aprobación del cuestionario.
		Select * from Cuestionario;
		
	   Update Cuestionario set Estado_Aprobacion='Aprobado',Fecha_Revision=Current_Date,Hora_Revision=Current_Time(0) where Id_Tipo_Cuestionario=1;
	   Update Cuestionario set Estado_Aprobacion='Aprobado',Fecha_Revision=Current_Date,Hora_Revision=Current_Time(0) where Id_Tipo_Cuestionario=2;
	   Update Cuestionario set Estado_Aprobacion='Aprobado',Fecha_Revision=Current_Date,Hora_Revision=Current_Time(0) where Id_Tipo_Cuestionario=3;
	   Update Cuestionario set Estado_Aprobacion='Aprobado',Fecha_Revision=Current_Date,Hora_Revision=Current_Time(0) where Id_Tipo_Cuestionario=4;
	
		Select * from Cuestionario;
		
		
	--- ******************R-025 RESPONDER CUESTIONARIO***********************
	-- #### Eventos
	--1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

	--2. Mostrar tipos de respuesta: Selección del tipo de respuesta.

	   SELECT Id_Tipo_Respuesta,Tipo from Tipo_Respuesta;

	--3. Botón 'Enviar Respuestas': Se envían las respuesta del empleado.
	
		Select * from Cuestionario_Empleado;
		Select * from Respuesta_Cuestionario;


	   INSERT INTO Cuestionario_Empleado(ID_Cuestionario_Empleado,ID_Empleado,ID_Cuestionario,Fecha_Rellenado,Hora_Rellenado) VALUES
	    (CASE 
	            WHEN (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) + 1
	        END,20210005,1,Current_Date,Current_Time(0));

	    INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 1,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210005),3);
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 2,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210005),1);

		---
		
		INSERT INTO Cuestionario_Empleado(ID_Cuestionario_Empleado,ID_Empleado,ID_Cuestionario,Fecha_Rellenado,Hora_Rellenado) VALUES
	    (CASE 
	            WHEN (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) + 1
	        END,20210009,2,Current_Date,Current_Time(0));
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 3,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210009),4);
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 4,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210009),1);

		---
					
		INSERT INTO Cuestionario_Empleado(ID_Cuestionario_Empleado,ID_Empleado,ID_Cuestionario,Fecha_Rellenado,Hora_Rellenado) VALUES
	    (CASE 
	            WHEN (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) + 1
	        END,20210002,3,Current_Date,Current_Time(0));
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 5,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210002),3);
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 6,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20210002),4);
			
		---
					
		INSERT INTO Cuestionario_Empleado(ID_Cuestionario_Empleado,ID_Empleado,ID_Cuestionario,Fecha_Rellenado,Hora_Rellenado) VALUES
	    (CASE 
	            WHEN (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) + 1
	        END,20200001,4,Current_Date,Current_Time(0));
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 7,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20200001),2);
			
		INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, 8,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=20200001),4);
			

	--- ******************R-026 REVISAR CUESTIONARIOS***********************
	-- #### Eventos
	
	--1. Mostrar cuestionarios completados: Se muestran los cuestionarios que han sido rellenados.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado;

	--2. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

	--3. Mostrar cuestionario por apellido: Se muestran los empleados según el apellido escrito.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado WHERE
	    Em.Apellido_Empleado='Hernández';

	--4. Mostrar cuestionario por tipo: Se muestran los empleados según el tipo de cuestionario que se haya escogido.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado inner join
	    Cuestionario CU on CE.ID_Cuestionario=Cu.ID_Cuestionario where Cu.ID_Tipo_Cuestionario=1;

	--5. Mostrar cuestionario por calificación: Se muestran los empleados según el tipo de calificación que se haya escogido.

	    Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado inner join
	    Reporte Re on Re.Id_Cuestionario_Empleado=CE.Id_Cuestionario_Empleado where calificacion_empleado=1;

	--6. Botón 'Realizar Reporte': Redirecciona la página para realizar el reporte de uno de los empleados que han completado la encuesta.
	
	
	
	--- ******************R-027 REALIZAR REPORTE***********************
	-- #### Eventos
	--1. Mostrar datos del empleado: Se muestra el ID, apellido, ID_Cuestionario_Empleado y el tipo de cuestionario;

		   SELECT DISTINCT Em.id_empleado, Em.nombre_empleado, Em.apellido_empleado, Ce.ID_Cuestionario_Empleado, TC.Tipo
			FROM Empleado Em
			INNER JOIN Cuestionario_Empleado CE ON Em.id_empleado = CE.id_empleado
			INNER JOIN Cuestionario Cu ON CE.id_cuestionario = Cu.id_cuestionario
			INNER JOIN Tipo_Cuestionario TC ON Cu.id_tipo_cuestionario = TC.id_tipo_cuestionario where em.id_empleado=20210005;

	--2. Mostrar las respuestas del empleado: Se muestran las respuestas del empleado a cada pregunta.
		   SELECT 
				PC.ID_Pregunta,
				PC.Enunciado_Pregunta,
				TR.Tipo AS Respuesta
			FROM 
				Empleado Em
			INNER JOIN 
				Cuestionario_Empleado CE ON Em.id_empleado = CE.id_empleado
			INNER JOIN 
				Respuesta_Cuestionario RC ON CE.ID_Cuestionario_Empleado = RC.ID_Cuestionario_Empleado
			INNER JOIN 
				Pregunta_Cuestionario PC ON RC.ID_Pregunta = PC.ID_Pregunta
			INNER JOIN 
				Tipo_Respuesta TR ON RC.ID_Tipo_Respuesta = TR.ID_Tipo_Respuesta
			WHERE 
				Em.id_empleado = 20210005;

	--3. Mostrar tipos de calificación: Selección del tipo de calificación.

			SELECT Id_Tipo_Respuesta,Tipo from Tipo_Respuesta;

	--4. Botón 'Confirmar reporte': Confirma la calificación y la retroalimentación al cuestionario del empleado.

			INSERT INTO Reporte (ID_Reporte, ID_Cuestionario_Empleado, Fecha_Ingreso_Empleado, Calificacion_Empleado)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Reporte) FROM Reporte) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Reporte) FROM Reporte) + 1
				END,
				1,(Select Fecha_Ingreso from Empleado where ID_empleado=20210005),3);

			INSERT INTO Retroalimentacion (ID_Retroalimentacion, ID_Reporte, Enunciado_Retroalimentacion, ID_Evaluador, Fecha_Retroalimentacion, Hora_Retroalimentacion)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) + 1
				END,
				(SELECT Re.ID_Reporte
				FROM Reporte Re
				INNER JOIN Cuestionario_Empleado CE ON Re.ID_Cuestionario_Empleado = CE.ID_Cuestionario_Empleado
				WHERE CE.ID_Empleado = 20210005
				LIMIT 1),
				'Falta mejorar algunos puntos en el trabajo.', 20230012, CURRENT_DATE, CURRENT_TIME(0)
			);
		

			INSERT INTO Reporte (ID_Reporte, ID_Cuestionario_Empleado, Fecha_Ingreso_Empleado, Calificacion_Empleado)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Reporte) FROM Reporte) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Reporte) FROM Reporte) + 1
				END,
				2,(Select Fecha_Ingreso from Empleado where ID_empleado=20210009),2);

			INSERT INTO Retroalimentacion (ID_Retroalimentacion, ID_Reporte, Enunciado_Retroalimentacion, ID_Evaluador, Fecha_Retroalimentacion, Hora_Retroalimentacion)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) + 1
				END,
				(SELECT Re.ID_Reporte
				FROM Reporte Re
				INNER JOIN Cuestionario_Empleado CE ON Re.ID_Cuestionario_Empleado = CE.ID_Cuestionario_Empleado
				WHERE CE.ID_Empleado = 20210009
				LIMIT 1),
				'Debes pulir algunos detalles.', 20200001, CURRENT_DATE, CURRENT_TIME(0)
			);



			INSERT INTO Reporte (ID_Reporte, ID_Cuestionario_Empleado, Fecha_Ingreso_Empleado, Calificacion_Empleado)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Reporte) FROM Reporte) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Reporte) FROM Reporte) + 1
				END,
				3,(Select Fecha_Ingreso from Empleado where ID_empleado=20210002),2);

			INSERT INTO Retroalimentacion (ID_Retroalimentacion, ID_Reporte, Enunciado_Retroalimentacion, ID_Evaluador, Fecha_Retroalimentacion, Hora_Retroalimentacion)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) + 1
				END,
				(SELECT Re.ID_Reporte
				FROM Reporte Re
				INNER JOIN Cuestionario_Empleado CE ON Re.ID_Cuestionario_Empleado = CE.ID_Cuestionario_Empleado
				WHERE CE.ID_Empleado = 20210002
				LIMIT 1),
				'Se pueden hacer mejoras en ciertos aspectos.', 20200001, CURRENT_DATE, CURRENT_TIME(0)
			);
			
			
			INSERT INTO Reporte (ID_Reporte, ID_Cuestionario_Empleado, Fecha_Ingreso_Empleado, Calificacion_Empleado)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Reporte) FROM Reporte) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Reporte) FROM Reporte) + 1
				END,
				4,(Select Fecha_Ingreso from Empleado where ID_empleado=20200001),2);

			INSERT INTO Retroalimentacion (ID_Retroalimentacion, ID_Reporte, Enunciado_Retroalimentacion, ID_Evaluador, Fecha_Retroalimentacion, Hora_Retroalimentacion)
			VALUES (
				CASE 
					WHEN (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) IS NULL THEN 1
					ELSE (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) + 1
				END,
				(SELECT Re.ID_Reporte
				FROM Reporte Re
				INNER JOIN Cuestionario_Empleado CE ON Re.ID_Cuestionario_Empleado = CE.ID_Cuestionario_Empleado
				WHERE CE.ID_Empleado = 20200001
				LIMIT 1),
				'Algunos puntos necesitan ser perfeccionados.', 20210008, CURRENT_DATE, CURRENT_TIME(0)
			);

		
		Select * from reporte;
		Select * from retroalimentacion;
		

	--- ******************R-028 REVISAR MIS RESULTADOS***********************
	-- #### Eventos
	--1. Mostrar resultados: Se muestran los resultados del empleado.
	    SELECT 
	        Em.ID_Empleado, 
	        Re.Fecha_Ingreso_Empleado, 
	        Re.Calificacion_Empleado, 
	        Ret.Enunciado_Retroalimentacion
	    FROM 
	        Empleado Em
	    INNER JOIN 
	        Cuestionario_Empleado CE ON Em.ID_Empleado = CE.ID_Empleado
	    INNER JOIN 
	        Reporte Re ON CE.ID_Cuestionario_Empleado = Re.ID_Cuestionario_Empleado
	    INNER JOIN 
	        Retroalimentacion Ret ON Re.ID_Reporte = Ret.ID_Reporte
	    WHERE 
	        Em.ID_Empleado = 20210005; 
	
		
	--- ******************R-029 PROGRAMAR REUNIÓN***********************
	-- #### Eventos
	--1. Botón 'Programar': Se programa una reunión.
   
	    INSERT INTO Reunion (ID_Reunion, ID_Empleado, Asunto_Reunion, Fecha_Reunion, Hora_Reunion) 
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Reunion) FROM Reunion) IS NULL THEN 1 
	            ELSE (SELECT MAX(ID_Reunion) FROM Reunion) + 1 
	        END,20200001, 'Explicación de la evaluación de desempeño', '2024-06-12','15:30');
			
		INSERT INTO Reunion (ID_Reunion, ID_Empleado, Asunto_Reunion, Fecha_Reunion, Hora_Reunion) 
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Reunion) FROM Reunion) IS NULL THEN 1 
	            ELSE (SELECT MAX(ID_Reunion) FROM Reunion) + 1 
	        END,20210003, 'Explicación de la evaluación de desempeño', '2024-06-12','15:30');
		
		INSERT INTO Reunion (ID_Reunion, ID_Empleado, Asunto_Reunion, Fecha_Reunion, Hora_Reunion) 
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Reunion) FROM Reunion) IS NULL THEN 1 
	            ELSE (SELECT MAX(ID_Reunion) FROM Reunion) + 1 
	        END,20230006, 'Explicación de la evaluación de desempeño', '2024-06-12','15:30');
			
		
		Select * from Reunion;
			

	--- ******************R-030 PROGRAMAR REUNIÓN***********************
	--#### Eventos
	--1. Mostrar reuniones: Se muestra las reuniones pendientes:	   
		SELECT Asunto_Reunion, Fecha_Reunion, Hora_Reunion
		    FROM Reunion;


	
	
	
	