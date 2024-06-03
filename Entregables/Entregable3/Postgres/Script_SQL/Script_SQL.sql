CREATE TABLE Cargo (
    ID_Cargo INTEGER PRIMARY KEY,
    Nombre VARCHAR(64) UNIQUE NOT NULL,
    Descripcion VARCHAR(264)
);

CREATE TABLE Departamento (
    ID_Departamento INTEGER PRIMARY KEY,
    Nombre_Departamento VARCHAR(64) UNIQUE NOT NULL
);

CREATE TABLE Empleado ( 
    ID_Empleado INTEGER PRIMARY KEY, 
    Nombre_Empleado VARCHAR(32) NOT NULL, 
    Apellido_Empleado VARCHAR(32) NOT NULL, 
    Telefono VARCHAR(15), 
    Direccion VARCHAR(64), 
    Correo VARCHAR(32) UNIQUE, 
    Fecha_Nacimiento DATE NOT NULL, 
    Cant_Hijos INTEGER DEFAULT 0, 
    Estado_Civil VARCHAR(16), 
    DNI CHAR(8) NOT NULL, 
    Fecha_Ingreso DATE NOT NULL, 
    ID_Departamento INTEGER, 
    ID_Cargo INTEGER,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento), 
    FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo));

CREATE TABLE Cuenta_Bancaria( 
    ID_Cuenta_B INTEGER primary key, 
    Numero_Cuenta VARCHAR(32), 
    Nombre_Banco VARCHAR(32), 
    Tipo_Cuenta VARCHAR(32), 
    Moneda VARCHAR(10), 
    ID_Empleado INTEGER, 
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Modificacion( 
    ID_Modificacion INTEGER primary key, 
    Monto_Modificacion DECIMAL(10,2), 
    Tipo_Modificacion VARCHAR(32) );

CREATE TABLE Sueldo( 
    ID_Sueldo INTEGER primary key, 
    Monto_Salario_Bruto DECIMAL(10,2) );

CREATE TABLE Pago_Total( 
    ID_Pago_Total INTEGER primary key, 
    Monto_Pagar DECIMAL(10,2), 
    ID_Sueldo INTEGER, 
    ID_Modificacion INTEGER, 
    FOREIGN KEY (ID_Sueldo) REFERENCES Sueldo(ID_Sueldo), 
    FOREIGN KEY (ID_Modificacion) REFERENCES Modificacion(ID_Modificacion) );

CREATE TABLE Nomina( 
    ID_Nomina INTEGER primary key, 
    Fecha_Emision DATE, 
    Periodo_Pago VARCHAR(10), 
    ID_Empleado INTEGER, 
    ID_Pago_Total INTEGER, 
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado), 
    FOREIGN KEY (ID_Pago_Total) REFERENCES Pago_Total(ID_Pago_Total) );

CREATE TABLE Supervisor( 
    ID_Supervisor INTEGER primary key, 
    ID_Empleado INTEGER, 
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Cese( 
    ID_Cese INTEGER primary key, 
    EstadoCese VARCHAR(32), 
    FechaInicioCese DATE, 
    ID_Empleado INTEGER, 
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Cuestionario_Salida( 
    ID_Cuestionario INTEGER primary key, 
    ID_Supervisor INTEGER, 
    ID_Cese INTEGER, 
    Fecha_Cuestionario DATE, 
    FOREIGN KEY (ID_Supervisor) REFERENCES Supervisor(ID_Supervisor), 
    FOREIGN KEY (ID_Cese) REFERENCES Cese(ID_Cese)	 );

CREATE TABLE Pregunta_Salida( 
    ID_Pregunta INTEGER primary key, 
    Pregunta_Salida VARCHAR(256), 
    Respuesta_Salida VARCHAR(256), 
    ID_Cuestionario INTEGER, 
    FOREIGN KEY (ID_Cuestionario) REFERENCES Cuestionario_Salida(ID_Cuestionario) );

CREATE TABLE Beneficios_Cese( 
    ID_Beneficios INTEGER primary key, 
    Tipo VARCHAR(32), 
    Monto FLOAT, 
    ID_Cese INTEGER, 
    FOREIGN KEY (ID_Cese) REFERENCES Cese(ID_Cese) );

CREATE TABLE Programa_Capacitador(
    ID_Programa_C INTEGER primary key,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Motivo VARCHAR(256),
    ID_Departamento INTEGER, 
    FOREIGN KEY(ID_Departamento) REFERENCES Departamento(ID_Departamento));
    
CREATE TABLE Lista_Matricula(
    ID_Programa_C INTEGER,
    ID_Empleado INTEGER,
    Estado_Matricula VARCHAR(256),
    FOREIGN KEY(ID_Programa_C) REFERENCES Programa_Capacitador(ID_Programa_C), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Sesion( 
    ID_Sesion INTEGER primary key, 
    Estado VARCHAR(64), 
    Fecha DATE, 
    Hora TIME, 
    ID_Programa_C INTEGER, 
    FOREIGN KEY(ID_Programa_C) REFERENCES Programa_Capacitador(ID_Programa_C) );

CREATE TABLE Empleado_Sesion( 
    ID_Sesion INTEGER , 
    ID_Empleado INTEGER, 
    Asistencia VARCHAR(64), 
    FOREIGN KEY(ID_Sesion) REFERENCES Sesion(ID_Sesion), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Evaluacion_Capacitacion(
    ID_Evaluacion INTEGER primary key,
    Duracion_Evaluacion INTEGER,
    Hora TIME,
    ID_Instructor INTEGER,
    FOREIGN KEY(ID_Instructor) REFERENCES Empleado(ID_Empleado));

CREATE TABLE Evaluacion_Sesion( 
    ID_Evaluacion INTEGER, 
    ID_Sesion INTEGER,
    Resultado VARCHAR(64),
    FOREIGN KEY(ID_Sesion) REFERENCES Sesion(ID_Sesion),
    FOREIGN KEY(ID_Evaluacion) REFERENCES Evaluacion_Capacitacion(ID_Evaluacion));

CREATE TABLE Evaluacion_Empleado(
    ID_Evaluacion INTEGER,
    ID_Empleado INTEGER,
    Resultado VARCHAR(64),
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY(ID_Evaluacion) REFERENCES Evaluacion_Capacitacion(ID_Evaluacion));

CREATE TABLE Permiso( 
    ID_Permiso INTEGER primary key, 
    ID_Empleado INTEGER , 
    ID_Supervisor INTEGER, 
    Tipo VARCHAR(64), 
    Motivo VARCHAR(128), 
    Duracion Varchar(64), 
    Estado VARCHAR(64), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado), 
    FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor) );

CREATE TABLE Licencia( 
    ID_Licencia INTEGER primary key, 
    ID_Empleado INTEGER , ID_Supervisor INTEGER, 
    Tipo VARCHAR(64), Fecha_inicio DATE, 
    Fecha_fin DATE, Estado VARCHAR(64), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado), 
    FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor) );

CREATE TABLE Asistencia( 
    ID_Asistencia INTEGER primary key, 
    ID_Empleado INTEGER , 
    Estado VARCHAR(64), 
    Observacion VARCHAR (128), 
    Fecha DATE, 
    Hora_entrada TIME, 
    Hora_salida TIME, 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Gerente_RR_HH( 
    ID_Gerente INTEGER, 
    ID_Empleado INTEGER, 
    PRIMARY KEY(ID_Gerente), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Especialista_Relaciones_Laborales( 
    ID_Especialista INTEGER, 
    ID_Empleado INTEGER, 
    PRIMARY KEY(ID_Especialista), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado) );

CREATE TABLE Cuestionario( 
    ID_Cuestionario INTEGER, 
    Tipo_Cuestionario VARCHAR(15), 
    PRIMARY KEY(ID_Cuestionario) );

CREATE TABLE Pregunta_Cuestionario( 
    ID_Pregunta INTEGER, 
    ID_Cuestionario INTEGER,
    Enunciado_Pregunta VARCHAR(256), 
    PRIMARY KEY(ID_Pregunta), 
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario) );

CREATE TABLE Cuestionario_Empleado(
    ID_Empleado INTEGER, 
    ID_Cuestionario INTEGER, 
    ID_Pregunta INTEGER,  
    Respuesta VARCHAR(15), 
    Fecha_Rellenado DATE, 
    Hora_Rellenado TIME, 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario), 
    FOREIGN KEY(ID_Pregunta) REFERENCES Pregunta_Cuestionario(ID_Pregunta) );

CREATE TABLE Cuestionario_Especialista( 
    ID_Cuestionario INTEGER, 
    ID_Especialista INTEGER, 
    Fecha_Creacion DATE, 
    Hora_Creacion TIME, 
    Fecha_Envio_Gerencia DATE, 
    Hora_Envio_Gerencia TIME, 
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario),
    FOREIGN KEY(ID_Especialista) REFERENCES Especialista_Relaciones_Laborales(ID_Especialista));

