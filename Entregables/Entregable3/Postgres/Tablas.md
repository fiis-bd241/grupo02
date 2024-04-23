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
(1, 'Gerente General', 'Encargado de la dirección general de la empresa.'),
(2, 'Jefe', 'Encargado de supervisar un departamento o equipo de trabajo.'),
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
(20200037, 'Felipe', 'Martínez', 912345761, 'Av. Las Azucenas 567, Lima', 'felipe.martinez@gmail.com', '1984-02-10', 0, 'Soltero', 13, 4);

``
