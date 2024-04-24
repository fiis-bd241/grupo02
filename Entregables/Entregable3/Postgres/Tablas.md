# Creación de tablas
## Código de creación
### Entidad: Cargo
``CREATE TABLE Cargo(
    ID_Cargo INTEGER primary key,
    Nombre VARCHAR(64),
    Descripcion VARCHAR(264)
);``

### Entidad: Departamento
``CREATE TABLE Departamento(
ID_Departamento INTEGER primary key,
Nombre_Departamento VARCHAR(64)
);``

### Entidad: Empleado
``CREATE TABLE Empleado(
ID_Empleado INTEGER primary key,
Nombre_Empleado VARCHAR(32),
Apellido_Empleado VARCHAR(32),
Telefono INTEGER,
Direccion VARCHAR(64),
Correo VARCHAR(32),
Fecha_Nacimiento DATE,
Cant_Hijos INTEGER,
Estado_Civil VARCHAR(16),
ID_Departamento INTEGER,
ID_Cargo INTEGER,
FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
);``

### Entidad: Supervisor
``CREATE TABLE Supervisor(
ID_Supervisor INTEGER primary key,
ID_Empleado INTEGER,
FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
``

### Entidad: Cese
``CREATE TABLE Cese(
ID_Cese INTEGER primary key,
EstadoCese VARCHAR(32),
FechaInicioCese DATE,
ID_Empleado INTEGER,
FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
``

### Entidad: Cuestionario_Salida
``CREATE TABLE Cuestionario_Salida(
ID_Cuestionario INTEGER primary key,
ID_Supervisor INTEGER,
ID_Cese INTEGER,
Fecha_Cuestionario DATE,
FOREIGN KEY (ID_Supervisor) REFERENCES Supervisor(ID_Supervisor),
FOREIGN KEY (ID_Cese) REFERENCES Cese(ID_Cese)	
);
``

### Entidad: Pregunta_Salida
``CREATE TABLE Pregunta_Salida(
ID_Pregunta INTEGER primary key,
Pregunta_Salida VARCHAR(256),
Respuesta_Salida VARCHAR(256),
ID_Cuestionario INTEGER,
FOREIGN KEY (ID_Cuestionario) REFERENCES Cuestionario_Salida(ID_Cuestionario)
);
``

### Entidad: Beneficios_Cese
``CREATE TABLE Beneficios_Cese(
ID_Beneficios INTEGER primary key,
Tipo VARCHAR(32),
Monto FLOAT,
ID_Cese INTEGER,
FOREIGN KEY (ID_Cese) REFERENCES Cese(ID_Cese)
);
``

### Entidad: Programa_Capacitación
``CREATE TABLE Programa_Capacitador(
ID_Programa_C INTEGER primary key,
Fecha_Inicio DATE,
Fecha_Fin DATE);
``

### Entidad: Sesion
``CREATE TABLE Sesion(
ID_Sesion INTEGER primary key,
Estado VARCHAR(64),
Fecha DATE,
Hora TIME,
ID_Programa_C INTEGER,
FOREIGN KEY(ID_Programa_C) REFERENCES Programa_Capacitador(ID_Programa_C)
);
``

### Entidad: Empleado_Sesion
``CREATE TABLE Empleado_Sesion(
ID_Sesion INTEGER ,
ID_Empleado INTEGER,
Asistencia VARCHAR(64),
FOREIGN KEY(ID_Sesion) REFERENCES Sesion(ID_Sesion),
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
``

### Entidad: Instructor
``CREATE TABLE Instructor(
ID_Instructor INTEGER primary key,
ID_Empleado INTEGER,
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
);``

### Entidad: Evaluacion_Sesion
``CREATE TABLE Evaluacion_Sesion(
ID_Evaluacion INTEGER,
ID_Sesion INTEGER,
Resultado VARCHAR(64)
);``

### Entidad: Evaluacion_Capacitacion
``CREATE TABLE Evaluacion_Capacitacion(
ID_Evaluacion INTEGER,
Duracion_Evaluacion INTEGER,
Hora TIME,
ID_Instructor INTEGER,
FOREIGN KEY(ID_Instructor) REFERENCES Instructor(ID_Instructor)
);
``

### Entidad: Permiso
``CREATE TABLE Permiso(
ID_Permiso INTEGER primary key,
ID_Empleado INTEGER ,
ID_Supervisor INTEGER,
Tipo VARCHAR(64),
Motivo VARCHAR(128),
Duracion TIME,
Estado CHAR,
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor)
);``

### Entidad: Licencia
``CREATE TABLE Licencia(
ID_Licencia INTEGER primary key,
ID_Empleado INTEGER ,
ID_Supervisor INTEGER,
Tipo VARCHAR(64),
Fecha_inicio DATE,
Fecha_fin DATE,
Estado CHAR,
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado),
FOREIGN KEY(ID_Supervisor) REFERENCES Supervisor(ID_Supervisor)
);
``

### Entidad: Asistencia
``CREATE TABLE Asistencia(
ID_Asistencia INTEGER primary key,
ID_Empleado INTEGER ,
Estado CHAR,
Observacion VARCHAR (128),
Fecha DATE,
Hora_entrada TIME,
Hora_salida TIME,
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
);
``

## Llenado de datos

### Datos Tabla: Departamento
``
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
``

### Datos Tabla: Cargo
``INSERT INTO Cargo (ID_Cargo, Nombre, Descripcion) VALUES
(1, 'Gerente', 'Encargado de la dirección de alguna área.'),
(2, 'Jefe', 'Persona que tiene autoridad sobre un grupo de trabajadores'),
(3, 'Especialista', 'Persona con conocimientos específicos en un área determinada.'),
(4, 'Supervisor', 'Encargado de supervisar y coordinar las actividades de un grupo de trabajadores.'),
(5, 'Técnico', 'Persona con conocimientos técnicos especializados en una determinada área.'),
(6, 'Profesional', 'Persona con formación académica y experiencia en un campo específico.'),
(7, 'Asistente', 'Persona que brinda apoyo administrativo o técnico en una organización.'),
(8, 'Operario', 'Persona encargada de realizar tareas operativas o de producción en una empresa.');
``
### Datos Tabla: Empleado
``INSERT INTO Empleado (ID_Empleado, Nombre_Empleado, Apellido_Empleado, Telefono, Direccion, Correo, Fecha_Nacimiento, Cant_Hijos, Estado_Civil, ID_Departamento, ID_Cargo) VALUES
 (20210001, 'Juan', 'López', 912345678, 'Calle Los Pinos 123, Lima', 'juan.lopez@gmail.com', '1990-01-15', 2, 'Casado', 1, 7),
 (20210002, 'María', 'García', 912345679, 'Avenida El Sol 456, Arequipa', 'maria.garcia@gmail.com', '1985-05-20', 1, 'Soltero', 2, 2),
 (20210003, 'Pedro', 'Rodríguez', 912345680, 'Jirón Junín 789, Cusco', 'pedro.rodriguez@gmail.com', '1988-11-10', 0, 'Soltero', 1, 3),
 (20210004, 'Ana', 'Martínez', 912345681, 'Calle Las Flores 012, Trujillo', 'ana.martinez@gmail.com', '1992-07-03', 3, 'Casado', 3, 2),
 (20210005, 'Luis', 'Hernández', 912345682, 'Avenida Los Alamos 345, Chiclayo', 'luis.hernandez@gmail.com', '1995-04-18', 0, 'Soltero', 2, 5),
 (20210006, 'Laura', 'González', 912345683, 'Calle Los Pájaros 678, Piura', 'laura.gonzalez@gmail.com', '1991-09-25', 2, 'Casado', 3, 3),
 (20210007, 'Carlos', 'Ramírez', 912345684, 'Jirón Los Laureles 901, Huancayo', 'carlos.ramirez@gmail.com', '1987-03-12', 1, 'Soltero', 7, 2),
 (20210008, 'Diana', 'Vargas', 912345685, 'Avenida Los Cerezos 234, Iquitos', 'diana.vargas@gmail.com', '1993-06-28', 0, 'Soltero', 8, 3),
 (20210009, 'Roberto', 'Paredes', 912345686, 'Calle Las Palmeras 567, Tacna', 'roberto.paredes@gmail.com', '1989-12-07', 2, 'Casado', 9, 4),
 (20210010, 'Sandra', 'Torres', 912345687, 'Avenida Los Pinos 890, Puno', 'sandra.torres@gmail.com', '1994-02-14', 1, 'Soltero', 10, 2),
(20200001, 'Juan', 'Pérez', 912345688, 'Av. Arequipa 123, Lima', 'juan.perez@gmail.com', '1975-05-10', 2, 'Casado', NULL, 1),
(20230002, 'Ana', 'García', 912345689, 'Av. Javier Prado Este 456, Lima', 'ana.garcia@gmail.com', '1980-08-20', 1, 'Soltero', 1, 2),
(20230005, 'Pedro', 'Rodríguez', 912345692, 'Av. Salaverry 234, Lima', 'pedro.rodriguez@gmail.com', '1985-07-30', 1, 'Soltero', 4, 2),
(20230006, 'Laura', 'Fernández', 912345693, 'Av. La Marina 567, Lima', 'laura.fernandez@gmail.com', '1990-01-05', 2, 'Casado', 1, 3),
(20230007, 'Miguel', 'Gómez', 912345694, 'Av. Universitaria 890, Lima', 'miguel.gomez@gmail.com', '1987-12-12', 0, 'Soltero', 1, 4),
(20230008, 'Elena', 'Díaz', 912345695, 'Av. Colonial 123, Lima', 'elena.diaz@gmail.com', '1983-09-18', 1, 'Casado', 2, 5),
(20230009, 'David', 'Sánchez', 912345719, 'Av. Los Girasoles 456, Lima', 'david.sanchez@gmail.com', '1993-04-20', 0, 'Soltero', 2, 6),
(20230010, 'Sara', 'Martín', 912345720, 'Av. Los Girasoles 456, Lima', 'sara.martin@gmail.com', '1988-06-15', 2, 'Casado', 3, 7),
(20230011, 'Javier', 'Ruiz', 912345721, 'Av. Los Girasoles 456, Lima', 'javier.ruiz@gmail.com', '1986-02-28', 0, 'Soltero', 4, 8),
(20230012, 'Paula', 'Gutiérrez', 912345722, 'Av. Los Girasoles 456, Lima', 'paula.gutierrez@gmail.com', '1991-10-10', 3, 'Casado', 5, 3),
(20230013, 'Daniel', 'López', 912345723, 'Av. Los Girasoles 456, Lima', 'daniel.lopez@gmail.com', '1984-07-03', 0, 'Soltero', 5, 4),
(20230014, 'Lucía', 'Hernández', 912345724, 'Av. Los Girasoles 456, Lima', 'lucia.hernandez@gmail.com', '1989-12-25', 1, 'Casado', 6, 5),
(20230015, 'Alejandro', 'Pérez', 912345725, 'Av. Los Girasoles 456, Lima', 'alejandro.perez@gmail.com', '1981-04-15', 0, 'Soltero', 6, 6),
(20220001, 'David', 'Sánchez', 912345696, 'Av. San Felipe 456, Lima', 'david.sanchez@gmail.com', '1993-04-20', 0, 'Soltero', 2, 6),
(20220002, 'Sara', 'Martín', 912345697, 'Av. Benavides 789, Lima', 'sara.martin@gmail.com', '1988-06-15', 2, 'Casado', 3, 7),
(20220003, 'Javier', 'Ruiz', 912345698, 'Av. La Molina 234, Lima', 'javier.ruiz@gmail.com', '1986-02-28', 0, 'Soltero', 4, 8),
(20220004, 'Paula', 'Gutiérrez', 912345699, 'Av. Huaylas 567, Lima', 'paula.gutierrez@gmail.com', '1991-10-10', 3, 'Casado', 5, 3),
(20220005, 'Daniel', 'López', 912345700, 'Av. Primavera 890, Lima', 'daniel.lopez@gmail.com', '1984-07-03', 0, 'Soltero', 5, 4),
(20220006, 'Lucía', 'Hernández', 912345701, 'Av. José Pardo 123, Lima', 'lucia.hernandez@gmail.com', '1989-12-25', 1, 'Casado', 6, 5),
(20220007, 'Alejandro', 'Pérez', 912345702, 'Av. Javier Prado Oeste 456, Lima', 'alejandro.perez@gmail.com', '1981-04-15', 0, 'Soltero', 6, 6),
(20240001, 'Julia', 'Gutiérrez', 999888777, 'Av. Huaylas 789, Lima', 'julia.gutierrez@gmail.com', '1996-06-15', 0, 'Soltero', 10, 6),
(20240002, 'Martín', 'López', 333444555, 'Av. Primavera 234, Lima', 'martin.lopez@gmail.com', '1994-02-28', 1, 'Casado', 10, 7),
(20240003, 'Fernanda', 'Hernández', 222111444, 'Av. José Pardo 567, Lima', 'fernanda.hernandez@gmail.com', '1993-12-25', 2, 'Casado', 10, 8),
(20240004, 'Diego', 'Gómez', 555222111, 'Av. Javier Prado Este 890, Lima', 'diego.gomez@gmail.com', '1992-09-18', 0, 'Soltero', 11, 6),
(20240005, 'Camila', 'Díaz', 777888999, 'Av. Universitaria 123, Lima', 'camila.diaz@gmail.com', '1991-11-20', 1, 'Casado', 11, 7),
(20240006, 'Mateo', 'Sánchez', 333666999, 'Av. Colonial 456, Lima', 'mateo.sanchez@gmail.com', '1990-05-25', 0, 'Soltero', 11, 8),
(20240007, 'Julieta', 'Martínez', 888111222, 'Av. San Felipe 789, Lima', 'julieta.martinez@gmail.com', '1989-03-30', 2, 'Casado', 12, 6),
(20240008, 'Simón', 'Pérez', 222333444, 'Av. Benavides 123, Lima', 'simon.perez@gmail.com', '1988-01-15', 1, 'Soltero', 12, 7),
(20240009, 'Valeria', 'García', 999111222, 'Av. La Molina 456, Lima', 'valeria.garcia@gmail.com', '1987-04-15', 0, 'Soltero', 12, 8),
(20240010, 'Tomás', 'Fernández', 666777888, 'Av. Huaylas 890, Lima', 'tomas.fernandez@gmail.com', '1986-08-10', 1, 'Casado', 13, 6),
(20240011, 'Natalia', 'López', 555444333, 'Av. Primavera 456, Lima', 'natalia.lopez@gmail.com', '1985-07-03', 0, 'Soltero', 13, 7),
(20240012, 'Lucas', 'Hernández', 222111444, 'Av. José Pardo 789, Lima', 'lucas.hernandez@gmail.com', '1984-12-25', 2, 'Casado', 13, 8),
(20240013, 'Eduardo', 'Gómez', 912345703, 'Av. La Victoria 456, Lima', 'eduardo.gomez@gmail.com', '1997-02-10', 0, 'Soltero', 10, 7),
(20240014, 'Mariana', 'Martínez', 912345704, 'Av. Las Rosas 789, Lima', 'mariana.martinez@gmail.com', '1998-08-15', 1, 'Casado', 10, 8),
(20240015, 'Manuel', 'Díaz', 912345705, 'Av. Los Cipreses 123, Lima', 'manuel.diaz@gmail.com', '1999-05-20', 0, 'Soltero', 10, 6),
(20240016, 'Valentina', 'González', 912345706, 'Av. Los Girasoles 456, Lima', 'valentina.gonzalez@gmail.com', '1996-10-25', 2, 'Casado', 11, 6),
(20240017, 'Francisco', 'García', 912345707, 'Av. Las Orquídeas 789, Lima', 'francisco.garcia@gmail.com', '1995-12-30', 0, 'Soltero', 11, 7),
(20240018, 'Renata', 'Hernández', 912345708, 'Av. Los Jazmines 123, Lima', 'renata.hernandez@gmail.com', '1994-09-05', 1, 'Casado', 11, 8),
(20240019, 'Esteban', 'Martínez', 912345709, 'Av. Las Azucenas 456, Lima', 'esteban.martinez@gmail.com', '1993-04-10', 0, 'Soltero', 12, 6),
(20240020, 'Antonia', 'Díaz', 912345710, 'Av. Las Margaritas 789, Lima', 'antonia.diaz@gmail.com', '1992-11-15', 2, 'Casado', 12, 7),
(20240021, 'Ricardo', 'Gómez', 912345711, 'Av. Los Lirios 123, Lima', 'ricardo.gomez@gmail.com', '1991-06-20', 0, 'Soltero', 12, 8),
(20240022, 'Daniela', 'García', 912345712, 'Av. Las Violetas 456, Lima', 'daniela.garcia@gmail.com', '1990-03-25', 1, 'Casado', 13, 6),
(20240023, 'Felipe', 'Hernández', 912345713, 'Av. Las Hortensias 789, Lima', 'felipe.hernandez@gmail.com', '1989-08-30', 0, 'Soltero', 13, 7),
(20240024, 'Gabriela', 'Martínez', 912345714, 'Av. Los Tulipanes 123, Lima', 'gabriela.martinez@gmail.com', '1988-01-05', 2, 'Casado', 13, 8),
(20240027, 'Andrés', 'Martínez', 912345717, 'Av. Las Margaritas 123, Lima', 'andres.martinez@gmail.com', '1985-05-20', 0, 'Soltero', 8, 3);
(20240028, 'Sulema', 'Ramirez', 912345718, 'Av. Los Jazmines 123, Lima', ‘sulema.ramirez@gmail.com', '1985-06-20', 0, 'Soltero', 5, 2),
(20240029, 'Jair', 'Vigo', 912345719, 'Av. Huandoy 124, Lima', ‘jair.vigo@gmail.com', '2000-06-20', 0, 'Soltero', 6, 2),
(20240030, 'Fernando', 'Valdez', 912345720, 'Av. Las Palmeras 345, Lima', ‘fernando.valdez@gmail.com', '2000-07-20', 0, 'Soltero', 8, 2),
(20240031, 'Leo', 'Mendoza', 912345721, 'Av. Los Naranjos 243, Lima', ‘leo.mendoza@gmail.com', '1999-06-24', 0, 'Soltero', 9, 2),
(20240032, 'Jose', 'Diaz', 912345722, 'Av. Los Tulipanes 576, Lima', ‘jose.diaz@gmail.com', '1999-06-13', 0, 'Soltero', 11, 2),
(20240033, 'Ronald', 'Yaya', 912345723, 'Av. Los Carteles 456, Lima', ‘ronald.yaya@gmail.com', '1998-06-21', 0, 'Soltero', 12, 2),
(20240034, 'Gustavo', 'Berrospi', 912345724, 'Av. Los Hermanos 354, Lima', ‘sulema.ramirez@gmail.com', '1989-06-12', 0, 'Soltero', 13, 2),
(20200004, 'Ana', 'Martínez', 912345728, 'Av. Las Palmeras 456, Lima', 'ana.martinez@gmail.com', '1988-07-25', 0, 'Soltero', 2, 4),
(20200005, 'Luis', 'González', 912345729, 'Av. Los Pinos 789, Lima', 'luis.gonzalez@gmail.com', '1990-09-30', 1, 'Casado', 2, 4),
(20200006, 'Laura', 'Rodríguez', 912345730, 'Av. Los Alamos 234, Lima', 'laura.rodriguez@gmail.com', '1987-11-05', 0, 'Soltero', 2, 4),
(20200007, 'Carlos', 'Hernández', 912345731, 'Av. La Victoria 567, Lima', 'carlos.hernandez@gmail.com', '1983-02-20', 2, 'Casado', 3, 4),
(20200008, 'Diana', 'Martín', 912345732, 'Av. Los Jazmines 890, Lima', 'diana.martin@gmail.com', '1986-04-15', 1, 'Soltero', 3, 4),
(20200009, 'Roberto', 'Sánchez', 912345733, 'Av. Las Orquídeas 123, Lima', 'roberto.sanchez@gmail.com', '1991-06-10', 0, 'Soltero', 3, 4),
(20200010, 'Sandra', 'García', 912345734, 'Av. Las Rosas 456, Lima', 'sandra.garcia@gmail.com', '1984-08-25', 1, 'Casado', 4, 4),
(20200016, 'Carolina', 'Díaz', 912345740, 'Av. Las Margaritas 456, Lima', 'carolina.diaz@gmail.com', '1981-07-15', 1, 'Casado', 6, 4),
(20200019, 'Tomás', 'Gómez', 912345743, 'Av. Las Orquídeas 567, Lima', 'tomas.gomez@gmail.com', '1993-02-10', 0, 'Soltero', 7, 4),
(20200022, 'Elena', 'García', 912345746, 'Av. Las Violetas 456, Lima', 'elena.garcia@gmail.com', '1982-08-25', 2, 'Casado', 8, 4),
(20200023, 'David', 'Ruiz', 912345747, 'Av. Las Azucenas 789, Lima', 'david.ruiz@gmail.com', '1985-10-30', 0, 'Soltero', 8, 4),
(20200025, 'Javier', 'Díaz', 912345749, 'Av. Los Lirios 567, Lima', 'javier.diaz@gmail.com', '1983-01-10', 0, 'Soltero', 9, 4),
(20200026, 'Paula', 'Gómez', 912345750, 'Av. Las Camelias 890, Lima', 'paula.gomez@gmail.com', '1986-03-15', 2, 'Casado', 9, 4),
(20200028, 'Lucía', 'Hernández', 912345752, 'Av. Los Girasoles 456, Lima', 'lucia.hernandez@gmail.com', '1981-07-25', 1, 'Casado', 10, 4),
(20200029, 'Alejandro', 'López', 912345753, 'Av. Los Jazmines 789, Lima', 'alejandro.lopez@gmail.com', '1984-09-30', 0, 'Soltero', 10, 4),
(20200030, 'Valentina', 'González', 912345754, 'Av. Las Azucenas 234, Lima', 'valentina.gonzalez@gmail.com', '1987-11-05', 2, 'Casado', 10, 4),
(20200031, 'Francisco', 'Díaz', 912345755, 'Av. Las Camelias 567, Lima', 'francisco.diaz@gmail.com', '1982-01-10', 0, 'Soltero', 11, 4),
(20200034, 'Antonia', 'Hernández', 912345758, 'Av. Los Lirios 456, Lima', 'antonia.hernandez@gmail.com', '1983-07-25', 1, 'Casado', 12, 4),
(20200037, 'Felipe', 'Martínez', 912345761, 'Av. Las Azucenas 567, Lima', 'felipe.martinez@gmail.com', '1984-02-10', 0, 'Soltero', 13, 4);``

### Datos Tabla: Instructor
``INSERT INTO Instructor(ID_Instructor, ID_Empleado) VALUES
(1,20210003), (2,20210006), (3,20210008), (4,20210009), (5,20230006), (6,20230007), (7,20230012), (8,20230013), (9,20220004), (10,20220005), (11,20240027);
``
### Datos Tabla: Supervisor
``INSERT INTO supervisor VALUES
(1, 20230007), (2, 20200004), (3, 20200006), (4, 20200005), (5, 20200009), (6, 20200007), (7, 20200008), (8, 20200010), (9, 20220005), (10, 20230013), (11, 20200016), (12, 20200019), (13, 20200022), (14, 20200023), (15, 20210009), (16, 20200025), (17, 20200026), (18, 20200028), (19, 20200029), (20, 20200030), (21, 20200031), (22, 20200034), (23, 20200037);
``
### Datos Tabla: Programa-Capacitador
``INSERT INTO Programa_Capacitador(ID_Programa_C,Fecha_Inicio,Fecha_Fin) VALUES
(1, '2021-01-01', '2021-02-15'), (2, '2021-03-15', '2021-05-01'), (3, '2021-08-01', '2021-11-30'), (4, '2022-01-15', '2022-02-15'), (5, '2022-09-15', '2022-11-30'), (6, '2023-03-01', '2023-05-31'), (7, '2023-10-01', '2023-12-31'), (8, '2024-01-14', '2024-02-28');
``
### Datos Tabla: Sesión
``INSERT INTO Sesion(ID_Sesion,Estado,Fecha,Hora,ID_Programa_C) VALUES
(1,'Completa','2021-01-01','17:30:00',1),(2,'Completa','2021-01-08','17:30:00',1),
(3,'Completa','2021-01-15','17:30:00',1),(4,'Completa','2021-01-22','17:30:00',1),
(5,'Completa','2021-01-29','17:30:00',1),(6,'Completa','2021-02-05','17:30:00',1),
(7,'Completa','2021-02-12','17:30:00',1),(8,'Completa','2021-03-15','20:00:00',2),
(9,'Completa','2021-03-29','20:00:00',2),(10,'Completa','2021-04-13','20:00:00',2),
(11,'Completa','2021-04-27','20:00:00',2),(12,'Completa','2021-05-11','20:00:00',2),
(13,'Completa','2021-08-01','08:00:00',3),(14,'Completa','2021-09-01','08:00:00',3),
(15,'Completa','2021-10-01','08:00:00',3),(16,'Completa','2021-11-01','08:00:00',3),
(17,'Completa','2022-01-15','09:00:00',4),(18,'Completa','2022-01-29','09:00:00',4),
(19,'Completa','2022-02-12','09:00:00',4),(20,'Completa','2022-09-15','20:00:00',5),
(21,'Completa','2022-11-15','20:00:00',5),(22,'Completa','2023-03-01','08:00:00',6),
(23,'Completa','2023-03-15','08:00:00',6),(24,'Completa','2023-04-01','08:00:00',6),
(25,'Completa','2023-04-15','08:00:00',6),(26,'Completa','2023-05-01','08:00:00',6),
(27,'Completa','2023-05-15','08:00:00',6),(28,'Completa','2023-05-31','08:00:00',6),
(29,'Completa','2023-10-01','08:00:00',7),(30,'Completa','2023-11-01','08:00:00',7),
(31,'Completa','2024-01-15','16:00:00',8),(32,'Completa','2024-01-30','16:00:00',8),
(33,'Completa','2024-02-15','16:00:00',8),(34,'Programada','2024-05-01','17:00:00',9),
(35,'Programada','2024-06-01','17:00:00',9),(36,'Programada','2024-07-01','17:00:00',9),
(37,'Programada','2024-07-30','17:00:00',9);
``
### Datos Tabla: Empleado_Sesión
``INSERT INTO Empleado_Sesion VALUES
(1,20230011,'Asistio'),(1,20240006,'Falto'),(1,20240024,'Asistio'),(1,20240021,'Falto'),
(2,20230011,'Asistio'),(2,20240006,'Asistio'),(2,20240024,'Asistio'),(2,20240021,'Asistio'),
(3,20230011,'Asistio'),(3,20240006,'Asistio'),(3,20240024,'Asistio'),(3,20240021,'Falto'),
(4,20230011,'Asistio'),(4,20240006,'Asistio'),(4,20240024,'Asistio'),(4,20240021,'Asistio'),
(5,20230011,'Asistio'),(5,20240006,'Falto'),(5,20240024,'Asistio'),(5,20240021,'Falto'),
(6,20230011,'Asistio'),(6,20240006,'Asistio'),(6,20240024,'Asistio'),(6,20240021,'Asistio'),
(7,20230011,'Asistio'),(7,20240006,'Falto'),(7,20240024,'Asistio'),(7,20240021,'Asistio');
``
### Datos Tabla: Evaluación-Capacitación
``INSERT INTO Evaluacion_Capacitacion VALUES
(1,1,'19:00:00',20240027),(2,1,'19:00:00',1),(3,1,'19:00:00',1),(4,1,'19:00:00',1),(5,1,'19:00:00',1),
(6,1,'19:00:00',1),(7,1,'19:00:00',1);
``
### Datos Tabla: Cese

``INSERT INTO Cese VALUES
(1,'Pendiente','2022-08-15',20240024),(2,'Completado','2022-07-15',20210009),(3,'Rechazado','2022-05-15',20240018),(4,'Rechazado','2022-04-15',20240004),(5,'Rechazado','2022-03-15',20230014),(6,'Pendiente','2022-11-15',20220007),(7,'Completado','2022-11-15',20240016);
``

### Datos Tabla: Cuestionario_Salida
``INSERT INTO Cuestionario_Salida VALUES
(1,2,2,'2022-07-16'),(2,3,7,'2022-11-16');
``
### Datos Tabla: Pregunta_Salida
``
INSERT INTO Pregunta_Salida VALUES
(1,'¿Que tal fue su experiencia en la empresa?', 'Buena',1),(2,'¿Qué mejoraría en el trato a los empleados de la empresa?', 'Me gustaría que dieran más tiempo de refrigerio',1),(3,'¿Cuál fue el motivo de su renuncia?', 'Me voy a ir del país',1),(4,'¿Por qué trató de tomar pertenencias de la empresa?', 'Necesitaba el dinero',2);
``
### Datos Tabla: Beneficios_Cese
``
INSERT INTO Beneficios_Cese VALUES
(1,'CTS',5674.12,2);(2,'Deuda por robo',-3450.90,7);
``
### Datos Tabla: Asistencia
``INSERT INTO Asistencia VALUES (ID_Asistencia, Estado, Observación, Fecha, Hora_entrada, Hora_salida, ID_Empleado) VALUES
(1, 'En orden', 'Ninguna', '2022-05-10', '09:30', '18:00', 20210001),
(2, 'En observación', 'Revisar código', '2022-05-11', '08:00', '17:30', 20210002),
(3, 'En orden', 'Ninguna', '2022-05-12', '10:00', '19:00', 20210003),
(4, 'En orden', 'Ninguna', '2022-05-13', '08:30', '17:00', 20210004),
(5, 'En observación', 'Optimizar algoritmo', '2022-05-14', '09:00', '18:30', 20210005),
(6, 'En orden', 'Ninguna', '2022-05-16', '09:00', '17:30', 20210006),
(7, 'En observación', 'Revisión de seguridad', '2022-05-17', '08:30', '18:00', 20210007),
(8, 'En orden', 'Ninguna', '2022-05-18', '10:30', '19:30', 20210008),
(9, 'En orden', 'Ninguna', '2022-05-19', '08:00', '17:00', 20210009),
(10, 'En observación', 'Optimizar consultas', '2022-05-20', '09:30', '18:30', 20210010)
(11, 'En observación', 'Capacitación pendiente', '2022-06-06', '10:30', '19:00', 20200001),
(12, 'En orden', 'Ninguna', '2022-06-07', '09:30', '18:00', 20230002),
(13, 'En orden', 'Ninguna', '2022-06-08', '08:00', '17:00', 20230005),
(14, 'En observación', 'Reunión externa', '2022-06-09', '11:00', '20:00', 20230006),
(15, 'En orden', 'Ninguna', '2022-06-10', '09:00', '18:00', 20230007),
(16, 'En orden', 'Ninguna', '2022-06-11', '09:30', '18:00', 20230008),
(17, 'En observación', 'Optimizar consultas SQL', '2022-06-12', '08:00', '17:30', 20230009),
(18, 'En orden', 'Ninguna', '2022-06-13', '10:00', '19:00', 20230010)
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
(31, 'En orden', 'Ninguna', '2022-06-26', '09:30', '18:00', 20240001)
(32, 'En orden', 'Ninguna', '2022-06-27', '09:30', '18:00', 20240002),
(33, 'En observación', 'Optimizar código', '2022-06-28', '08:00', '17:30', 20240003),
(34, 'En orden', 'Ninguna', '2022-06-29', '10:00', '19:00', 20240004),
(35, 'En orden', 'Ninguna', '2022-06-30', '08:30', '17:00', 20240005),
(36, 'En observación', 'Reunión de equipo', '2022-07-01', '11:00', '20:00', 20240006),
(37, 'En orden', 'Ninguna', '2022-07-02', '09:00', '18:00', 20240007),
(38, 'En orden', 'Ninguna', '2022-07-03', '08:30', '17:00', 20240008),
(39, 'En observación', 'Revisión de seguridad', '2022-07-04', '10:00', '19:00', 20240009),
(40, 'En orden', 'Ninguna', '2022-07-05', '08:00', '17:00', 20240010),
(41, 'En orden', 'Ninguna', '2022-07-06', '09:30', '18:00', 20240011)
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
(56, 'En orden', 'Ninguna', '2022-08-12', '09:00', '18:00', 20240025),
(57, 'En orden', 'Ninguna', '2022-08-13', '08:30', '17:00', 20240026),
(58, 'En observación', 'Revisión de seguridad', '2022-08-14', '10:00', '19:00', 20240027),
(59, 'En orden', 'Ninguna', '2022-08-15', '08:00', '17:00', 20240028),
(60, 'En orden', 'Ninguna', '2022-08-16', '09:30', '18:00', 20240029);
(61, 'En orden', 'Ninguna', '2022-08-17', '09:00', '18:00', 20240030),
(62, 'En observación', 'Actualización de equipo', '2022-08-18', '08:30', '17:30', 20240031),
(63, 'En orden', 'Ninguna', '2022-08-19', '10:00', '19:00', 20240032),
(64, 'En orden', 'Ninguna', '2022-08-20', '09:30', '18:30', 20240033),
(65, 'En observación', 'Revisión de protocolos', '2022-08-21', '08:00', '17:00', 20240034),
(66, 'En orden', 'Ninguna', '2022-08-22', '09:45', '18:15', 20200004),
(67, 'En orden', 'Ninguna', '2022-08-23', '08:15', '17:45', 20200005),
(68, 'En observación', 'Capacitación pendiente', '2022-08-24', '10:30', '19:00', 20200006),
(69, 'En orden', 'Ninguna', '2022-08-25', '09:30', '18:00', 20200007),
(70, 'En orden', 'Ninguna', '2022-08-26', '08:00', '17:00', 20200008)
(71, 'En orden', 'Ninguna', '2022-08-27', '09:00', '18:00', 20200009),
(72, 'En observación', 'Actualización de equipo', '2022-08-28', '08:30', '17:30', 20200010),
(73, 'En orden', 'Ninguna', '2022-08-29', '10:00', '19:00', 20200016),
(74, 'En orden', 'Ninguna', '2022-08-30', '09:30', '18:30', 20200019),
(75, 'En observación', 'Revisión de protocolos', '2022-08-31', '08:00', '17:00', 20200022),
(76, 'En orden', 'Ninguna', '2022-09-01', '09:45', '18:15', 20200023),
(77, 'En orden', 'Ninguna', '2022-09-02', '08:15', '17:45', 20200025),
(78, 'En observación', 'Capacitación pendiente', '2022-09-03', '10:30', '19:00', 20200026),
(79, 'En orden', 'Ninguna', '2022-09-04', '09:30', '18:00', 20200028),
(80, 'En orden', 'Ninguna', '2022-09-05', '08:00', '17:00', 20200029)
(81, 'En orden', 'Ninguna', '2022-09-06', '09:00', '18:00', 20200030),
(82, 'En observación', 'Actualización de equipo', '2022-09-07', '08:30', '17:30', 20200031),
(83, 'En orden', 'Ninguna', '2022-09-08', '10:00', '19:00', 20200034),
(84, 'En orden', 'Ninguna', '2022-09-09', '09:30', '18:30', 20200037)
``
### Datos Tabla: Licencia
``INSERT INTO Licencia VALUES (ID_Licencia, Tipo, Estado, Fecha_inicio, Fecha_fin, ID_Empleado, ID_Supervisor) VALUES
(1, "Sindical", "Aceptado", 2021-03-12, 2021-04-12, 20240032, 20230007)
(2, "Por paternidad", "Aprobado", '2020-06-15', '2020-06-29', 20210002, 20200004),
(3, "Por lactancia", "Rechazado", '2021-07-01', '2021-07-15', 20210003, 20200006),
(4, "Por adopción", "Aprobado", '2022-08-10', '2022-08-24', 20210004, 20200005),
(5, "Sindical", "Rechazado", '2020-09-20', '2020-10-05', 20210005, 20200009),
(6, "Por familiares graves", "Aprobado", '2021-11-11', '2021-11-25', 20210006, 20200007),
(7, "Comité SST", "Rechazado", '2022-12-01', '2022-12-15', 20210007, 20200008),
(8, "Por asistencia médica a un familiar", "Aprobado", '2020-01-16', '2020-01-30', 20210008, 20200010),
(9, "Por ser bombero voluntario", "Rechazado", '2021-02-14', '2021-02-28', 20210009, 20220005),
(10, "Por maternidad", "Aprobado", '2022-03-10', '2022-03-24', 20210010, 20230013),
(11, "Por paternidad", "Rechazado", '2020-04-12', '2020-04-26', 20200001, 20200016),
(12, "Por lactancia", "Aprobado", '2021-05-09', '2021-05-23', 20230002, 20200019),
(13, "Por adopción", "Rechazado", '2022-06-07', '2022-06-21', 20230005, 20200022),
(14, "Sindical", "Aprobado", '2020-07-05', '2020-07-19', 20230006, 20200023),
(15, "Por familiares graves", "Rechazado", '2021-08-03', '2021-08-17', 20230007, 20210009),
(16, "Comité SST", "Aprobado", '2022-09-01', '2022-09-15', 20230008, 20200025),
(17, "Por asistencia médica a un familiar", "Rechazado", '2020-10-13', '2020-10-27', 20230009, 20200026),
(18, "Por ser bombero voluntario", "Aprobado", '2021-11-11', '2021-11-25', 20230010, 20200028),
(19, "Por maternidad", "Rechazado", '2022-12-09', '2022-12-23', 20230011, 20200029),
(20, "Por paternidad", "Aprobado", '2020-02-14', '2020-02-28', 20230012, 20200030)
``
### Datos Tabla: Permiso
``INSERT INTO Permiso VALUES (ID_Permiso, Tipo, Motivo, Duracion, Estado, ID_Empleado, ID_Supervisor) VALUES
(1, "Mudanza", "Me mudo por motivos familiares", 10 días, "Aprobado", 20200023, 20230007)
(2, "Matrimonio", "Casamiento con mi pareja de larga data", '15 días', "Aprobado", 20210001, 20200004),
(3, "Nacimiento de un familiar", "Nacimiento de mi sobrino", '7 días', "Rechazado", 20210002, 20200006),
(4, "Fallecimiento de un familiar", "Falleció mi abuelo", '5 días', "Aprobado", 20210003, 20200005),
(5, "Accidente de un familiar", "Mi hermano tuvo un accidente", '20 días', "Rechazado", 20210004, 20200009),
(6, "Enfermedad grave de un familiar", "Mi madre está gravemente enferma", '30 días', "Aprobado", 20210005, 20200007),
(7, "Deberes inexcusables", "Debo asistir a una cita judicial", '3 días', "Rechazado", 20210006, 20200008),
(8, "Exámenes prenatales", "Control prenatal de mi pareja", '1 día', "Aprobado", 20210007, 20200010),
(9, "Funciones sindicales", "Participación en asamblea sindical", '2 días', "Rechazado", 20210008, 20220005),
(10, "Hijos prematuros", "Cuidado de mi hijo prematuro", '25 días', "Aprobado", 20210009, 20230013),
(11, "Formación", "Curso de actualización profesional", '10 días', "Rechazado", 20210010, 20200016),
(12, "Despido objetivo", "Gestiones por despido", '14 días', "Aprobado", 20200001, 20200019),
(13, "Mudanza", "Cambio de residencia por trabajo", '12 días', "Rechazado", 20230002, 20200022),
(14, "Matrimonio", "Mi boda", '15 días', "Aprobado", 20230005, 20200023),
(15, "Nacimiento de un familiar", "Nacimiento de mi hija", '7 días', "Rechazado", 20230006, 20210009),
(16, "Fallecimiento de un familiar", "Falleció mi tío", '5 días', "Aprobado", 20230007, 20200025),
(17, "Accidente de un familiar", "Mi prima sufrió un accidente", '20 días', "Rechazado", 20230008, 20200026),
(18, "Enfermedad grave de un familiar", "Mi padre tiene una enfermedad grave", '30 días', "Aprobado", 20230009, 20200028),
(19, "Deberes inexcusables", "Obligaciones legales imprevistas", '3 días', "Rechazado", 20230010, 20200029),
(20, "Exámenes prenatales", "Exámenes prenatales de mi esposa", '1 día', "Aprobado", 20230011, 20200030),
(21, "Funciones sindicales", "Reunión sindical importante", '2 días', "Rechazado", 20230012, 20200031),
(22, "Hijos prematuros", "Atención a mi hijo recién nacido", '25 días', "Aprobado", 20230013, 20200034),
(23, "Formación", "Seminario de desarrollo personal", '10 días', "Rechazado", 20230014, 20200037),
(24, "Despido objetivo", "Proceso de despido laboral", '14 días', "Aprobado", 20230015, 20230007),
(25, "Mudanza", "Relocalización por motivos de salud", '12 días', "Rechazado", 20220001, 20200004)
``