CREATE TABLE Cuestionario_Gerente_RR_HH( 
    ID_Cuestionario INTEGER, 
    ID_Gerente INTEGER, 
    Fecha_Revision DATE, 
    Hora_Revision TIME, 
    Estado_Aprobacion VARCHAR (256), 
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario),
    FOREIGN KEY(ID_Gerente) REFERENCES Gerente_RR_HH(ID_Gerente));

CREATE TABLE Reporte( 
    ID_Reporte INTEGER, 
    ID_Empleado INTEGER, 
    ID_Cuestionario INTEGER,
    Fecha_Ingreso_Empleado DATE, 
    Calificacion_Empleado VARCHAR(15), 
    PRIMARY KEY(ID_Reporte), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario));

CREATE TABLE Retroalimentacion(
    ID_Retroalimentacion INTEGER, 
    ID_Empleado INTEGER, 
    ID_Cuestionario INTEGER, 
    ID_Reporte INTEGER, 
    ID_Gerente INTEGER, 
    ID_Especialista INTEGER, 
    Enunciado_Retroalimentacion VARCHAR(256), 
    Fecha_Retroalimentacion DATE, 
    Hora_Retroalimentacion TIME, 
    PRIMARY KEY(id_Retroalimentacion), 
    FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado), 
    FOREIGN KEY(ID_Cuestionario) REFERENCES Cuestionario(ID_Cuestionario), 
    FOREIGN KEY(ID_Reporte) REFERENCES Reporte(ID_Reporte), 
    FOREIGN KEY(ID_Gerente) REFERENCES Gerente_RR_HH(ID_Gerente), 
    FOREIGN KEY(ID_Especialista) REFERENCES Especialista_Relaciones_Laborales(ID_Especialista));

CREATE TABLE Reunion( 
    ID_Reunion INTEGER, 
    ID_Especialista INTEGER, 
    ID_Gerente INTEGER, 
    Asunto_Reunion VARCHAR(256), 
    Fecha_Reunion DATE, 
    Hora_Reunion TIME, 
    PRIMARY KEY(ID_Reunion), 
    FOREIGN KEY(ID_Especialista) REFERENCES Especialista_Relaciones_Laborales(ID_Especialista), 
    FOREIGN KEY(ID_Gerente) REFERENCES Gerente_RR_HH(ID_Gerente));

CREATE TABLE Evaluacion (
    ID_Evaluacion INT PRIMARY KEY,
    Competencias_Evaluadas VARCHAR(255) NOT NULL,
    Result_Evaluacion VARCHAR(255) NOT NULL,
    Duracion_Evaluacion INT NOT NULL,
    Estado_Evaluacion VARCHAR(50) NOT NULL
);
CREATE TABLE Certificados (
    ID_certificado INT PRIMARY KEY,
    Curso_certificado VARCHAR(255) NOT NULL,
    Nivel_certificado VARCHAR(255) NOT NULL
);

-- Tabla de Experiencia Laboral
CREATE TABLE Experiencia_Laboral (
    ID_experiencia INT PRIMARY KEY,
    Nombre_lugar VARCHAR(255) NOT NULL,
    Cargo_ejercido VARCHAR(255) NOT NULL,
    Tiempo_ejercido VARCHAR(50) NOT NULL
);

-- Tabla de Curriculum
CREATE TABLE Curriculum (
    ID_curriculum INT PRIMARY KEY,
    Grado_Educacion VARCHAR(255) NOT NULL,
    ID_experiencia INT,
    ID_certificado INT,
    FOREIGN KEY (ID_experiencia) REFERENCES Experiencia_Laboral(ID_experiencia),
    FOREIGN KEY (ID_certificado) REFERENCES Certificados(ID_certificado)
);

-- Tabla de Candidatos
CREATE TABLE Candidato (
    ID_cand INT PRIMARY KEY,
    Nombre_cand VARCHAR(255) NOT NULL,
    Apellido_cand VARCHAR(255) NOT NULL,
    Fecha_Nac_cand DATE NOT NULL,
    Direccion_cand VARCHAR(255) NOT NULL,
    Correo_cand VARCHAR(255) NOT NULL,
    Num_Telefono VARCHAR(20) NOT NULL,
    ID_curriculum INT,
    FOREIGN KEY (ID_curriculum) REFERENCES Curriculum(ID_curriculum)
);

-- Tabla de Perfil
CREATE TABLE Perfil (
    ID_Perfil INT PRIMARY KEY,
    Conocimiento_Req VARCHAR(255) NOT NULL,
    Años_Exp INT NOT NULL,
    Titulo_Requerido VARCHAR(255) NOT NULL
);

-- Tabla de Vacantes
CREATE TABLE Vacante (
    ID_Vac VARCHAR(8) PRIMARY KEY,
    ID_Departamento INT,
    ID_Cargo INT,
    ID_Perfil INT,
    Ubicacion VARCHAR(255) NOT NULL,
    Beneficio VARCHAR(255) NOT NULL,
    Salario DECIMAL(8, 2) NOT NULL,
    Horario VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
    FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
    FOREIGN KEY (ID_Perfil) REFERENCES Perfil(ID_Perfil)
);

-- Tabla de Solicitud de Empleo
CREATE TABLE Solicitud_Empleo ( 
    ID_solicitud VARCHAR(8) PRIMARY KEY, 
    ID_Vacante VARCHAR(8), 
    Est_solicitud VARCHAR(50)  NOT NULL, 
    Vacante_aplicada VARCHAR(255)  NOT NULL, 
    Horario_disponible VARCHAR(255)  NOT NULL, 
    Fecha_aplicación DATE  NOT NULL, 
    ID_cand INT, FOREIGN KEY (ID_Vacante) REFERENCES Vacante(ID_Vac), 
	FOREIGN KEY (ID_cand) REFERENCES Candidato(ID_cand) );
-- Tabla de Entrevista
CREATE TABLE Entrevista (
    ID_Entrevista INT PRIMARY KEY,
    Fecha_Eva DATE NOT NULL,
    Hora_entrevista TIME NOT NULL,
    ID_solicitud VARCHAR(8),
    ID_Evaluacion INT,
    ID_Empleado INT,
    FOREIGN KEY (ID_solicitud) REFERENCES Solicitud_Empleo(ID_solicitud),
    FOREIGN KEY (ID_Evaluacion) REFERENCES Evaluacion(ID_Evaluacion),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

INSERT INTO Departamento VALUES 
    (1, 'Producción de Fruta Fresca'), 
    (2, 'Recepción y Almacenamiento de Fruta'), 
    (3, 'Control de Calidad'), 
    (4, 'Producción de Mermelada'), 
    (5, 'Producción de Fruta Confitada'), 
    (6, 'Investigación y Desarrollo'), 
    (7, 'Logística y Distribución'), 
    (8, 'Marketing y Ventas'), 
    (9, 'Finanzas y Contabilidad'), 
    (10, 'Recursos Humanos'), 
    (11, 'Mantenimiento y Reparación de Equipos'), 
    (12, 'Seguridad e Higiene'), 
    (13, 'Gestión Ambiental y Sostenibilidad');

INSERT INTO Cargo (ID_Cargo, Nombre, Descripcion) VALUES 
    (1, 'Gerente', 'Encargado de la dirección de alguna área.'), 
    (2, 'Jefe', 'Persona que tiene autoridad sobre un grupo de trabajadores'), 
    (3, 'Especialista', 'Persona con conocimientos específicos en un área determinada.'), 
    (4, 'Supervisor', 'Encargado de supervisar y coordinar las actividades de un grupo de trabajadores.'), 
    (5, 'Técnico', 'Persona con conocimientos técnicos especializados en una determinada área.'), 
    (6, 'Profesional', 'Persona con formación académica y experiencia en un campo específico.'), 
    (7, 'Asistente', 'Persona que brinda apoyo administrativo o técnico en una organización.'), 
    (8, 'Operario', 'Persona encargada de realizar tareas operativas o de producción en una empresa.'); 

INSERT INTO Empleado (ID_Empleado, Nombre_Empleado, Apellido_Empleado, Telefono, Direccion, Correo, Fecha_Nacimiento, Cant_Hijos, Estado_Civil, DNI, Fecha_Ingreso, ID_Departamento, ID_Cargo) VALUES
    (20200001, 'Juan', 'Pérez', '912345688', 'Av. Arequipa 123, Lima', 'juan.perez@gmail.com', '1975-05-10', 2, 'Casado', '11223344', '2020-01-01', NULL, 1),
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
    (20230015, 'Alejandro', 'Pérez', '912345725', 'Av. Los Girasoles 456, Lima', 'alejandro.perez@gmail.com', '1981-04-15', 0, 'Soltero', '33445577', '2020-01-15', 6, 6);

INSERT INTO Cuenta_Bancaria (ID_Cuenta_B, Numero_Cuenta, Nombre_Banco, Tipo_Cuenta, Moneda, ID_Empleado) VALUES 
    (1001, '01234567890123456789', 'Banco de Crédito del Perú', 'Cuenta corriente', 'Soles', 20210001), 
    (1002, '12345678901234567890', 'Interbank', 'Cuenta de ahorros', 'Dólares', 20220004), 
    (1003, '23456789012345678901', 'Scotiabank', 'Cuenta corriente', 'Soles', 2022007), 
    (1004, '34567890123456789012', 'BBVA Continental', 'Cuenta de ahorros', 'Soles', 2023007), 
    (1005, '45678901234567890123', 'Banco de la Nación', 'Cuenta corriente', 'Dólares', 20230014);
    
INSERT INTO Sueldo (ID_Sueldo, Monto_Salario_Bruto) VALUES 
    (1, 4500.00), 
    (2, 4000.00), 
    (3, 3500.00), 
    (4, 3200.00), 
    (5, 2800.00), 
    (6, 4200.00), 
    (7, 2000.00), 
    (8, 1500.00);

INSERT INTO Modificacion (ID_Modificacion, Tipo_Modificacion, Monto_Modificacion) VALUES 
    (1, 'Aumento', 500.00), 
    (2, 'Bonificación', 200.00), 
    (3, 'Descuento', 100.00), 
    (4, 'Incentivo', 300.00), 
    (5, 'Comisión', 150.50);

INSERT INTO Pago_Total (ID_Pago_Total, ID_Sueldo, ID_Modificacion, Monto_Pagar) VALUES 
    (1, 4, 1, 3700.00), 
    (2, 7, 4, 2300.00), 
    (3, 5, 3, 2700.00), 
    (4, 8, 4, 1900.00), 
    (5, 2, 5, 3849.50);

INSERT INTO Nomina (ID_Nomina, Fecha_Emision, Periodo_Pago, ID_Empleado, ID_Pago_Total) VALUES 
    (2001, '2024-04-15', 'Quincenal', 20210001, 1), 
    (2002, '2024-04-30', 'Mensual', 20220004, 1), 
    (2003, '2024-03-31', 'Mensual', 20240023, 1), 
    (2004, '2024-05-15', 'Quincenal', 20200034, 1), 
    (2005, '2024-05-31', 'Mensual', 20200008, 1); 

INSERT INTO Supervisor VALUES 
    (1, 20230007), 
    (2, 20200004), 
    (3, 20200006), 
    (4, 20200005), 
    (5, 20200009), 
    (6, 20200007), 
    (7, 20200008), 
    (8, 20200010), 
    (9, 20220005), 
    (10, 20230013), 
    (11, 20200016), 
    (12, 20200019), 
    (13, 20200022), 
    (14, 20200023), 
    (15, 20210009), 
    (16, 20200025), 
    (17, 20200026), 
    (18, 20200028), 
    (19, 20200029), 
    (20, 20200030), 
    (21, 20200031), 
    (22, 20200034), 
    (23, 20200037); 

INSERT INTO Programa_Capacitador(ID_Programa_C,Fecha_Inicio,Fecha_Fin,Motivo,ID_Departamento) VALUES
    (1, '2021-01-01', '2021-02-15','Técnicas de Cultivo de Frutas Tropicales',1), 
    (2, '2021-03-15', '2021-05-01','Manejo y Almacenamiento de Productos Perecederos', 2),
    (3, '2021-08-01', '2021-11-30','Control de Calidad en la Industria Alimentaria', 3),
    (4, '2022-01-15', '2022-02-15','Elaboración de Mermeladas Artesanales', 4),
    (5, '2022-09-15', '2022-11-30','Proceso de Confitado de Frutas', 5),
    (6, '2023-03-01', '2023-05-31','Innovación y Desarrollo de Nuevos Productos', 6),
    (7, '2023-10-01', '2023-12-31','Gestión Logística y Distribución de Productos Frescos', 7),
    (8, '2024-01-14', '2024-02-28','Estrategias de Marketing para Productos Agroalimentarios', 8);

INSERT INTO Lista_Matricula VALUES 
    (1,'20230011','Matriculado'), 
    (1,'20240006','Matriculado'),
    (1,'20240024','Matriculado'),
    (1,'20240021','Matriculado'),
    (1,'20240010','Retirado');

INSERT INTO Sesion(ID_Sesion,Estado,Fecha,Hora,ID_Programa_C) VALUES 
    (1,'Completa','2021-01-01','17:30:00',1),
    (2,'Completa','2021-01-08','17:30:00',1), 
    (3,'Completa','2021-01-15','17:30:00',1),
    (4,'Completa','2021-01-22','17:30:00',1), 
    (5,'Completa','2021-01-29','17:30:00',1),
    (6,'Completa','2021-02-05','17:30:00',1), 
    (7,'Completa','2021-02-12','17:30:00',1),
    (8,'Completa','2021-03-15','20:00:00',2), 
    (9,'Completa','2021-03-29','20:00:00',2),
    (10,'Completa','2021-04-13','20:00:00',2), 
    (11,'Completa','2021-04-27','20:00:00',2),
    (12,'Completa','2021-05-11','20:00:00',2), 
    (13,'Completa','2021-08-01','08:00:00',3),
    (14,'Completa','2021-09-01','08:00:00',3), 
    (15,'Completa','2021-10-01','08:00:00',3),
    (16,'Completa','2021-11-01','08:00:00',3), 
    (17,'Completa','2022-01-15','09:00:00',4),
    (18,'Completa','2022-01-29','09:00:00',4), 
    (19,'Completa','2022-02-12','09:00:00',4),
    (20,'Completa','2022-09-15','20:00:00',5), 
    (21,'Completa','2022-11-15','20:00:00',5),
    (22,'Completa','2023-03-01','08:00:00',6), 
    (23,'Completa','2023-03-15','08:00:00',6),
    (24,'Completa','2023-04-01','08:00:00',6), 
    (25,'Completa','2023-04-15','08:00:00',6),
    (26,'Completa','2023-05-01','08:00:00',6), 
    (27,'Completa','2023-05-15','08:00:00',6),
    (28,'Completa','2023-05-31','08:00:00',6), 
    (29,'Completa','2023-10-01','08:00:00',7),
    (30,'Completa','2023-11-01','08:00:00',7), 
    (31,'Completa','2024-01-15','16:00:00',8),
    (32,'Completa','2024-01-30','16:00:00',8), 
    (33,'Completa','2024-02-15','16:00:00',8); 

INSERT INTO Empleado_Sesion VALUES 
    (1,20230011,'Asistio'),
    (1,20240006,'Falto'),
    (1,20240024,'Asistio'),
    (1,20240021,'Falto'),
    (2,20230011,'Asistio'),
    (2,20240006,'Asistio'),
    (2,20240024,'Asistio'),
    (2,20240021,'Asistio'), 
    (3,20230011,'Asistio'),
    (3,20240006,'Asistio'),
    (3,20240024,'Asistio'),
    (3,20240021,'Falto'),
    (4,20230011,'Asistio'),
    (4,20240006,'Asistio'),
    (4,20240024,'Asistio'),
    (4,20240021,'Asistio'),
    (5,20230011,'Asistio'),
    (5,20240006,'Falto'),
    (5,20240024,'Asistio'),
    (5,20240021,'Falto'),
    (6,20230011,'Asistio'),
    (6,20240006,'Asistio'),
    (6,20240024,'Asistio'),
    (6,20240021,'Asistio'), 
    (7,20230011,'Asistio'),
    (7,20240006,'Falto'),
    (7,20240024,'Asistio'),
    (7,20240021,'Asistio'); 

INSERT INTO Evaluacion_Capacitacion VALUES  
    (1,1,'19:00:00',20210003), 
    (2,1,'19:00:00',20210003),
    (3,1,'19:00:00',20210003),
    (4,1,'19:00:00',20210003),
    (5,1,'19:00:00',20210003),
    (6,1,'19:00:00',20210003),
    (7,1,'19:00:00',20210003),
    (8,1,'19:00:00',20210003),
    (9,1,'19:00:00',20210003);

INSERT INTO Evaluacion_Sesion VALUES 
    (1,1,'Satisfactorio'),
    (2,2,'Regular'),
    (3,3,'Deficiente'),
    (4,4,'Satisfactorio'),
    (5,5,'Satisfactorio'),
    (6,6,'Regular'),
    (7,7,'Satisfactorio'),
    (8,8,'Regular'),
    (9,9,'Satisfactorio');

INSERT INTO Evaluacion_Empleado VALUES 
    (1,20230011,'Satisfactorio'),(1,20240006,'Satisfactorio'), (1,20240024,'Satisfactorio'),(1,20240021,'Satisfactorio'),
    (2,20230011,'Satisfactorio'),(2,20240006,'Regular'), (2,20240024,'Regular'),(2,20240021,'Deficiente'), 
    (3,20230011,'Deficiente'),(3,20240006,'Regular'), (3,20240024,'Regular'),(3,20240021,'Deficiente'), 
    (4,20230011,'Satisfactorio'),(4,20240006,'Satisfactorio'), (4,20240024,'Regular'),(4,20240021,'Satisfactorio'), 
    (5,20230011,'Regular'),(5,20240006,'Satisfactorio'), (5,20240024,'Satisfactorio'),(5,20240021,'Satisfactorio'),
    (6,20230011,'Regular'),(6,20240006,'Regular'), (6,20240024,'Satisfactorio'),(6,20240021,'Regular'),
    (7,20230011,'Satisfactorio'),(7,20240006,'Satisfactorio'), (7,20240024,'Regular'),(7,20240021,'Satisfactorio'),
    (8,20230011,'Regular'),(8,20240006,'Regular'), (8,20240024,'Regular'),(8,20240021,'Regular'),
    (9,20230011,'Satisfactorio'),(9,20240006,'Satisfactorio'), (9,20240024,'Satisfactorio'),(9,20240021,'Satisfactorio');

INSERT INTO Cese VALUES 
    (1,'Pendiente','2022-08-15',20240024),
    (2,'Completado','2022-07-15',20210009),
    (3,'Rechazado','2022-05-15',20240018),
    (4,'Rechazado','2022-04-15',20240004),
    (5,'Rechazado','2022-03-15',20230014),
    (6,'Pendiente','2022-11-15',20220007),
    (7,'Completado','2022-11-15',20240016); 

INSERT INTO Cuestionario_Salida VALUES 
    (1,2,2,'2022-07-16'),
    (2,3,7,'2022-11-16'); 

INSERT INTO Pregunta_Salida VALUES 
    (1,'¿Que tal fue su experiencia en la empresa?', 'Buena',1),
    (2,'¿Qué mejoraría en el trato a los empleados de la empresa?', 'Me gustaría que dieran más tiempo de refrigerio',1),
    (3,'¿Cuál fue el motivo de su renuncia?', 'Me voy a ir del país',1),
    (4,'¿Por qué trató de tomar pertenencias de la empresa?', 'Necesitaba el dinero',2);

INSERT INTO Beneficios_Cese VALUES 
    (1,'CTS',5674.12,2),
    (2,'Deuda por robo',-3450.90,7);

INSERT INTO Asistencia( ID_Asistencia, Estado, Observacion, Fecha, Hora_entrada, Hora_salida , ID_Empleado) VALUES 
    (1, 'En orden', 'Ninguna', '2022-05-10', '09:30', '18:00', 20210001), 
    (2, 'En observación', 'Revisar código', '2022-05-11', '08:00', '17:30', 20210002), 
    (3, 'En orden', 'Ninguna', '2022-05-12', '10:00', '19:00', 20210003), 
    (4, 'En orden', 'Ninguna', '2022-05-13', '08:30', '17:00', 20210004), 
    (5, 'En observación', 'Optimizar algoritmo', '2022-05-14', '09:00', '18:30', 20210005), 
    (6, 'En orden', 'Ninguna', '2022-05-16', '09:00', '17:30', 20210006), 
    (7, 'En observación', 'Revisión de seguridad', '2022-05-17', '08:30', '18:00', 20210007), 
    (8, 'En orden', 'Ninguna', '2022-05-18', '10:30', '19:30', 20210008), 
    (9, 'En orden', 'Ninguna', '2022-05-19', '08:00', '17:00', 20210009), 
    (10, 'En observación', 'Optimizar consultas', '2022-05-20', '09:30', '18:30', 20210010), 
    (11, 'En observación', 'Capacitación pendiente', '2022-06-06', '10:30', '19:00', 20200001), 
    (12, 'En orden', 'Ninguna', '2022-06-07', '09:30', '18:00', 20230002), 
    (13, 'En orden', 'Ninguna', '2022-06-08', '08:00', '17:00', 20230005), 
    (14, 'En observación', 'Reunión externa', '2022-06-09', '11:00', '20:00', 20230006), 
    (15, 'En orden', 'Ninguna', '2022-06-10', '09:00', '18:00', 20230007), 
    (16, 'En orden', 'Ninguna', '2022-06-11', '09:30', '18:00', 20230008), 
    (17, 'En observación', 'Optimizar consultas SQL', '2022-06-12', '08:00', '17:30', 20230009), 
    (18, 'En orden', 'Ninguna', '2022-06-13', '10:00', '19:00', 20230010), 
    (19, 'En orden', 'Ninguna', '2022-06-14', '09:30', '18:00', 20230011), 
    (20, 'En observación', 'Revisión de seguridad', '2022-06-15', '08:00', '17:30', 20230012), 
    (21, 'En orden', 'Ninguna', '2022-06-16', '10:00', '19:00', 20230013), 
    (22, 'En orden', 'Ninguna', '2022-06-17', '09:30', '18:00', 20230014), 
    (23, 'En observación', 'Optimizar consultas SQL', '2022-06-18', '08:00', '17:30', 20230015), 
    (24, 'En orden', 'Ninguna', '2022-06-19', '10:00', '19:00', 20220001), 
    (25, 'En orden', 'Ninguna', '2022-06-20', '08:30', '17:00', 20220002), 
    (26, 'En observación', 'Reunión externa', '2022-06-21', '11:00', '20:00', 20220003), 
    (27, 'En orden', 'Ninguna', '2022-06-22', '09:00', '18:00', 20220004), 
    (28, 'En orden', 'Ninguna', '2022-06-23', '08:30', '17:00', 20220005), 
    (29, 'En observación', 'Revisión de seguridad', '2022-06-24', '10:00', '19:00', 20220006), 
    (30, 'En orden', 'Ninguna', '2022-06-25', '08:00', '17:00', 20220007), 
    (31, 'En orden', 'Ninguna', '2022-06-26', '09:30', '18:00', 20240001), 
    (32, 'En orden', 'Ninguna', '2022-06-27', '09:30', '18:00', 20240002),
    (33, 'En observación', 'Optimizar código', '2022-06-28', '08:00', '17:30', 20240003), 
    (34, 'En orden', 'Ninguna', '2022-06-29', '10:00', '19:00', 20240004), 
    (35, 'En orden', 'Ninguna', '2022-06-30', '08:30', '17:00', 20240005), 
    (36, 'En observación', 'Reunión de equipo', '2022-07-01', '11:00', '20:00', 20240006), 
    (37, 'En orden', 'Ninguna', '2022-07-02', '09:00', '18:00', 20240007), 
    (38, 'En orden', 'Ninguna', '2022-07-03', '08:30', '17:00', 20240008), 
    (39, 'En observación', 'Revisión de seguridad', '2022-07-04', '10:00', '19:00', 20240009), 
    (40, 'En orden', 'Ninguna', '2022-07-05', '08:00', '17:00', 20240010), 
    (41, 'En orden', 'Ninguna', '2022-07-06', '09:30', '18:00', 20240011), 
    (42, 'En orden', 'Ninguna', '2022-07-07', '09:30', '18:00', 20240012), 
    (43, 'En observación', 'Optimizar código', '2022-07-08', '08:00', '17:30', 20240013), 
    (44, 'En orden', 'Ninguna', '2022-07-09', '10:00', '19:00', 20240013), 
    (45, 'En orden', 'Ninguna', '2022-08-01', '09:30', '18:00', 20240014), 
    (46, 'En observación', 'Optimizar código', '2022-08-02', '08:00', '17:30', 20240015), 
    (47, 'En orden', 'Ninguna', '2022-08-03', '10:00', '19:00', 20240016), 
    (48, 'En orden', 'Ninguna', '2022-08-04', '08:30', '17:00', 20240017), 
    (49, 'En observación', 'Reunión de equipo', '2022-08-05', '11:00', '20:00', 20240018), 
    (50, 'En orden', 'Ninguna', '2022-08-06', '09:00', '18:00', 20240019), 
    (51, 'En orden', 'Ninguna', '2022-08-07', '09:30', '18:00', 20240020), 
    (52, 'En observación', 'Optimizar consultas SQL', '2022-08-08', '08:00', '17:30', 20240021), 
    (53, 'En orden', 'Ninguna', '2022-08-09', '10:00', '19:00', 20240022), 
    (54, 'En orden', 'Ninguna', '2022-08-10', '08:30', '17:00', 20240023), 
    (55, 'En observación', 'Reunión de equipo', '2022-08-11', '11:00', '20:00', 20240024),
    (56, 'En orden', 'Ninguna', '2022-08-19', '09:30', '18:00', 20240014),
    (57, 'En observación', 'Revisión de protocolos', '2022-08-21', '08:00', '17:00', 20240034), 
    (58, 'En orden', 'Ninguna', '2022-08-22', '09:45', '18:15', 20200004), 
    (59, 'En orden', 'Ninguna', '2022-08-23', '08:15', '17:45', 20200005), 
    (60, 'En observación', 'Capacitación pendiente', '2022-08-24', '10:30', '19:00', 20200006), 
    (61, 'En orden', 'Ninguna', '2022-08-25', '09:30', '18:00', 20200007), 
    (62, 'En orden', 'Ninguna', '2022-08-26', '08:00', '17:00', 20200008), 
    (63, 'En orden', 'Ninguna', '2022-08-27', '09:00', '18:00', 20200009), 
    (64, 'En observación', 'Actualización de equipo', '2022-08-28', '08:30', '17:30', 20200010), 
    (65, 'En orden', 'Ninguna', '2022-08-29', '10:00', '19:00', 20200016), 
    (66, 'En orden', 'Ninguna', '2022-08-30', '09:30', '18:30', 20200019), 
    (67, 'En observación', 'Revisión de protocolos', '2022-08-31', '08:00', '17:00', 20200022), 
    (68, 'En orden', 'Ninguna', '2022-09-01', '09:45', '18:15', 20200023), 
    (69, 'En orden', 'Ninguna', '2022-09-02', '08:15', '17:45', 20200025),
    (70, 'En observación', 'Capacitación pendiente', '2022-09-03', '10:30', '19:00', 20200026), 
    (71, 'En orden', 'Ninguna', '2022-09-04', '09:30', '18:00', 20200028), 
    (72, 'En orden', 'Ninguna', '2022-09-05', '08:00', '17:00', 20200029), 
    (73, 'En orden', 'Ninguna', '2022-09-06', '09:00', '18:00', 20200030), 
    (74, 'En observación', 'Actualización de equipo', '2022-09-07', '08:30', '17:30', 20200031), 
    (75, 'En orden', 'Ninguna', '2022-09-08', '10:00', '19:00', 20200034), 
    (76, 'En orden', 'Ninguna', '2022-09-09', '09:30', '18:30', 20200037);

INSERT INTO Licencia (ID_Licencia, Tipo, Estado, Fecha_inicio, Fecha_fin, ID_Empleado, ID_Supervisor) VALUES 
    (1, 'Sindical', 'Aceptado', '2021-03-12', '2021-04-12', 20240032, 2),
    (2, 'Por paternidad', 'Aprobado', '2020-06-15', '2020-06-29', 20210002, 4),
    (3, 'Por lactancia', 'Rechazado', '2021-07-01', '2021-07-15', 20210003, 6),
    (4, 'Por adopción', 'Aprobado', '2022-08-10', '2022-08-24', 20210004, 5),
    (5, 'Sindical', 'Rechazado', '2020-09-20', '2020-10-05', 20210005, 9),
    (6, 'Por familiares graves', 'Aprobado', '2021-11-11', '2021-11-25', 20210006, 7),
    (7, 'Comité SST', 'Rechazado', '2022-12-01', '2022-12-15', 20210007, 8),
    (8, 'Por asistencia médica a un familiar', 'Aprobado', '2020-01-16', '2020-01-30', 20210008, 1),
    (9, 'Por ser bombero voluntario', 'Rechazado', '2021-02-14', '2021-02-28', 20210009,5),
    (10, 'Por maternidad', 'Aprobado', '2022-03-10', '2022-03-24', 20210010, 3),
    (11, 'Por paternidad', 'Rechazado', '2020-04-12', '2020-04-26', 20200001, 6),
    (12, 'Por lactancia', 'Aprobado', '2021-05-09', '2021-05-23', 20230002, 9),
    (13, 'Por adopción', 'Rechazado', '2022-06-07', '2022-06-21', 20230005, 2),
    (14, 'Sindical', 'Aprobado', '2020-07-05', '2020-07-19', 20230006, 3),
    (15, 'Por familiares graves', 'Rechazado', '2021-08-03', '2021-08-17', 20230007, 9),
    (16, 'Comité SST', 'Aprobado', '2022-09-01', '2022-09-15', 20230008, 5),
    (17, 'Por asistencia médica a un familiar', 'Rechazado', '2020-10-13', '2020-10-27', 20230009, 6),
    (18, 'Por ser bombero voluntario', 'Aprobado', '2021-11-11', '2021-11-25', 20230010, 8),
    (19, 'Por maternidad', 'Rechazado', '2022-12-09', '2022-12-23', 20230011, 9),
    (20, 'Por paternidad', 'Aprobado', '2020-02-14', '2020-02-28', 20230012, 1);

INSERT INTO Permiso (ID_Permiso, Tipo, Motivo, Duracion, Estado, ID_Empleado, ID_Supervisor) VALUES
    (1, 'Mudanza', 'Me mudo por motivos familiares', '10 días', 'Aprobado', 20200023, 7),
    (2, 'Matrimonio', 'Casamiento con mi pareja de larga data', '15 días', 'Aprobado', 20210001, 4),
    (3, 'Nacimiento de un familiar', 'Nacimiento de mi sobrino', '7 días', 'Rechazado', 20210002, 6),
    (4, 'Fallecimiento de un familiar', 'Falleció mi abuelo', '5 días', 'Aprobado', 20210003, 5),
    (5, 'Accidente de un familiar', 'Mi hermano tuvo un accidente', '20 días', 'Rechazado', 20210004, 9),
    (6, 'Enfermedad grave de un familiar', 'Mi madre está gravemente enferma', '30 días', 'Aprobado', 20210005, 7),
    (7, 'Deberes inexcusables', 'Debo asistir a una cita judicial', '3 días', 'Rechazado', 20210006, 8),
    (8, 'Exámenes prenatales', 'Control prenatal de mi pareja', '1 día', 'Aprobado', 20210007, 1),
    (9, 'Funciones sindicales', 'Participación en asamblea sindical', '2 días', 'Rechazado', 20210008, 5),
    (10, 'Hijos prematuros', 'Cuidado de mi hijo prematuro', '25 días', 'Aprobado', 20210009, 3),
    (11, 'Formación', 'Curso de actualización profesional', '10 días', 'Rechazado', 20210010, 6),
    (12, 'Despido objetivo', 'Gestiones por despido', '14 días', 'Aprobado', 20200001, 9),
    (13, 'Mudanza', 'Cambio de residencia por trabajo', '12 días', 'Rechazado', 20230002, 2),
    (14, 'Matrimonio', 'Mi boda', '15 días', 'Aprobado', 20230005, 3),
    (15, 'Nacimiento de un familiar', 'Nacimiento de mi hija', '7 días', 'Rechazado', 20230006, 9),
    (16, 'Fallecimiento de un familiar', 'Falleció mi tío', '5 días', 'Aprobado', 20230007, 5),
    (17, 'Accidente de un familiar', 'Mi prima sufrió un accidente', '20 días', 'Rechazado', 20230008, 6),
    (18, 'Enfermedad grave de un familiar', 'Mi padre tiene una enfermedad grave', '30 días', 'Aprobado', 20230009, 8),
    (19, 'Deberes inexcusables', 'Obligaciones legales imprevistas', '3 días', 'Rechazado', 20230010, 9),
    (20, 'Exámenes prenatales', 'Exámenes prenatales de mi esposa', '1 día', 'Aprobado', 20230011, 1),
    (21, 'Funciones sindicales', 'Reunión sindical importante', '2 días', 'Rechazado', 20230012, 1),
    (22, 'Hijos prematuros', 'Atención a mi hijo recién nacido', '25 días', 'Aprobado', 20230013, 4),
    (23, 'Formación', 'Seminario de desarrollo personal', '10 días', 'Rechazado', 20230014, 7),
    (24, 'Despido objetivo', 'Proceso de despido laboral', '14 días', 'Aprobado', 20230015, 7),
    (25, 'Mudanza', 'Relocalización por motivos de salud', '12 días', 'Rechazado', 20220001, 4);

INSERT INTO Gerente_RR_HH (ID_Gerente,ID_Empleado) VALUES
    (00000001,20200001);

INSERT INTO Especialista_Relaciones_Laborales(ID_Especialista,ID_Empleado) VALUES 
    (1,20210003),  
    (2,20210006), 
    (3,20210008), 
    (4,20220004), 
    (5,20230006), 
    (6,20230012), 
    (7,20240027);

INSERT INTO Cuestionario(ID_Cuestionario,Tipo_Cuestionario) VALUES 
    (1,'Subordinados'), 
    (2,'Supervisores'), 
    (3,'Jefes'), 
    (4,'Gerentes');

INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES 
    (1001,1,'¿Cómo calificarías tu nivel de satisfacción en el trabajo?'), 
    (1002,1,'¿Cómo valoras la efectividad de la retroalimentación que recibes para mejorar tu desempeño laboral?'), 
    (2001,2,'¿Cómo calificarías la efectividad de tu estilo de liderazgo en el rendimiento del equipo?'), 
    (2002,2,'¿Cómo valorarías el ambiente de trabajo colaborativo y respetuoso que fomentas dentro de tu equipo?'),	 
    (3001,3,'¿Qué calificación le darías a tu visión para el equipo/departamento/empresa a corto y largo plazo?'), 
    (3002,3,'¿Qué calificación le darías a la efectividad de tu comunicación con los miembros del equipo?'), 
    (4001,4,'¿Cómo calificarías tu capacidad para asegurarte de que las actividades del equipo estén alineadas con los objetivos organizacionales?'), 
    (4002,4,'¿Qué calificación le darías a la cultura organizacional positiva y de alto rendimiento que fomentas?');

INSERT INTO Cuestionario_Empleado(ID_Empleado,ID_Cuestionario,ID_Pregunta,Respuesta,Fecha_Rellenado,Hora_Rellenado) VALUES 
    (20210005,1,1001,'Positivo','2024-06-15','15:30'), (20210005,1,1002,'Muy Negativo','2024-06-15','15:30'), 
    (20210009,2,2001,'Muy positivo','2024-06-17','18:30'), (20210009,2,2002,'Muy Negativo','2024-06-17','18:30'), 
    (20210002,3,3001,'Positivo','2024-06-14','19:30'), (20210002,3,3001,'Muy Positivo','2024-06-14','19:30'), 
    (20200001,4,4001,'Negativo','2024-06-13','12:30'), (20200001,4,4002,'Muy Positivo','2024-06-13','12:30'), 
    (20220006,1,1001,'Negativo','2024-06-15','17:30'), (20220006,1,1002,'Muy Negativo','2024-06-15','17:30'), 
    (20220005,2,2001,'Positivo','2024-06-17','11:30'), (20220005,2,2002,'Muy Negativo','2024-06-17','11:30'), 
    (20210007,3,3001,'Positivo','2024-06-14','20:30'), (20210007,3,3001,'Positivo','2024-06-14','20:30');

INSERT INTO Cuestionario_Especialista(ID_Cuestionario,ID_Especialista,Fecha_Creacion,Hora_Creacion,Fecha_Envio_Gerencia,Hora_Envio_Gerencia) VALUES 
    (1,2,'2024-04-18','18:30','2024-05-18','15:25'),   
    (2,3,'2024-04-18','17:30','2024-05-18','17:20'), 
    (3,4,'2024-04-18','16:30','2024-05-18','18:35'), 
    (4,5,'2024-04-18','19:30','2024-05-18','19:55');

INSERT INTO Cuestionario_Gerente_RR_HH(ID_Cuestionario,ID_Gerente,Fecha_Revision,Hora_Revision,Estado_Aprobacion) VALUES 
    (1,1,'2024-05-19','18:30','Aprobado'), 
    (2,1,'2024-05-19','20:30','Aprobado'), 
    (3,1,'2024-05-19','21:30','Aprobado'), 
    (4,1,'2024-05-19','22:30','Aprobado');

INSERT INTO Reporte(ID_Reporte,ID_Empleado,ID_Cuestionario,Fecha_Ingreso_Empleado,Calificacion_Empleado) VALUES 
    (1,20210005,1,'2024-01-15','Positivo'), 
    (2,20210009,2,'2023-05-12','Negativo'), 
    (3,20210002,3,'2023-08-11','Positivo'), 
    (4,20200001,4,'2023-09-16','Negativo'), 
    (5,20220006,1,'2023-05-14','Negativo'), 
    (6,20220005,2,'2023-07-13','Negativo'), 
    (7,20210007,3,'2023-12-21','Negativo');

INSERT INTO Retroalimentacion(ID_Retroalimentacion,ID_Empleado,ID_Cuestionario,ID_Reporte,ID_Gerente,ID_Especialista,Enunciado_Retroalimentacion,Fecha_Retroalimentacion,Hora_Retroalimentacion) VALUES  
    (1,20210005,1,1, NULL,6, 'Falta mejorar algunos puntos en el trabajo.','2024-06-21','18:30'), 
    (2,20210009,2,2, 1,NULL, 'Debes pulir algunos detalles.','2024-06-21','18:30'), 
    (3,20210002,3,3,1,NULL, 'Se pueden hacer mejoras en ciertos aspectos.','2024-06-21','18:30'), 
    (4,20220006,1,5, NULL,3, 'Algunos puntos necesitan ser perfeccionados.','2024-06-22','15:30'), 
    (5,20220005,2,6, NULL,5, 'Se deben abordar algunas deficiencias.','2024-06-22','19:30'), 
    (6,20210007,3,7,NULL,6, 'Es necesario afinar ciertos aspectos.','2024-06-22','20:30');

INSERT INTO Reunion(ID_Reunion,ID_Especialista,ID_Gerente,Asunto_Reunion,Fecha_Reunion,Hora_Reunion) VALUES  
    (1,1,null,'Explicación de la evaluación de desempeño','2024-06-12','15:30'), 
    (2,NULL,1,'Retroalimentación general','2024-06-20','18:30'),
    (3,5,1,'Evaluación técnica','2024-06-21','18:30');

INSERT INTO Certificados (ID_certificado, Curso_certificado, Nivel_certificado) VALUES 
    (301, 'Certificación en Gestión de Calidad ISO 9001', 'Avanzado'), 
    (302, 'Diplomado en Administración de Empresas', 'Intermedio'), 
    (303, 'Certificado en Control de Calidad Alimentaria', 'Avanzado'), 
    (304, 'Curso en Finanzas Corporativas', 'Intermedio'), 
    (305, 'Certificación en Seguridad Alimentaria HACCP', 'Avanzado'), 
    (306, 'Certificado en Desarrollo de Software', 'Avanzado'), 
    (307, 'Curso en Logística y Distribución', 'Intermedio'), 
    (308, 'Diplomado en Marketing Digital', 'Intermedio'), 
    (309, 'Certificación en Contabilidad Financiera', 'Avanzado'), 
    (310, 'Maestría en Recursos Humanos', 'Avanzado'), 
    (311, 'Curso en Mantenimiento Industrial', 'Intermedio'), 
    (312, 'Diplomado en Seguridad e Higiene Ocupacional', 'Intermedio'), 
    (313, 'Certificado en Gestión Ambiental', 'Avanzado'), 
    (314, 'Diplomado en Ingeniería Agroindustrial', 'Intermedio'), 
    (315, 'Curso en Gestión de Almacenes', 'Intermedio'), 
    (316, 'Certificación en Química Analítica', 'Avanzado'), 
    (317, 'Curso en Tecnología de Alimentos', 'Intermedio'), 
    (318, 'Diplomado en Producción de Frutas', 'Intermedio'), 
    (319, 'Certificado en Biología Molecular', 'Avanzado'), 
    (320, 'Maestría en Logística y Transporte', 'Avanzado');

INSERT INTO Experiencia_Laboral (ID_experiencia, Nombre_lugar, Cargo_ejercido, Tiempo_ejercido) VALUES 
    (201, 'Empresa A', 'Gerente de Producción', '5 años'), 
    (202, 'Empresa B', 'Jefe de Recepción', '3 años'), 
    (203, 'Empresa C', 'Especialista de Control de Calidad', '4 años'), 
    (204, 'Empresa D', 'Supervisor de Producción de Mermelada', '6 años'), 
    (205, 'Empresa E', 'Técnico de Producción de Fruta Confitada', '2 años'), 
    (206, 'Empresa F', 'Profesional de Investigación y Desarrollo', '7 años'), 
    (207, 'Empresa G', 'Asistente de Logística y Distribución', '4 años'), 
    (208, 'Empresa H', 'Operario de Marketing y Ventas', '3 años'), 
    (209, 'Empresa I', 'Gerente de Finanzas y Contabilidad', '5 años'), 
    (210, 'Empresa J', 'Jefe de Recursos Humanos', '6 años'), 
    (211, 'Empresa K', 'Especialista de Mantenimiento y Reparación de Equipos', '4 años'), 
    (212, 'Empresa L', 'Supervisor de Seguridad e Higiene', '3 años'), 
    (213, 'Empresa M', 'Técnico de Gestión Ambiental y Sostenibilidad', '5 años'), 
    (214, 'Empresa N', 'Profesional de Producción de Fruta Fresca', '6 años'), 
    (215, 'Empresa O', 'Asistente de Recepción y Almacenamiento de Fruta', '4 años'), 
    (216, 'Empresa P', 'Operario de Control de Calidad', '3 años'), 
    (217, 'Empresa Q', 'Gerente de Producción de Mermelada', '5 años'), 
    (218, 'Empresa R', 'Jefe de Producción de Fruta Confitada', '4 años'), 
    (219, 'Empresa S', 'Especialista de Investigación y Desarrollo', '6 años'), 
    (220, 'Empresa T', 'Supervisor de Logística y Distribución', '3 años');

INSERT INTO Curriculum (ID_curriculum, Grado_Educacion, ID_experiencia, ID_certificado) VALUES 
    (101, 'Licenciatura en Ingeniería Industrial', 201, 301), 
    (102, 'Maestría en Administración de Empresas', 202, 302), 
    (103, 'Técnico en Control de Calidad', 203, 303), 
    (104, 'Licenciatura en Administración de Empresas', 204, 304), 
    (105, 'Técnico en Producción de Alimentos', 205, 305), 
    (106, 'Maestría en Ciencias de la Computación', 206, 306), 
    (107, 'Licenciatura en Logística', 207, 307), 
    (108, 'Técnico en Mercadotecnia', 208, 308), 
    (109, 'Licenciatura en Contaduría Pública', 209, 309), 
    (110, 'Maestría en Recursos Humanos', 210, 310), 
    (111, 'Técnico en Mantenimiento Industrial', 211, 311), 
    (112, 'Especialidad en Seguridad Laboral', 212, 312), 
    (113, 'Maestría en Gestión Ambiental', 213, 313), 
    (114, 'Licenciatura en Ingeniería Agroindustrial', 214, 314), 
    (115, 'Técnico en Almacenamiento y Distribución', 215, 315), 
    (116, 'Licenciatura en Química', 216, 316), 
    (117, 'Maestría en Producción de Alimentos', 217, 317), 
    (118, 'Técnico en Producción de Frutas', 218, 318), 
    (119, 'Licenciatura en Biología', 219, 319), 
    (120, 'Maestría en Logística y Transporte', 220, 320);

INSERT INTO Candidato (ID_cand, Nombre_cand, Apellido_cand, Fecha_Nac_cand, Direccion_cand, Correo_cand, Num_Telefono, ID_curriculum) VALUES 
    ('101', 'Juan', 'González', '1990-05-15', 'Calle 123, Ciudad', 'juan.gonzalez@example.com', '123-456-7890', 101),
    ('102', 'María', 'López', '1985-08-20', 'Avenida XYZ, Ciudad', 'maria.lopez@example.com', '234-567-8901', 102),
    ('103', 'Pedro', 'Martínez', '1992-03-10', 'Carrera ABC, Ciudad', 'pedro.martinez@example.com', '345-678-9012', 103),
    ('104', 'Ana', 'Rodríguez', '1988-11-25', 'Calle 456, Ciudad', 'ana.rodriguez@example.com', '456-789-0123', 104),
    ('105', 'Carlos', 'Pérez', '1991-07-02', 'Avenida UVW, Ciudad', 'carlos.perez@example.com', '567-890-1234', 105),
    ('106', 'Laura', 'Sánchez', '1987-09-18', 'Carrera DEF, Ciudad', 'laura.sanchez@example.com', '678-901-2345', 106),
    ('107', 'Daniel', 'Gómez', '1993-01-05', 'Calle 789, Ciudad', 'daniel.gomez@example.com', '789-012-3456', 107),
    ('108', 'Sofía', 'Hernández', '1989-06-30', 'Avenida GHI, Ciudad', 'sofia.hernandez@example.com', '890-123-4567', 108),
    ('109', 'Javier', 'Díaz', '1994-04-12', 'Carrera JKL, Ciudad', 'javier.diaz@example.com', '901-234-5678', 109),
    ('110', 'Paula', 'Torres', '1986-12-28', 'Calle 012, Ciudad', 'paula.torres@example.com', '012-345-6789', 110),
    ('111', 'Andrés', 'Ruiz', '1990-02-14', 'Avenida MNO, Ciudad', 'andres.ruiz@example.com', '123-456-7890', 111),
    ('112', 'Carmen', 'García', '1984-10-31', 'Carrera PQR, Ciudad', 'carmen.garcia@example.com', '234-567-8901', 112),
    ('113', 'Luis', 'Vázquez', '1995-07-17', 'Calle 345, Ciudad', 'luis.vazquez@example.com', '345-678-9012', 113),
    ('114', 'Marta', 'Fernández', '1983-03-04', 'Avenida STU, Ciudad', 'marta.fernandez@example.com', '456-789-0123', 114),
    ('115', 'Diego', 'Ortega', '1988-05-22', 'Carrera VWX, Ciudad', 'diego.ortega@example.com', '567-890-1234', 115),
    ('116', 'Elena', 'Núñez', '1992-09-09', 'Calle 678, Ciudad', 'elena.nunez@example.com', '678-901-2345', 116),
    ('117', 'Roberto', 'Jiménez', '1986-12-17', 'Avenida YZA, Ciudad', 'roberto.jimenez@example.com', '789-012-3456', 117),
    ('118', 'Isabel', 'Morales', '1993-02-03', 'Carrera BCD, Ciudad', 'isabel.morales@example.com', '890-123-4567', 118),
    ('119', 'Manuel', 'Silva', '1985-08-11', 'Calle 901, Ciudad', 'manuel.silva@example.com', '901-234-5678', 119),
    ('120', 'Sara', 'Gutiérrez', '1991-04-27', 'Avenida EFG, Ciudad', 'sara.gutierrez@example.com', '012-345-6789', 120);

INSERT INTO Evaluacion (ID_Evaluacion, Competencias_Evaluadas, Result_Evaluacion, Duracion_Evaluacion, Estado_Evaluacion) VALUES  
    (1, 'Habilidades técnicas', 'Oferta de empleo extendida', 60, 'Aprobado'),
    (2, 'Habilidades interpersonales', 'Oferta de empleo extendida', 45, 'Aprobado'),
    (3, 'Conocimientos específicos', 'No cumple con requisitos mínimos', 30, 'Rechazado'),
    (4, 'Capacidad de resolución de problemas', 'Oferta de empleo extendida', 50, 'Aprobado'),
    (5, 'Comunicación efectiva', 'No cumple con perfil solicitado', 40, 'Rechazado'),
    (6, 'Adaptabilidad', 'Oferta de empleo extendida', 55, 'Aprobado'),
    (7, 'Trabajo en equipo', 'Oferta de empleo extendida', 60, 'Aprobado'),
    (8, 'Gestión del tiempo', 'No cumple con requisitos mínimos', 35, 'Rechazado'),
    (9, 'Liderazgo', 'Oferta de empleo extendida', 50, 'Aprobado'),
    (10, 'Creatividad', 'No cumple con perfil solicitado', 45, 'Rechazado'),
    (11, 'Pensamiento crítico', 'Oferta de empleo extendida', 55, 'Aprobado'),
    (12, 'Resiliencia', 'Oferta de empleo extendida', 60, 'Aprobado'),
    (13, 'Ética profesional', 'No cumple con requisitos mínimos', 40, 'Rechazado'),
    (14, 'Toma de decisiones', 'Oferta de empleo extendida', 50, 'Aprobado'),
    (15, 'Resolución de conflictos', 'No cumple con perfil solicitado', 45, 'Rechazado'),
    (16, 'Planificación y organización', 'Oferta de empleo extendida', 60, 'Aprobado'),
    (17, 'Innovación', 'Oferta de empleo extendida', 55, 'Aprobado'),
    (18, 'Capacidad analítica', 'No cumple con requisitos mínimos', 30, 'Rechazado'),
    (19, 'Empatía', 'Oferta de empleo extendida', 50, 'Aprobado'),
    (20, 'Negociación', 'No cumple con perfil solicitado', 45, 'Rechazado');

INSERT INTO Perfil (ID_Perfil, Conocimiento_Req, Años_Exp, Titulo_Requerido) VALUES  
    (1, 'Experiencia en producción', 5, 'Licenciatura en Ingeniería Industrial'), 
    (2, 'Manejo de inventarios', 3, 'Técnico en Logística'), 
    (3, 'Control de calidad', 4, 'Ingeniero en Alimentos'), 
    (4, 'Supervisión de personal', 2, 'Diplomado en Gestión de Equipos'), 
    (5, 'Procesamiento de frutas', 3, 'Técnico en Procesamiento de Alimentos'), 
    (6, 'Investigación y desarrollo', 5, 'Doctorado en Ciencias Naturales'), 
    (7, 'Manejo de inventarios', 2, 'Técnico en Logística'), 
    (8, 'Marketing digital', 3, 'Licenciatura en Marketing'), 
    (9, 'Contabilidad financiera', 4, 'Licenciatura en Contaduría Pública'), 
    (10, 'Gestión de personal', 3, 'Licenciatura en Recursos Humanos'), 
    (11, 'Mantenimiento de equipos', 5, 'Ingeniero Mecánico'), 
    (12, 'Normativas de seguridad', 4, 'Diplomado en Seguridad Industrial'), 
    (13, 'Gestión ambiental', 3, 'Ingeniero Ambiental'), 
    (14, 'Producción de frutas', 5, 'Ingeniero Agrónomo'), 
    (15, 'Recepción y almacenamiento', 2, 'Técnico en Almacenamiento'), 
    (16, 'Control de calidad', 3, 'Técnico en Control de Calidad'), 
    (17, 'Producción de mermelada', 4, 'Ingeniero en Alimentos'), 
    (18, 'Producción de frutas confitadas', 3, 'Técnico en Procesamiento de Alimentos'), 
    (19, 'Investigación y desarrollo', 5, 'Doctorado en Ciencias Naturales'), 
    (20, 'Logística y distribución', 4, 'Licenciatura en Logística');

INSERT INTO Vacante (ID_Vac, ID_Departamento, ID_Cargo, ID_Perfil, Ubicacion, Beneficio, Salario, Horario) VALUES 
    ('00200001', 1, 1, 1, 'Ciudad A', 'Seguro de vida', 2500.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200002', 2, 2, 2, 'Ciudad B', 'Bonos de productividad', 3000.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200003', 3, 3, 3, 'Ciudad C', 'Transporte subsidiado', 2000.00, 'Lunes a Viernes de 7am a 4pm'), 
    ('00200004', 4, 4, 4, 'Ciudad D', 'Comida subsidiada', 3500.00, 'Lunes a Viernes de 10am a 7pm'), 
    ('00200005', 5, 5, 5, 'Ciudad E', 'Seguro médico', 4000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200006', 6, 6, 6, 'Ciudad F', 'Gimnasio en la empresa', 3000.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200007', 7, 7, 7, 'Ciudad G', 'Días libres adicionales', 2000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200008', 8, 8, 8, 'Ciudad H', 'Teletrabajo', 4500.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200009', 9, 1, 9, 'Ciudad I', 'Bonos por resultados', 3000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200010', 10, 2, 10, 'Ciudad J', 'Oportunidades de crecimiento', 2500.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200011', 11, 3, 11, 'Ciudad K', 'Estacionamiento gratuito', 3500.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200012', 12, 4, 12, 'Ciudad L', 'Comedor en la empresa', 2000.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200013', 13, 5, 13, 'Ciudad M', 'Seguro dental', 4000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200014', 1, 6, 1, 'Ciudad N', 'Asistencia médica', 3000.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200015', 2, 7, 2, 'Ciudad O', 'Horario flexible', 2000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200016', 3, 8, 3, 'Ciudad P', 'Reembolso de educación', 3500.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200017', 4, 1, 4, 'Ciudad Q', 'Bono de cumpleaños', 2500.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200018', 5, 2, 5, 'Ciudad R', 'Descuentos en productos', 4000.00, 'Lunes a Viernes de 9am a 6pm'), 
    ('00200019', 6, 3, 6, 'Ciudad S', 'Vacaciones adicionales', 3000.00, 'Lunes a Viernes de 8am a 5pm'), 
    ('00200020', 7, 4, 7, 'Ciudad T', 'Programas de bienestar', 2000.00, 'Lunes a Viernes de 9am a 6pm');

INSERT INTO Solicitud_Empleo (ID_solicitud, ID_Vacante, Est_solicitud, Vacante_aplicada, Horario_disponible, Fecha_aplicación, ID_cand) VALUES 
    ('00240001', '00200001', 'En proceso', 'Gerente de Producción', 'Lunes a Viernes de 8am a 5pm', '2024-04-20', 101),
    ('00240002', '00200002', 'En revisión', 'Jefe de Recepción', 'Lunes a Viernes de 9am a 6pm', '2024-04-21', 102),
    ('00240003', '00200003', 'Pendiente', 'Especialista de Control de Calidad', 'Lunes a Viernes de 7am a 4pm', '2024-04-22', 103),
    ('00240004', '00200004', 'Pendiente', 'Supervisor de Producción de Mermelada', 'Lunes a Viernes de 10am a 7pm', '2024-04-23', 104),
    ('00240005', '00200005', 'Pendiente', 'Técnico de Producción de Fruta Confitada', 'Lunes a Viernes de 8am a 5pm', '2024-04-24', 105),
    ('00240006', '00200006', 'Pendiente', 'Profesional de Investigación y Desarrollo', 'Lunes a Viernes de 9am a 6pm', '2024-04-25', 106),
    ('00240007', '00200007', 'Pendiente', 'Asistente de Logística y Distribución', 'Lunes a Viernes de 8am a 5pm', '2024-04-26', 107),
    ('00240008', '00200008', 'Pendiente', 'Operario de Marketing y Ventas', 'Lunes a Viernes de 9am a 6pm', '2024-04-27', 108),
    ('00240009', '00200009', 'Pendiente', 'Gerente de Finanzas y Contabilidad', 'Lunes a Viernes de 8am a 5pm', '2024-04-28', 109),
    ('00240010', '00200010', 'Pendiente', 'Jefe de Recursos Humanos', 'Lunes a Viernes de 9am a 6pm', '2024-04-29', 110),
    ('00240011', '00200011', 'Pendiente', 'Especialista de Mantenimiento y Reparación de Equipos', 'Lunes a Viernes de 8am a 5pm', '2024-04-30', 111),
    ('00240012', '00200012', 'Pendiente', 'Supervisor de Seguridad e Higiene', 'Lunes a Viernes de 9am a 6pm', '2024-05-01', 112),
    ('00240013', '00200013', 'Pendiente', 'Técnico de Gestión Ambiental y Sostenibilidad', 'Lunes a Viernes de 8am a 5pm', '2024-05-02', 113),
    ('00240014', '00200014', 'Pendiente', 'Profesional de Producción de Fruta Fresca', 'Lunes a Viernes de 9am a 6pm', '2024-05-03', 114),
    ('00240015', '00200015', 'Pendiente', 'Asistente de Recepción y Almacenamiento de Fruta', 'Lunes a Viernes de 8am a 5pm', '2024-05-04', 115),
    ('00240016', '00200016', 'Pendiente', 'Operario de Control de Calidad', 'Lunes a Viernes de 9am a 6pm', '2024-05-05', 116),
    ('00240017', '00200017', 'Pendiente', 'Gerente de Producción de Mermelada', 'Lunes a Viernes de 8am a 5pm', '2024-05-06', 117),
    ('00240018', '00200018', 'Pendiente', 'Jefe de Producción de Fruta Confitada', 'Lunes a Viernes de 9am a 6pm', '2024-05-07', 118),
    ('00240019', '00200019', 'Pendiente', 'Especialista de Investigación y Desarrollo', 'Lunes a Viernes de 8am a 5pm', '2024-05-08', 119),
    ('00240020', '00200020', 'Pendiente', 'Supervisor de Logística y Distribución', 'Lunes a Viernes de 9am a 6pm', '2024-05-09', 120);

INSERT INTO Entrevista (ID_Entrevista, Fecha_Eva, Hora_entrevista, ID_Solicitud, ID_Evaluacion, ID_Empleado) VALUES 
    (1, '2024-04-20', '09:00', '00240001', 1, 20210014), 
    (2, '2024-04-21', '09:30', '00240002', 2, 20210014), 
    (3, '2024-04-22', '10:00', '00240003', 3, 20210015), 
    (4, '2024-04-23', '10:30', '00240004', 4, 20210014), 
    (5, '2024-04-24', '11:00', '00240005', 5, 20210014), 
    (6, '2024-04-25', '11:30', '00240006', 6, 20210014), 
    (7, '2024-04-26', '12:00', '00240007', 7, 20210014), 
    (8, '2024-04-27', '12:30', '00240008', 8, 20210014), 
    (9, '2024-04-28', '13:00', '00240009', 9, 20210014), 
    (10, '2024-04-29', '13:30', '00240010', 10, 20210015), 
    (11, '2024-04-30', '14:00', '00240011', 11, 20210014), 
    (12, '2024-05-01', '14:30', '00240012', 12, 20210014), 
    (13, '2024-05-02', '15:00', '00240013', 13, 20210015), 
    (14, '2024-05-03', '15:30', '00240014', 14, 20210015), 
    (15, '2024-05-04', '16:00', '00240015', 15, 20210014), 
    (16, '2024-05-05', '16:30', '00240016', 16, 20210014), 
    (17, '2024-05-06', '17:00', '00240017', 17, 20210015), 
    (18, '2024-05-07', '17:30', '00240018', 18, 20210014), 
    (19, '2024-05-08', '18:00', '00240019', 19, 20210015), 
    (20, '2024-05-09', '18:30', '00240020', 20, 20210015);