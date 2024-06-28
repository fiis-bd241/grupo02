        MATCH (n:Entrevista) DETACH DELETE n;
        MATCH (n:EvaluacionXCompetencia) DETACH DELETE n;
        MATCH (n:CurriculumXExperiencia) DETACH DELETE n;
        MATCH (n:CurriculumXCertificado) DETACH DELETE n;
        MATCH (n:Competencia) DETACH DELETE n;
        MATCH (n:Solicitud_Empleo) DETACH DELETE n;
        MATCH (n:Vacante) DETACH DELETE n;
        MATCH (n:PerfilConocimiento) DETACH DELETE n;
        MATCH (n:PerfilTitulo) DETACH DELETE n;
        MATCH (n:Conocimiento) DETACH DELETE n;
        MATCH (n:Perfil) DETACH DELETE n;
        MATCH (n:Titulo) DETACH DELETE n;
        MATCH (n:Candidato) DETACH DELETE n;
        MATCH (n:Curriculum) DETACH DELETE n;
        MATCH (n:Experiencia_Laboral) DETACH DELETE n;
        MATCH (n:Certificados) DETACH DELETE n;
        MATCH (n:Evaluacion) DETACH DELETE n;
        MATCH (n:Reunion) DETACH DELETE n;
        MATCH (n:Retroalimentacion) DETACH DELETE n;
        MATCH (n:Reporte) DETACH DELETE n;
        MATCH (n:Respuesta_Cuestionario) DETACH DELETE n;
        MATCH (n:Cuestionario_Empleado) DETACH DELETE n;
        MATCH (n:Pregunta_Cuestionario) DETACH DELETE n;
        MATCH (n:Cuestionario) DETACH DELETE n;
        MATCH (n:Tipo_Respuesta) DETACH DELETE n;
        MATCH (n:Tipo_Cuestionario) DETACH DELETE n;
        MATCH (n:Tipo_Estado) DETACH DELETE n;
        MATCH (n:Asistencia) DETACH DELETE n;
        MATCH (n:Licencia) DETACH DELETE n;
        MATCH (n:Permiso) DETACH DELETE n;
        MATCH (n:Evaluacion_Empleado) DETACH DELETE n;
        MATCH (n:Evaluacion_Sesion) DETACH DELETE n;
        MATCH (n:Evaluacion_Capacitacion) DETACH DELETE n;
        MATCH (n:Empleado_Sesion) DETACH DELETE n;
        MATCH (n:Sesion) DETACH DELETE n;
        MATCH (n:Lista_Matricula) DETACH DELETE n;
        MATCH (n:Programa_Capacitador) DETACH DELETE n;
        MATCH (n:Beneficios_Cese) DETACH DELETE n;
        MATCH (n:Tipo_Cese) DETACH DELETE n;
        MATCH (n:Respuesta_Salida) DETACH DELETE n;
        MATCH (n:Pregunta_Salida) DETACH DELETE n;
        MATCH (n:Cuestionario_Salida) DETACH DELETE n;
        MATCH (n:Cese) DETACH DELETE n;
        MATCH (n:Supervisor) DETACH DELETE n;
        MATCH (n:Nomina) DETACH DELETE n;
        MATCH (n:Pago_Total) DETACH DELETE n;
        MATCH (n:Sueldo) DETACH DELETE n;
        MATCH (n:Modificacion) DETACH DELETE n;
        MATCH (n:Cuenta_Bancaria) DETACH DELETE n;
        MATCH (n:Empleado) DETACH DELETE n;
        MATCH (n:Departamento) DETACH DELETE n;
        MATCH (n:Cargo) DETACH DELETE n;
        
        UNWIND [
          {ID_Departamento: 1, Nombre_Departamento: 'Producción de Fruta Fresca'},
          {ID_Departamento: 2, Nombre_Departamento: 'Recepción y Almacenamiento de Fruta'},
          {ID_Departamento: 3, Nombre_Departamento: 'Control de Calidad'},
          {ID_Departamento: 4, Nombre_Departamento: 'Producción de Mermelada'},
          {ID_Departamento: 5, Nombre_Departamento: 'Producción de Fruta Confitada'},
          {ID_Departamento: 6, Nombre_Departamento: 'Investigación y Desarrollo'},
          {ID_Departamento: 7, Nombre_Departamento: 'Logística y Distribución'},
          {ID_Departamento: 8, Nombre_Departamento: 'Marketing y Ventas'},
          {ID_Departamento: 9, Nombre_Departamento: 'Finanzas y Contabilidad'},
          {ID_Departamento: 10, Nombre_Departamento: 'Recursos Humanos'},
          {ID_Departamento: 11, Nombre_Departamento: 'Mantenimiento y Reparación de Equipos'},
          {ID_Departamento: 12, Nombre_Departamento: 'Seguridad e Higiene'},
          {ID_Departamento: 13, Nombre_Departamento: 'Gestión Ambiental y Sostenibilidad'},
          {ID_Departamento: 14, Nombre_Departamento: 'Directorio'}
        ] AS row
        CREATE (d:Departamento {ID_Departamento: row.ID_Departamento, Nombre_Departamento: row.Nombre_Departamento});
        
        UNWIND [
          {ID_Cargo: 1, Nombre: 'Gerente', Descripcion: 'Encargado de la dirección de alguna área.'},
          {ID_Cargo: 2, Nombre: 'Jefe', Descripcion: 'Persona que tiene autoridad sobre un grupo de trabajadores'},
          {ID_Cargo: 3, Nombre: 'Especialista', Descripcion: 'Persona con conocimientos específicos en un área determinada.'},
          {ID_Cargo: 4, Nombre: 'Supervisor', Descripcion: 'Encargado de supervisar y coordinar las actividades de un grupo de trabajadores.'},
          {ID_Cargo: 5, Nombre: 'Técnico', Descripcion: 'Persona con conocimientos técnicos especializados en una determinada área.'},
          {ID_Cargo: 6, Nombre: 'Profesional', Descripcion: 'Persona con formación académica y experiencia en un campo específico.'},
          {ID_Cargo: 7, Nombre: 'Asistente', Descripcion: 'Persona que brinda apoyo administrativo o técnico en una organización.'},
          {ID_Cargo: 8, Nombre: 'Operario', Descripcion: 'Persona encargada de realizar tareas operativas o de producción en una empresa.'}
        ] AS row
        CREATE (c:Cargo {ID_Cargo: row.ID_Cargo, Nombre: row.Nombre, Descripcion: row.Descripcion});
        
        UNWIND [
          {ID_Empleado: 20200001, Nombre_Empleado: 'Juan', Apellido_Empleado: 'Pérez', Telefono: '912345688', Direccion: 'Av. Arequipa 123, Lima', Correo: 'juan.perez@gmail.com', Fecha_Nacimiento: date('1975-05-10'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '11223344', Fecha_Ingreso: date('2020-01-01'), ID_Departamento: 14, ID_Cargo: 1},
          {ID_Empleado: 20210001, Nombre_Empleado: 'Juan', Apellido_Empleado: 'López', Telefono: '912345678', Direccion: 'Calle Los Pinos 123, Lima', Correo: 'juan.lopez@gmail.com', Fecha_Nacimiento: date('1990-01-15'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '12345678', Fecha_Ingreso: date('2021-01-01'), ID_Departamento: 1, ID_Cargo: 7},
          {ID_Empleado: 20210002, Nombre_Empleado: 'María', Apellido_Empleado: 'García', Telefono: '912345679', Direccion: 'Avenida El Sol 456, Arequipa', Correo: 'maria.garcia@gmail.com', Fecha_Nacimiento: date('1985-05-20'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '23456789', Fecha_Ingreso: date('2021-01-02'), ID_Departamento: 2, ID_Cargo: 2},
          {ID_Empleado: 20210003, Nombre_Empleado: 'Pedro', Apellido_Empleado: 'Rodríguez', Telefono: '912345680', Direccion: 'Jirón Junín 789, Cusco', Correo: 'pedro.rodriguez@gmail.com', Fecha_Nacimiento: date('1988-11-10'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '34567890', Fecha_Ingreso: date('2021-01-03'), ID_Departamento: 1, ID_Cargo: 3},
          {ID_Empleado: 20210004, Nombre_Empleado: 'Ana', Apellido_Empleado: 'Martínez', Telefono: '912345681', Direccion: 'Calle Las Flores 012, Trujillo', Correo: 'ana.martinez@gmail.com', Fecha_Nacimiento: date('1992-07-03'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '45678901', Fecha_Ingreso: date('2021-01-04'), ID_Departamento: 3, ID_Cargo: 2},
          {ID_Empleado: 20210005, Nombre_Empleado: 'Luis', Apellido_Empleado: 'Hernández', Telefono: '912345682', Direccion: 'Avenida Los Alamos 345, Chiclayo', Correo: 'luis.hernandez@gmail.com', Fecha_Nacimiento: date('1995-04-18'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '56789012', Fecha_Ingreso: date('2021-01-05'), ID_Departamento: 2, ID_Cargo: 5},
          {ID_Empleado: 20210006, Nombre_Empleado: 'Laura', Apellido_Empleado: 'González', Telefono: '912345683', Direccion: 'Calle Los Pájaros 678, Piura', Correo: 'laura.gonzalez@gmail.com', Fecha_Nacimiento: date('1991-09-25'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '67890123', Fecha_Ingreso: date('2021-01-06'), ID_Departamento: 3, ID_Cargo: 3},
          {ID_Empleado: 20210007, Nombre_Empleado: 'Carlos', Apellido_Empleado: 'Ramírez', Telefono: '912345684', Direccion: 'Jirón Los Laureles 901, Huancayo', Correo: 'carlos.ramirez@gmail.com', Fecha_Nacimiento: date('1987-03-12'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '78901234', Fecha_Ingreso: date('2021-01-07'), ID_Departamento: 7, ID_Cargo: 2},
          {ID_Empleado: 20210008, Nombre_Empleado: 'Diana', Apellido_Empleado: 'Vargas', Telefono: '912345685', Direccion: 'Avenida Los Cerezos 234, Iquitos', Correo: 'diana.vargas@gmail.com', Fecha_Nacimiento: date('1993-06-28'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '89012345', Fecha_Ingreso: date('2021-01-08'), ID_Departamento: 8, ID_Cargo: 3},
          {ID_Empleado: 20210009, Nombre_Empleado: 'Roberto', Apellido_Empleado: 'Paredes', Telefono: '912345686', Direccion: 'Calle Las Palmeras 567, Tacna', Correo: 'roberto.paredes@gmail.com', Fecha_Nacimiento: date('1989-12-07'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '90123456', Fecha_Ingreso: date('2021-01-09'), ID_Departamento: 9, ID_Cargo: 4},
          {ID_Empleado: 20210010, Nombre_Empleado: 'Sandra', Apellido_Empleado: 'Torres', Telefono: '912345687', Direccion: 'Avenida Los Pinos 890, Puno', Correo: 'sandra.torres@gmail.com', Fecha_Nacimiento: date('1994-02-14'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '01234567', Fecha_Ingreso: date('2021-01-10'), ID_Departamento: 10, ID_Cargo: 2},
          {ID_Empleado: 20210011, Nombre_Empleado: 'Raúl', Apellido_Empleado: 'Rojas', Telefono: '912345706', Direccion: 'Calle Las Magnolias 123, Lima', Correo: 'raul.rojas@gmail.com', Fecha_Nacimiento: date('1985-02-14'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '44556699', Fecha_Ingreso: date('2020-01-11'), ID_Departamento: 8, ID_Cargo: 5},
          {ID_Empleado: 20210012, Nombre_Empleado: 'Pablo', Apellido_Empleado: 'Mendoza', Telefono: '912345707', Direccion: 'Calle Las Orquídeas 456, Lima', Correo: 'pablo.mendoza@gmail.com', Fecha_Nacimiento: date('1987-03-21'), Cant_Hijos: 0, Estado_Civil: 'Casado', DNI: '55667700', Fecha_Ingreso: date('2020-01-12'), ID_Departamento: 9, ID_Cargo: 6},
          {ID_Empleado: 20210013, Nombre_Empleado: 'Carla', Apellido_Empleado: 'Cruz', Telefono: '912345708', Direccion: 'Calle Las Gardenias 789, Lima', Correo: 'carla.cruz@gmail.com', Fecha_Nacimiento: date('1992-11-18'), Cant_Hijos: 2, Estado_Civil: 'Soltero', DNI: '66778811', Fecha_Ingreso: date('2020-01-13'), ID_Departamento: 9, ID_Cargo: 7},
          {ID_Empleado: 20210014, Nombre_Empleado: 'Patricia', Apellido_Empleado: 'Salazar', Telefono: '912345709', Direccion: 'Calle Las Violetas 012, Lima', Correo: 'patricia.salazar@gmail.com', Fecha_Nacimiento: date('1994-04-12'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '77889922', Fecha_Ingreso: date('2020-01-14'), ID_Departamento: 10, ID_Cargo: 8},
          {ID_Empleado: 20210015, Nombre_Empleado: 'Andrea', Apellido_Empleado: 'Castro', Telefono: '912345710', Direccion: 'Calle Las Dalias 345, Lima', Correo: 'andrea.castro@gmail.com', Fecha_Nacimiento: date('1991-09-30'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '88990033', Fecha_Ingreso: date('2020-01-15'), ID_Departamento: 10, ID_Cargo: 2},
          {ID_Empleado: 20220001, Nombre_Empleado: 'David', Apellido_Empleado: 'Sánchez', Telefono: '912345696', Direccion: 'Av. San Felipe 456, Lima', Correo: 'david.sanchez2@gmail.com', Fecha_Nacimiento: date('1993-04-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '44556688', Fecha_Ingreso: date('2020-01-01'), ID_Departamento: 2, ID_Cargo: 6},
          {ID_Empleado: 20220002, Nombre_Empleado: 'Sara', Apellido_Empleado: 'Martín', Telefono: '912345697', Direccion: 'Av. Benavides 789, Lima', Correo: 'sara.martin2@gmail.com', Fecha_Nacimiento: date('1988-06-15'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '55667799', Fecha_Ingreso: date('2020-01-02'), ID_Departamento: 3, ID_Cargo: 7},
          {ID_Empleado: 20220003, Nombre_Empleado: 'Javier', Apellido_Empleado: 'Ruiz', Telefono: '912345698', Direccion: 'Av. La Molina 234, Lima', Correo: 'javier.ruiz@gmail.com', Fecha_Nacimiento: date('1986-02-28'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '66778800', Fecha_Ingreso: date('2020-01-03'), ID_Departamento: 4, ID_Cargo: 8},
          {ID_Empleado: 20220004, Nombre_Empleado: 'Paula', Apellido_Empleado: 'Gutiérrez', Telefono: '912345699', Direccion: 'Av. Huaylas 567, Lima', Correo: 'paula.gutierrez@gmail.com', Fecha_Nacimiento: date('1991-10-10'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '77889911', Fecha_Ingreso: date('2020-01-04'), ID_Departamento: 5, ID_Cargo: 3},
          {ID_Empleado: 20220005, Nombre_Empleado: 'Daniel', Apellido_Empleado: 'López', Telefono: '912345700', Direccion: 'Av. Primavera 123, Lima', Correo: 'daniel.lopez@gmail.com', Fecha_Nacimiento: date('1984-07-03'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '88990022', Fecha_Ingreso: date('2020-01-05'), ID_Departamento: 5, ID_Cargo: 4},
          {ID_Empleado: 20220006, Nombre_Empleado: 'Lucía', Apellido_Empleado: 'Hernández', Telefono: '912345701', Direccion: 'Av. Javier Prado Oeste 456, Lima', Correo: 'lucia.hernandez@gmail.com', Fecha_Nacimiento: date('1989-12-25'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '99001133', Fecha_Ingreso: date('2020-01-06'), ID_Departamento: 6, ID_Cargo: 5},
          {ID_Empleado: 20220007, Nombre_Empleado: 'Alejandro', Apellido_Empleado: 'Pérez', Telefono: '912345702', Direccion: 'Av. Universitaria 789, Lima', Correo: 'alejandro.perez2@gmail.com', Fecha_Nacimiento: date('1981-04-15'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '00112244', Fecha_Ingreso: date('2020-01-07'), ID_Departamento: 6, ID_Cargo: 6},
          {ID_Empleado: 20220008, Nombre_Empleado: 'Marta', Apellido_Empleado: 'Flores', Telefono: '912345703', Direccion: 'Av. Petit Thouars 123, Lima', Correo: 'marta.flores@gmail.com', Fecha_Nacimiento: date('1992-11-18'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '11223366', Fecha_Ingreso: date('2020-01-08'), ID_Departamento: 7, ID_Cargo: 7},
          {ID_Empleado: 20220009, Nombre_Empleado: 'Luis', Apellido_Empleado: 'Ramírez', Telefono: '912345704', Direccion: 'Av. Wilson 456, Lima', Correo: 'luis.ramirez@gmail.com', Fecha_Nacimiento: date('1983-05-23'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '22334477', Fecha_Ingreso: date('2020-01-09'), ID_Departamento: 7, ID_Cargo: 8},
          {ID_Empleado: 20220010, Nombre_Empleado: 'Carmen', Apellido_Empleado: 'González', Telefono: '912345705', Direccion: 'Av. 28 de Julio 789, Lima', Correo: 'carmen.gonzalez@gmail.com', Fecha_Nacimiento: date('1990-09-30'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '33445588', Fecha_Ingreso: date('2020-01-10'), ID_Departamento: 8, ID_Cargo: 3},
          {ID_Empleado: 20230002, Nombre_Empleado: 'Ana', Apellido_Empleado: 'García', Telefono: '912345689', Direccion: 'Av. Javier Prado Este 456, Lima', Correo: 'ana.garcia@gmail.com', Fecha_Nacimiento: date('1980-08-20'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '22334455', Fecha_Ingreso: date('2020-01-02'), ID_Departamento: 1, ID_Cargo: 2},
          {ID_Empleado: 20230005, Nombre_Empleado: 'Pedro', Apellido_Empleado: 'Rodríguez', Telefono: '912345692', Direccion: 'Av. Salaverry 234, Lima', Correo: 'pedro.rodriguez2@gmail.com', Fecha_Nacimiento: date('1985-07-30'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '33445566', Fecha_Ingreso: date('2020-01-05'), ID_Departamento: 4, ID_Cargo: 2},
          {ID_Empleado: 20230006, Nombre_Empleado: 'Laura', Apellido_Empleado: 'Fernández', Telefono: '912345693', Direccion: 'Av. La Marina 567, Lima', Correo: 'laura.fernandez@gmail.com', Fecha_Nacimiento: date('1990-01-05'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '44556677', Fecha_Ingreso: date('2020-01-06'), ID_Departamento: 1, ID_Cargo: 3},
          {ID_Empleado: 20230007, Nombre_Empleado: 'Miguel', Apellido_Empleado: 'Gómez', Telefono: '912345694', Direccion: 'Av. Universitaria 890, Lima', Correo: 'miguel.gomez@gmail.com', Fecha_Nacimiento: date('1987-12-12'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '55667788', Fecha_Ingreso: date('2020-01-07'), ID_Departamento: 1, ID_Cargo: 4},
          {ID_Empleado: 20230008, Nombre_Empleado: 'Elena', Apellido_Empleado: 'Díaz', Telefono: '912345695', Direccion: 'Av. Colonial 123, Lima', Correo: 'elena.diaz@gmail.com', Fecha_Nacimiento: date('1983-09-18'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '66778899', Fecha_Ingreso: date('2020-01-08'), ID_Departamento: 2, ID_Cargo: 5},
          {ID_Empleado: 20230009, Nombre_Empleado: 'David', Apellido_Empleado: 'Sánchez', Telefono: '912345719', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'david.sanchez@gmail.com', Fecha_Nacimiento: date('1993-04-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '77889900', Fecha_Ingreso: date('2020-01-09'), ID_Departamento: 2, ID_Cargo: 6},
          {ID_Empleado: 20230010, Nombre_Empleado: 'Sara', Apellido_Empleado: 'Martín', Telefono: '912345720', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'sara.martin@gmail.com', Fecha_Nacimiento: date('1988-06-15'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '88990011', Fecha_Ingreso: date('2020-01-10'), ID_Departamento: 3, ID_Cargo: 7},
          {ID_Empleado: 20230011, Nombre_Empleado: 'Javier', Apellido_Empleado: 'Ruiz', Telefono: '912345721', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'javier.ruiz2@gmail.com', Fecha_Nacimiento: date('1986-02-28'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '99001122', Fecha_Ingreso: date('2020-01-11'), ID_Departamento: 4, ID_Cargo: 8},
          {ID_Empleado: 20230012, Nombre_Empleado: 'Paula', Apellido_Empleado: 'Gutiérrez', Telefono: '912345722', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'paula.gutierrez2@gmail.com', Fecha_Nacimiento: date('1991-10-10'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '00112233', Fecha_Ingreso: date('2020-01-12'), ID_Departamento: 5, ID_Cargo: 3},
          {ID_Empleado: 20230013, Nombre_Empleado: 'Daniel', Apellido_Empleado: 'López', Telefono: '912345723', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'daniel.lopez2@gmail.com', Fecha_Nacimiento: date('1984-07-03'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '11223355', Fecha_Ingreso: date('2020-01-13'), ID_Departamento: 5, ID_Cargo: 4},
          {ID_Empleado: 20230014, Nombre_Empleado: 'Lucía', Apellido_Empleado: 'Hernández', Telefono: '912345724', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'lucia.hernandez2@gmail.com', Fecha_Nacimiento: date('1989-12-25'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '22334466', Fecha_Ingreso: date('2020-01-14'), ID_Departamento: 6, ID_Cargo: 5},
          {ID_Empleado: 20230015, Nombre_Empleado: 'Alejandro', Apellido_Empleado: 'Pérez', Telefono: '912345725', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'alejandro.perez@gmail.com', Fecha_Nacimiento: date('1981-04-15'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '33445577', Fecha_Ingreso: date('2020-01-15'), ID_Departamento: 6, ID_Cargo: 6},
          {ID_Empleado: 20240001, Nombre_Empleado: 'Marcela', Apellido_Empleado: 'López', Telefono: '912345711', Direccion: 'Av. Los Pinos 123, Lima', Correo: 'marcela.lopez@gmail.com', Fecha_Nacimiento: date('1993-08-15'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '76543210', Fecha_Ingreso: date('2024-01-01'), ID_Departamento: 1, ID_Cargo: 2},
          {ID_Empleado: 20240002, Nombre_Empleado: 'José', Apellido_Empleado: 'Martínez', Telefono: '912345712', Direccion: 'Calle Las Rosas 456, Lima', Correo: 'jose.martinez@gmail.com', Fecha_Nacimiento: date('1990-05-20'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '67890123', Fecha_Ingreso: date('2024-01-02'), ID_Departamento: 2, ID_Cargo: 3},
          {ID_Empleado: 20240003, Nombre_Empleado: 'Verónica', Apellido_Empleado: 'González', Telefono: '912345713', Direccion: 'Av. Las Orquídeas 789, Lima', Correo: 'veronica.gonzalez@gmail.com', Fecha_Nacimiento: date('1987-11-10'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '56789012', Fecha_Ingreso: date('2024-01-03'), ID_Departamento: 3, ID_Cargo: 4},
          {ID_Empleado: 20240004, Nombre_Empleado: 'Jorge', Apellido_Empleado: 'Pérez', Telefono: '912345714', Direccion: 'Calle Los Girasoles 012, Lima', Correo: 'jorge.perez@gmail.com', Fecha_Nacimiento: date('1992-07-03'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '45678901', Fecha_Ingreso: date('2024-01-04'), ID_Departamento: 4, ID_Cargo: 5},
          {ID_Empleado: 20240005, Nombre_Empleado: 'Fernanda', Apellido_Empleado: 'Hernández', Telefono: '912345715', Direccion: 'Av. Los Jazmines 345, Lima', Correo: 'fernanda.hernandez@gmail.com', Fecha_Nacimiento: date('1995-04-18'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '34567890', Fecha_Ingreso: date('2024-01-05'), ID_Departamento: 5, ID_Cargo: 6},
          {ID_Empleado: 20240006, Nombre_Empleado: 'Mateo', Apellido_Empleado: 'Sánchez', Telefono: '922345716', Direccion: 'Av. Los Girasoles 678, Lima', Correo: 'mateo.sanchez@gmail.com', Fecha_Nacimiento: date('1990-05-25'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '23456789', Fecha_Ingreso: date('2024-01-06'), ID_Departamento: 11, ID_Cargo: 8},
          {ID_Empleado: 20240007, Nombre_Empleado: 'Valeria', Apellido_Empleado: 'Martínez', Telefono: '922345717', Direccion: 'Calle Las Margaritas 901, Lima', Correo: 'valeria.martinez@gmail.com', Fecha_Nacimiento: date('1988-01-05'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '34567890', Fecha_Ingreso: date('2024-01-07'), ID_Departamento: 12, ID_Cargo: 8},
          {ID_Empleado: 20240008, Nombre_Empleado: 'Pablo', Apellido_Empleado: 'Gómez', Telefono: '922345718', Direccion: 'Av. Los Tulipanes 234, Lima', Correo: 'pablo.gomez@gmail.com', Fecha_Nacimiento: date('1991-06-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '45678901', Fecha_Ingreso: date('2024-01-08'), ID_Departamento: 13, ID_Cargo: 8},
          {ID_Empleado: 20240009, Nombre_Empleado: 'Mariana', Apellido_Empleado: 'Fernández', Telefono: '922345719', Direccion: 'Av. Los Lirios 567, Lima', Correo: 'mariana.fernandez@gmail.com', Fecha_Nacimiento: date('1986-08-10'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '56789012', Fecha_Ingreso: date('2024-01-09'), ID_Departamento: 14, ID_Cargo: 6},
          {ID_Empleado: 20240010, Nombre_Empleado: 'Gabriel', Apellido_Empleado: 'Hernández', Telefono: '922345720', Direccion: 'Av. Las Gardenias 890, Lima', Correo: 'gabriel.hernandez@gmail.com', Fecha_Nacimiento: date('1993-04-20'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '67890123', Fecha_Ingreso: date('2024-01-10'), ID_Departamento: 1, ID_Cargo: 7},
          {ID_Empleado: 20240011, Nombre_Empleado: 'Lucía', Apellido_Empleado: 'Sánchez', Telefono: '922345721', Direccion: 'Calle Los Claveles 123, Lima', Correo: 'lucia.sanchez@gmail.com', Fecha_Nacimiento: date('1990-01-05'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '78901234', Fecha_Ingreso: date('2024-01-11'), ID_Departamento: 2, ID_Cargo: 8},
          {ID_Empleado: 20240012, Nombre_Empleado: 'Daniel', Apellido_Empleado: 'Martínez', Telefono: '922345722', Direccion: 'Av. Los Girasoles 456, Lima', Correo: 'daniel.martinez@gmail.com', Fecha_Nacimiento: date('1987-12-12'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '89012345', Fecha_Ingreso: date('2024-01-12'), ID_Departamento: 3, ID_Cargo: 3},
          {ID_Empleado: 20240013, Nombre_Empleado: 'Carolina', Apellido_Empleado: 'Gómez', Telefono: '922345723', Direccion: 'Calle Las Violetas 789, Lima', Correo: 'carolina.gomez@gmail.com', Fecha_Nacimiento: date('1983-09-18'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '90123456', Fecha_Ingreso: date('2024-01-13'), ID_Departamento: 4, ID_Cargo: 4},
          {ID_Empleado: 20240014, Nombre_Empleado: 'David', Apellido_Empleado: 'Fernández', Telefono: '922345724', Direccion: 'Av. Los Tulipanes 012, Lima', Correo: 'david.fernandez@gmail.com', Fecha_Nacimiento: date('1989-12-25'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '01234567', Fecha_Ingreso: date('2024-01-14'), ID_Departamento: 5, ID_Cargo: 8},
          {ID_Empleado: 20240015, Nombre_Empleado: 'Sofía', Apellido_Empleado: 'Hernández', Telefono: '922345725', Direccion: 'Av. Los Lirios 345, Lima', Correo: 'sofia.hernandez@gmail.com', Fecha_Nacimiento: date('1981-04-15'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '12345678', Fecha_Ingreso: date('2024-01-15'), ID_Departamento: 6, ID_Cargo: 3},
          {ID_Empleado: 20240016, Nombre_Empleado: 'Andrés', Apellido_Empleado: 'Martínez', Telefono: '922345726', Direccion: 'Calle Las Gardenias 678, Lima', Correo: 'andres.martinez@gmail.com', Fecha_Nacimiento: date('1994-02-14'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '23456789', Fecha_Ingreso: date('2024-01-16'), ID_Departamento: 7, ID_Cargo: 4},
          {ID_Empleado: 20240017, Nombre_Empleado: 'Valentina', Apellido_Empleado: 'Gómez', Telefono: '922345727', Direccion: 'Av. Las Violetas 901, Lima', Correo: 'valentina.gomez@gmail.com', Fecha_Nacimiento: date('1985-02-14'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '34567890', Fecha_Ingreso: date('2024-01-17'), ID_Departamento: 8, ID_Cargo: 5},
          {ID_Empleado: 20240018, Nombre_Empleado: 'Juan', Apellido_Empleado: 'Fernández', Telefono: '922345728', Direccion: 'Av. Los Tulipanes 234, Lima', Correo: 'juan.fernandez@gmail.com', Fecha_Nacimiento: date('1991-09-30'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '45678901', Fecha_Ingreso: date('2024-01-18'), ID_Departamento: 9, ID_Cargo: 6},
          {ID_Empleado: 20240019, Nombre_Empleado: 'Camila', Apellido_Empleado: 'Hernández', Telefono: '922345729', Direccion: 'Av. Los Lirios 567, Lima', Correo: 'camila.hernandez@gmail.com', Fecha_Nacimiento: date('1983-05-23'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '56789012', Fecha_Ingreso: date('2024-01-19'), ID_Departamento: 10, ID_Cargo: 7},
          {ID_Empleado: 20240020, Nombre_Empleado: 'Felipe', Apellido_Empleado: 'Martínez', Telefono: '922345730', Direccion: 'Calle Las Rosas 890, Lima', Correo: 'felipe.martinez@gmail.com', Fecha_Nacimiento: date('1990-09-30'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '67890123', Fecha_Ingreso: date('2024-01-20'), ID_Departamento: 11, ID_Cargo: 8},
          {ID_Empleado: 20240021, Nombre_Empleado: 'Ricardo', Apellido_Empleado: 'Gómez', Telefono: '912345711', Direccion: 'Av. Los Lirios 123, Lima', Correo: 'ricardo.gomez@gmail.com', Fecha_Nacimiento: date('1991-06-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '67899120', Fecha_Ingreso: date('2024-05-07'), ID_Departamento: 12, ID_Cargo: 8},
          {ID_Empleado: 20240022, Nombre_Empleado: 'Fernanda', Apellido_Empleado: 'Pérez', Telefono: '922345731', Direccion: 'Av. Las Orquídeas 456, Lima', Correo: 'fernanda.perez@gmail.com', Fecha_Nacimiento: date('1988-09-15'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '78912340', Fecha_Ingreso: date('2024-05-08'), ID_Departamento: 13, ID_Cargo: 7},
          {ID_Empleado: 20240023, Nombre_Empleado: 'Martín', Apellido_Empleado: 'Flores', Telefono: '922345732', Direccion: 'Av. Los Tulipanes 789, Lima', Correo: 'martin.flores@gmail.com', Fecha_Nacimiento: date('1993-02-28'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '89023451', Fecha_Ingreso: date('2024-05-09'), ID_Departamento: 12, ID_Cargo: 3},
          {ID_Empleado: 20240024, Nombre_Empleado: 'Gabriela', Apellido_Empleado: 'Martínez', Telefono: '912345714', Direccion: 'Av. Los Tulipanes 123, Lima', Correo: 'gabriela.martinez@gmail.com', Fecha_Nacimiento: date('1988-01-05'), Cant_Hijos: 2, Estado_Civil: 'Soltero', DNI: '67348349', Fecha_Ingreso: date('2024-06-02'), ID_Departamento: 3, ID_Cargo: 8},
          {ID_Empleado: 20240025, Nombre_Empleado: 'Tomás', Apellido_Empleado: 'Gómez', Telefono: '966777880', Direccion: 'Av. Huaylas 890, Lima', Correo: 'tomas.gomez@gmail.com', Fecha_Nacimiento: date('1986-08-10'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '87859349', Fecha_Ingreso: date('2024-03-06'), ID_Departamento: 3, ID_Cargo: 6},
          {ID_Empleado: 20240026, Nombre_Empleado: 'Diego', Apellido_Empleado: 'López', Telefono: '922345736', Direccion: 'Av. Los Tulipanes 345, Lima', Correo: 'diego.lopez@gmail.com', Fecha_Nacimiento: date('1994-06-15'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '12345678', Fecha_Ingreso: date('2024-01-25'), ID_Departamento: 6, ID_Cargo: 6},
          {ID_Empleado: 20240027, Nombre_Empleado: 'Renata', Apellido_Empleado: 'Hernández', Telefono: '922345737', Direccion: 'Calle Los Lirios 678, Lima', Correo: 'renata.hernandez@gmail.com', Fecha_Nacimiento: date('1992-02-28'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '23456789', Fecha_Ingreso: date('2024-01-26'), ID_Departamento: 7, ID_Cargo: 4},
          {ID_Empleado: 20240028, Nombre_Empleado: 'Joaquín', Apellido_Empleado: 'Martínez', Telefono: '922345738', Direccion: 'Av. Las Rosas 901, Lima', Correo: 'joaquin.martinez@gmail.com', Fecha_Nacimiento: date('1988-07-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '34567890', Fecha_Ingreso: date('2024-01-27'), ID_Departamento: 8, ID_Cargo: 5},
          {ID_Empleado: 20240029, Nombre_Empleado: 'Maite', Apellido_Empleado: 'Gómez', Telefono: '922345739', Direccion: 'Av. Los Girasoles 234, Lima', Correo: 'maite.gomez@gmail.com', Fecha_Nacimiento: date('1991-11-10'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '45678901', Fecha_Ingreso: date('2024-01-28'), ID_Departamento: 9, ID_Cargo: 6},
          {ID_Empleado: 20240030, Nombre_Empleado: 'Emilio', Apellido_Empleado: 'Fernández', Telefono: '922345740', Direccion: 'Calle Los Claveles 567, Lima', Correo: 'emilio.fernandez@gmail.com', Fecha_Nacimiento: date('1985-04-05'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '56789012', Fecha_Ingreso: date('2024-01-29'), ID_Departamento: 2, ID_Cargo: 7},
          {ID_Empleado: 20240031, Nombre_Empleado: 'Luciana', Apellido_Empleado: 'Sánchez', Telefono: '922345741', Direccion: 'Av. Las Violetas 890, Lima', Correo: 'luciana.sanchez@gmail.com', Fecha_Nacimiento: date('1990-10-30'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '67890123', Fecha_Ingreso: date('2024-01-30'), ID_Departamento: 2, ID_Cargo: 8},
          {ID_Empleado: 20240032, Nombre_Empleado: 'Simón', Apellido_Empleado: 'Martínez', Telefono: '922345742', Direccion: 'Av. Las Gardenias 123, Lima', Correo: 'simon.martinez@gmail.com', Fecha_Nacimiento: date('1987-03-25'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '78901234', Fecha_Ingreso: date('2024-01-31'), ID_Departamento: 2, ID_Cargo: 5},
          {ID_Empleado: 20240033, Nombre_Empleado: 'Abril', Apellido_Empleado: 'Gómez', Telefono: '922345743', Direccion: 'Calle Los Tulipanes 456, Lima', Correo: 'abril.gomez@gmail.com', Fecha_Nacimiento: date('1993-09-20'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '89012345', Fecha_Ingreso: date('2024-02-01'), ID_Departamento: 3, ID_Cargo: 2},
          {ID_Empleado: 20240034, Nombre_Empleado: 'Felipe', Apellido_Empleado: 'Fernández', Telefono: '922345744', Direccion: 'Av. Los Lirios 789, Lima', Correo: 'felipe.fernandez@gmail.com', Fecha_Nacimiento: date('1986-05-15'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '90123456', Fecha_Ingreso: date('2024-02-02'), ID_Departamento: 4, ID_Cargo: 6},
          {ID_Empleado: 20240035, Nombre_Empleado: 'Sara', Apellido_Empleado: 'Sánchez', Telefono: '922345745', Direccion: 'Av. Los Girasoles 012, Lima', Correo: 'sara.sanchez@gmail.com', Fecha_Nacimiento: date('1991-12-10'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '01234567', Fecha_Ingreso: date('2024-02-03'), ID_Departamento: 1, ID_Cargo: 8},
          {ID_Empleado: 20240036, Nombre_Empleado: 'Juan', Apellido_Empleado: 'Martínez', Telefono: '922345746', Direccion: 'Calle Los Claveles 345, Lima', Correo: 'juan.martinez@gmail.com', Fecha_Nacimiento: date('1985-08-05'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '12345678', Fecha_Ingreso: date('2024-02-04'), ID_Departamento: 2, ID_Cargo: 5},
          {ID_Empleado: 20240037, Nombre_Empleado: 'Camila', Apellido_Empleado: 'Gómez', Telefono: '922345747', Direccion: 'Av. Las Violetas 678, Lima', Correo: 'camila.gomez@gmail.com', Fecha_Nacimiento: date('1990-02-28'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '23456789', Fecha_Ingreso: date('2024-02-05'), ID_Departamento: 3, ID_Cargo: 5},
          {ID_Empleado: 20240038, Nombre_Empleado: 'Lucas', Apellido_Empleado: 'Fernández', Telefono: '922345748', Direccion: 'Av. Las Gardenias 901, Lima', Correo: 'lucas.fernandez@gmail.com', Fecha_Nacimiento: date('1987-07-20'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '34567890', Fecha_Ingreso: date('2024-02-06'), ID_Departamento: 4, ID_Cargo: 3},
          {ID_Empleado: 20240039, Nombre_Empleado: 'Valentina', Apellido_Empleado: 'Sánchez', Telefono: '922345749', Direccion: 'Calle Los Tulipanes 234, Lima', Correo: 'valentina.sanchez@gmail.com', Fecha_Nacimiento: date('1991-11-10'), Cant_Hijos: 1, Estado_Civil: 'Casado', DNI: '45678901', Fecha_Ingreso: date('2024-02-07'), ID_Departamento: 5, ID_Cargo: 6},
          {ID_Empleado: 20240040, Nombre_Empleado: 'Mateo', Apellido_Empleado: 'Martínez', Telefono: '922345750', Direccion: 'Av. Los Lirios 567, Lima', Correo: 'mateo.martinez@gmail.com', Fecha_Nacimiento: date('1985-04-05'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '56789012', Fecha_Ingreso: date('2024-02-08'), ID_Departamento: 6, ID_Cargo: 7}
        ] AS row
        CREATE (e:Empleado {
          ID_Empleado: row.ID_Empleado, 
          Nombre_Empleado: row.Nombre_Empleado, 
          Apellido_Empleado: row.Apellido_Empleado, 
          Telefono: row.Telefono, 
          Direccion: row.Direccion, 
          Correo: row.Correo, 
          Fecha_Nacimiento: row.Fecha_Nacimiento, 
          Cant_Hijos: row.Cant_Hijos, 
          Estado_Civil: row.Estado_Civil, 
          DNI: row.DNI, 
          Fecha_Ingreso: row.Fecha_Ingreso
        })
        WITH e, row
        MATCH (d:Departamento {ID_Departamento: row.ID_Departamento}), (c:Cargo {ID_Cargo: row.ID_Cargo})
        CREATE (e)-[:PERTENECE_A]->(d),
               (e)-[:TIENE_CARGO]->(c);
        
        
        UNWIND [
          {id_cuenta_b: 1001, numero_cuenta: '01234567890123456789', nombre_banco: 'Banco de Crédito del Perú', tipo_cuenta: 'Cuenta corriente', moneda: 'Soles', id_empleado: 20210001},
          {id_cuenta_b: 1002, numero_cuenta: '12345678901234567890', nombre_banco: 'Interbank', tipo_cuenta: 'Cuenta de ahorros', moneda: 'Dólares', id_empleado: 20220004},
          {id_cuenta_b: 1003, numero_cuenta: '23456789012345678901', nombre_banco: 'Scotiabank', tipo_cuenta: 'Cuenta corriente', moneda: 'Soles', id_empleado: 20240020},
          {id_cuenta_b: 1004, numero_cuenta: '34567890123456789012', nombre_banco: 'BBVA Continental', tipo_cuenta: 'Cuenta de ahorros', moneda: 'Soles', id_empleado: 20240034},
          {id_cuenta_b: 1005, numero_cuenta: '45678901234567890123', nombre_banco: 'Banco de la Nación', tipo_cuenta: 'Cuenta corriente', moneda: 'Dólares', id_empleado: 20240008}
        ] AS row
        CREATE (cb:Cuenta_Bancaria {
          id_cuenta_b: row.id_cuenta_b, 
          numero_cuenta: row.numero_cuenta, 
          nombre_banco: row.nombre_banco, 
          tipo_cuenta: row.tipo_cuenta, 
          moneda: row.moneda
        })
        WITH cb, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (cb)-[:PERTENECE_A]->(e);
        UNWIND [
          {id_sueldo: 1, monto_salario_bruto: 4500.00},
          {id_sueldo: 2, monto_salario_bruto: 4000.00},
          {id_sueldo: 3, monto_salario_bruto: 3500.00},
          {id_sueldo: 4, monto_salario_bruto: 3200.00},
          {id_sueldo: 5, monto_salario_bruto: 2800.00},
          {id_sueldo: 6, monto_salario_bruto: 4200.00},
          {id_sueldo: 7, monto_salario_bruto: 2000.00},
          {id_sueldo: 8, monto_salario_bruto: 1500.00}
        ] AS row
        CREATE (s:Sueldo {
          id_sueldo: row.id_sueldo, 
          monto_salario_bruto: row.monto_salario_bruto
        });
        
        UNWIND [
          {id_modificacion: 1, tipo_modificacion: 'Aumento', monto_modificacion: 500.00},
          {id_modificacion: 2, tipo_modificacion: 'Bonificación', monto_modificacion: 200.00},
          {id_modificacion: 3, tipo_modificacion: 'Descuento', monto_modificacion: -100.00},
          {id_modificacion: 4, tipo_modificacion: 'Incentivo', monto_modificacion: 300.00},
          {id_modificacion: 5, tipo_modificacion: 'Comisión', monto_modificacion: -150.50}
        ] AS row
        CREATE (m:Modificacion {
          id_modificacion: row.id_modificacion, 
          tipo_modificacion: row.tipo_modificacion, 
          monto_modificacion: row.monto_modificacion
        });
        
        UNWIND [
          {id_pago_total: 1, id_sueldo: 4, id_modificacion: 1, monto_pagar: 3700.00},
          {id_pago_total: 2, id_sueldo: 7, id_modificacion: 4, monto_pagar: 2300.00},
          {id_pago_total: 3, id_sueldo: 5, id_modificacion: 3, monto_pagar: 2700.00},
          {id_pago_total: 4, id_sueldo: 8, id_modificacion: 4, monto_pagar: 1900.00},
          {id_pago_total: 5, id_sueldo: 2, id_modificacion: 5, monto_pagar: 3849.50}
        ] AS row
        CREATE (pt:Pago_Total {
          id_pago_total: row.id_pago_total, 
          monto_pagar: row.monto_pagar
        })
        WITH pt, row
        MATCH (s:Sueldo {id_sueldo: row.id_sueldo}), (m:Modificacion {id_modificacion: row.id_modificacion})
        CREATE (pt)-[:CONTIENE_SUELDO]->(s),
               (pt)-[:CONTIENE_MODIFICACION]->(m);
        
        UNWIND [
          {id_nomina: 2001, fecha_emision: date('2024-04-15'), periodo_pago: 'Quincenal', id_empleado: 20210001, id_pago_total: 1},
          {id_nomina: 2002, fecha_emision: date('2024-04-30'), periodo_pago: 'Mensual', id_empleado: 20220004, id_pago_total: 2},
          {id_nomina: 2003, fecha_emision: date('2024-03-31'), periodo_pago: 'Mensual', id_empleado: 20240015, id_pago_total: 3},
          {id_nomina: 2004, fecha_emision: date('2024-05-15'), periodo_pago: 'Quincenal', id_empleado: 20240034, id_pago_total: 4},
          {id_nomina: 2005, fecha_emision: date('2024-05-31'), periodo_pago: 'Mensual', id_empleado: 20240008, id_pago_total: 5}
        ] AS row
        CREATE (n:Nomina {
          id_nomina: row.id_nomina, 
          fecha_emision: row.fecha_emision, 
          periodo_pago: row.periodo_pago
        })
        WITH n, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado}), (pt:Pago_Total {id_pago_total: row.id_pago_total})
        CREATE (n)-[:PAGADA_A]->(e),
               (n)-[:CONTIENE_PAGO_TOTAL]->(pt);
        
        UNWIND [
          {id_supervisor: 1, id_empleado: 20230007},
          {id_supervisor: 2, id_empleado: 20240004},
          {id_supervisor: 3, id_empleado: 20240006},
          {id_supervisor: 4, id_empleado: 20240005},
          {id_supervisor: 5, id_empleado: 20240009},
          {id_supervisor: 6, id_empleado: 20240007},
          {id_supervisor: 7, id_empleado: 20240008},
          {id_supervisor: 8, id_empleado: 20240010},
          {id_supervisor: 9, id_empleado: 20220005},
          {id_supervisor: 10, id_empleado: 20230013},
          {id_supervisor: 11, id_empleado: 20240016},
          {id_supervisor: 12, id_empleado: 20240019},
          {id_supervisor: 13, id_empleado: 20240022},
          {id_supervisor: 14, id_empleado: 20240023},
          {id_supervisor: 15, id_empleado: 20210009},
          {id_supervisor: 16, id_empleado: 20240025},
          {id_supervisor: 17, id_empleado: 20240026},
          {id_supervisor: 18, id_empleado: 20240028},
          {id_supervisor: 19, id_empleado: 20240029},
          {id_supervisor: 20, id_empleado: 20240030},
          {id_supervisor: 21, id_empleado: 20240031},
          {id_supervisor: 22, id_empleado: 20240034},
          {id_supervisor: 23, id_empleado: 20240037}
        ] AS row
        CREATE (s:Supervisor {
          id_supervisor: row.id_supervisor
        })
        WITH s, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (s)-[:SUPERVISA]->(e);
        
        UNWIND [
          {id_programa_c: 1, fecha_inicio: date('2021-01-01'), fecha_fin: date('2021-02-15'), motivo: 'Técnicas de Cultivo de Frutas Tropicales', id_departamento: 1},
          {id_programa_c: 2, fecha_inicio: date('2021-03-15'), fecha_fin: date('2021-05-01'), motivo: 'Manejo y Almacenamiento de Productos Perecederos', id_departamento: 2},
          {id_programa_c: 3, fecha_inicio: date('2021-08-01'), fecha_fin: date('2021-11-30'), motivo: 'Control de Calidad en la Industria Alimentaria', id_departamento: 3},
          {id_programa_c: 4, fecha_inicio: date('2022-01-15'), fecha_fin: date('2022-02-15'), motivo: 'Elaboración de Mermeladas Artesanales', id_departamento: 4},
          {id_programa_c: 5, fecha_inicio: date('2022-09-15'), fecha_fin: date('2022-11-30'), motivo: 'Proceso de Confitado de Frutas', id_departamento: 5},
          {id_programa_c: 6, fecha_inicio: date('2023-03-01'), fecha_fin: date('2023-05-31'), motivo: 'Innovación y Desarrollo de Nuevos Productos', id_departamento: 6},
          {id_programa_c: 7, fecha_inicio: date('2023-10-01'), fecha_fin: date('2023-12-31'), motivo: 'Gestión Logística y Distribución de Productos Frescos', id_departamento: 7},
          {id_programa_c: 8, fecha_inicio: date('2024-01-14'), fecha_fin: date('2024-02-28'), motivo: 'Estrategias de Marketing para Productos Agroalimentarios', id_departamento: 8}
        ] AS row
        CREATE (p:Programa_Capacitador {
          id_programa_c: row.id_programa_c, 
          fecha_inicio: row.fecha_inicio, 
          fecha_fin: row.fecha_fin, 
          motivo: row.motivo
        })
        WITH p, row
        MATCH (d:Departamento {ID_Departamento: row.id_departamento})
        CREATE (p)-[:PERTENECE_A]->(d);
        
        UNWIND [
          {id_programa_c: 1, id_empleado: 20230011, estado_matricula: 'Matriculado'},
          {id_programa_c: 1, id_empleado: 20240006, estado_matricula: 'Matriculado'},
          {id_programa_c: 1, id_empleado: 20240024, estado_matricula: 'Matriculado'},
          {id_programa_c: 1, id_empleado: 20240020, estado_matricula: 'Matriculado'},
          {id_programa_c: 1, id_empleado: 20240010, estado_matricula: 'Retirado'},
          {id_programa_c: 2, id_empleado: 20210002, estado_matricula: 'Matriculado'},
          {id_programa_c: 2, id_empleado: 20210005, estado_matricula: 'Matriculado'},
          {id_programa_c: 2, id_empleado: 20220001, estado_matricula: 'Matriculado'},
          {id_programa_c: 2, id_empleado: 20230008, estado_matricula: 'Matriculado'},
          {id_programa_c: 2, id_empleado: 20230009, estado_matricula: 'Matriculado'},
          {id_programa_c: 2, id_empleado: 20240002, estado_matricula: 'Matriculado'},
          {id_programa_c: 3, id_empleado: 20210004, estado_matricula: 'Matriculado'},
          {id_programa_c: 3, id_empleado: 20210006, estado_matricula: 'Matriculado'},
          {id_programa_c: 3, id_empleado: 20220002, estado_matricula: 'Matriculado'},
          {id_programa_c: 3, id_empleado: 20230010, estado_matricula: 'Matriculado'}
        ] AS row
        MATCH (p:Programa_Capacitador {id_programa_c: row.id_programa_c}), (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (e)-[:MATRICULADO_EN {estado_matricula: row.estado_matricula}]->(p);
        
        UNWIND [
          {id_sesion: 1, estado: 'Completa', fecha: date('2021-01-01'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 2, estado: 'Completa', fecha: date('2021-01-08'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 3, estado: 'Completa', fecha: date('2021-01-15'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 4, estado: 'Completa', fecha: date('2021-01-22'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 5, estado: 'Completa', fecha: date('2021-01-29'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 6, estado: 'Completa', fecha: date('2021-02-05'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 7, estado: 'Completa', fecha: date('2021-02-12'), hora: time('17:30:00'), id_programa_c: 1},
          {id_sesion: 8, estado: 'Completa', fecha: date('2021-03-15'), hora: time('20:00:00'), id_programa_c: 2},
          {id_sesion: 9, estado: 'Completa', fecha: date('2021-03-29'), hora: time('20:00:00'), id_programa_c: 2},
          {id_sesion: 10, estado: 'Completa', fecha: date('2021-04-13'), hora: time('20:00:00'), id_programa_c: 2},
          {id_sesion: 11, estado: 'Completa', fecha: date('2021-04-27'), hora: time('20:00:00'), id_programa_c: 2},
          {id_sesion: 12, estado: 'Completa', fecha: date('2021-05-11'), hora: time('20:00:00'), id_programa_c: 2},
          {id_sesion: 13, estado: 'Completa', fecha: date('2021-08-01'), hora: time('08:00:00'), id_programa_c: 3},
          {id_sesion: 14, estado: 'Completa', fecha: date('2021-09-01'), hora: time('08:00:00'), id_programa_c: 3},
          {id_sesion: 15, estado: 'Completa', fecha: date('2021-10-01'), hora: time('08:00:00'), id_programa_c: 3},
          {id_sesion: 16, estado: 'Completa', fecha: date('2021-11-01'), hora: time('08:00:00'), id_programa_c: 3},
          {id_sesion: 17, estado: 'Completa', fecha: date('2022-01-15'), hora: time('09:00:00'), id_programa_c: 4},
          {id_sesion: 18, estado: 'Completa', fecha: date('2022-01-29'), hora: time('09:00:00'), id_programa_c: 4},
          {id_sesion: 19, estado: 'Completa', fecha: date('2022-02-12'), hora: time('09:00:00'), id_programa_c: 4},
          {id_sesion: 20, estado: 'Completa', fecha: date('2022-09-15'), hora: time('20:00:00'), id_programa_c: 5},
          {id_sesion: 21, estado: 'Completa', fecha: date('2022-11-15'), hora: time('20:00:00'), id_programa_c: 5},
          {id_sesion: 22, estado: 'Completa', fecha: date('2023-03-01'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 23, estado: 'Completa', fecha: date('2023-03-15'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 24, estado: 'Completa', fecha: date('2023-04-01'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 25, estado: 'Completa', fecha: date('2023-04-15'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 26, estado: 'Completa', fecha: date('2023-05-01'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 27, estado: 'Completa', fecha: date('2023-05-15'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 28, estado: 'Completa', fecha: date('2023-05-31'), hora: time('08:00:00'), id_programa_c: 6},
          {id_sesion: 29, estado: 'Completa', fecha: date('2023-10-01'), hora: time('08:00:00'), id_programa_c: 7},
          {id_sesion: 30, estado: 'Completa', fecha: date('2023-11-01'), hora: time('08:00:00'), id_programa_c: 7},
          {id_sesion: 31, estado: 'Completa', fecha: date('2024-01-15'), hora: time('16:00:00'), id_programa_c: 8},
          {id_sesion: 32, estado: 'Completa', fecha: date('2024-01-30'), hora: time('16:00:00'), id_programa_c: 8},
          {id_sesion: 33, estado: 'Completa', fecha: date('2024-02-15'), hora: time('16:00:00'), id_programa_c: 8}
        ] AS row
        CREATE (s:Sesion {
          id_sesion: row.id_sesion, 
          estado: row.estado, 
          fecha: row.fecha, 
          hora: row.hora
        })
        WITH s, row
        MATCH (p:Programa_Capacitador {id_programa_c: row.id_programa_c})
        CREATE (s)-[:PERTENECE_A]->(p);
        
        UNWIND [
          {id_sesion: 1, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 1, id_empleado: 20240006, estado_asistencia: 'Falto'},
          {id_sesion: 1, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 1, id_empleado: 20240021, estado_asistencia: 'Falto'},
          {id_sesion: 2, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 2, id_empleado: 20240006, estado_asistencia: 'Asistio'},
          {id_sesion: 2, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 2, id_empleado: 20240021, estado_asistencia: 'Asistio'},
          {id_sesion: 3, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 3, id_empleado: 20240006, estado_asistencia: 'Asistio'},
          {id_sesion: 3, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 3, id_empleado: 20240021, estado_asistencia: 'Falto'},
          {id_sesion: 4, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 4, id_empleado: 20240006, estado_asistencia: 'Asistio'},
          {id_sesion: 4, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 4, id_empleado: 20240021, estado_asistencia: 'Asistio'},
          {id_sesion: 5, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 5, id_empleado: 20240006, estado_asistencia: 'Falto'},
          {id_sesion: 5, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 5, id_empleado: 20240021, estado_asistencia: 'Falto'},
          {id_sesion: 6, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 6, id_empleado: 20240006, estado_asistencia: 'Asistio'},
          {id_sesion: 6, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 6, id_empleado: 20240021, estado_asistencia: 'Asistio'},
          {id_sesion: 7, id_empleado: 20230011, estado_asistencia: 'Asistio'},
          {id_sesion: 7, id_empleado: 20240006, estado_asistencia: 'Falto'},
          {id_sesion: 7, id_empleado: 20240024, estado_asistencia: 'Asistio'},
          {id_sesion: 7, id_empleado: 20240021, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20210002, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20210005, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20220001, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20230008, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20230009, estado_asistencia: 'Asistio'},
          {id_sesion: 8, id_empleado: 20240002, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20210002, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20210005, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20220001, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20230008, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20230009, estado_asistencia: 'Asistio'},
          {id_sesion: 9, id_empleado: 20240002, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20210002, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20210005, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20220001, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20230008, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20230009, estado_asistencia: 'Asistio'},
          {id_sesion: 10, id_empleado: 20240002, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20210002, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20210005, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20220001, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20230008, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20230009, estado_asistencia: 'Asistio'},
          {id_sesion: 11, id_empleado: 20240002, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20210002, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20210005, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20220001, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20230008, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20230009, estado_asistencia: 'Asistio'},
          {id_sesion: 12, id_empleado: 20240002, estado_asistencia: 'Asistio'},
          {id_sesion: 13, id_empleado: 20210004, estado_asistencia: 'Asistio'},
          {id_sesion: 13, id_empleado: 20210006, estado_asistencia: 'Asistio'},
          {id_sesion: 13, id_empleado: 20220002, estado_asistencia: 'Asistio'},
          {id_sesion: 13, id_empleado: 20230010, estado_asistencia: 'Asistio'},
          {id_sesion: 14, id_empleado: 20210004, estado_asistencia: 'Asistio'},
          {id_sesion: 14, id_empleado: 20210006, estado_asistencia: 'Asistio'},
          {id_sesion: 14, id_empleado: 20220002, estado_asistencia: 'Asistio'},
          {id_sesion: 14, id_empleado: 20230010, estado_asistencia: 'Asistio'},
          {id_sesion: 15, id_empleado: 20210004, estado_asistencia: 'Asistio'},
          {id_sesion: 15, id_empleado: 20210006, estado_asistencia: 'Asistio'},
          {id_sesion: 15, id_empleado: 20220002, estado_asistencia: 'Asistio'},
          {id_sesion: 15, id_empleado: 20230010, estado_asistencia: 'Asistio'},
          {id_sesion: 16, id_empleado: 20210004, estado_asistencia: 'Asistio'},
          {id_sesion: 16, id_empleado: 20210006, estado_asistencia: 'Asistio'},
          {id_sesion: 16, id_empleado: 20220002, estado_asistencia: 'Asistio'},
          {id_sesion: 16, id_empleado: 20230010, estado_asistencia: 'Asistio'}
        ] AS row
        MATCH (s:Sesion {id_sesion: row.id_sesion}), (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (e)-[:ASISTE_A {estado_asistencia: row.estado_asistencia}]->(s);
        
        
        UNWIND [
          {id_evaluacion: 1, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 2, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 3, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 4, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 5, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 6, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 7, duracion_evaluacion: 1, hora: time('19:00:00'), id_instructor: 20210003},
          {id_evaluacion: 8, duracion_evaluacion: 2, hora: time('22:00:00'), id_instructor: 20210006},
          {id_evaluacion: 9, duracion_evaluacion: 2, hora: time('22:00:00'), id_instructor: 20210006},
          {id_evaluacion: 10, duracion_evaluacion: 2, hora: time('22:00:00'), id_instructor: 20210006},
          {id_evaluacion: 11, duracion_evaluacion: 2, hora: time('22:00:00'), id_instructor: 20210006},
          {id_evaluacion: 12, duracion_evaluacion: 2, hora: time('22:00:00'), id_instructor: 20210006},
          {id_evaluacion: 13, duracion_evaluacion: 1, hora: time('10:00:00'), id_instructor: 20210003},
          {id_evaluacion: 14, duracion_evaluacion: 1, hora: time('10:00:00'), id_instructor: 20210003},
          {id_evaluacion: 15, duracion_evaluacion: 1, hora: time('10:00:00'), id_instructor: 20210003},
          {id_evaluacion: 16, duracion_evaluacion: 1, hora: time('10:00:00'), id_instructor: 20210003}
        ] AS row
        CREATE (ec:Evaluacion_Capacitacion {
          id_evaluacion: row.id_evaluacion, 
          duracion_evaluacion: row.duracion_evaluacion, 
          hora: row.hora
        })
        WITH ec, row
        MATCH (e:Empleado {ID_Empleado: row.id_instructor})
        CREATE (ec)-[:DIRIGIDA_POR]->(e);
        
        UNWIND [
          {id_evaluacion: 1, id_sesion: 1, resultado: 'Satisfactorio'},
          {id_evaluacion: 2, id_sesion: 2, resultado: 'Regular'},
          {id_evaluacion: 3, id_sesion: 3, resultado: 'Deficiente'},
          {id_evaluacion: 4, id_sesion: 4, resultado: 'Satisfactorio'},
          {id_evaluacion: 5, id_sesion: 5, resultado: 'Satisfactorio'},
          {id_evaluacion: 6, id_sesion: 6, resultado: 'Regular'},
          {id_evaluacion: 7, id_sesion: 7, resultado: 'Satisfactorio'},
          {id_evaluacion: 8, id_sesion: 8, resultado: 'Satisfactorio'},
          {id_evaluacion: 9, id_sesion: 9, resultado: 'Regular'},
          {id_evaluacion: 10, id_sesion: 10, resultado: 'Satisfactorio'},
          {id_evaluacion: 11, id_sesion: 11, resultado: 'Regular'},
          {id_evaluacion: 12, id_sesion: 12, resultado: 'Satisfactorio'},
          {id_evaluacion: 13, id_sesion: 13, resultado: 'Deficiente'},
          {id_evaluacion: 14, id_sesion: 14, resultado: 'Satisfactorio'},
          {id_evaluacion: 15, id_sesion: 15, resultado: 'Regular'},
          {id_evaluacion: 16, id_sesion: 16, resultado: 'Satisfactorio'}
        ] AS row
        MATCH (ec:Evaluacion_Capacitacion {id_evaluacion: row.id_evaluacion}), (s:Sesion {id_sesion: row.id_sesion})
        CREATE (ec)-[:EVALUADA_EN {resultado: row.resultado}]->(s);
        
        UNWIND [
          {id_evaluacion: 1, id_empleado: 20230011, resultado: 'Satisfactorio'},
          {id_evaluacion: 1, id_empleado: 20240006, resultado: 'Satisfactorio'},
          {id_evaluacion: 1, id_empleado: 20240024, resultado: 'Satisfactorio'},
          {id_evaluacion: 1, id_empleado: 20240021, resultado: 'Satisfactorio'},
          {id_evaluacion: 2, id_empleado: 20230011, resultado: 'Satisfactorio'},
          {id_evaluacion: 2, id_empleado: 20240006, resultado: 'Regular'},
          {id_evaluacion: 2, id_empleado: 20240024, resultado: 'Regular'},
          {id_evaluacion: 2, id_empleado: 20240021, resultado: 'Deficiente'},
          {id_evaluacion: 3, id_empleado: 20230011, resultado: 'Deficiente'},
          {id_evaluacion: 3, id_empleado: 20240006, resultado: 'Regular'},
          {id_evaluacion: 3, id_empleado: 20240024, resultado: 'Regular'},
          {id_evaluacion: 3, id_empleado: 20240021, resultado: 'Deficiente'},
          {id_evaluacion: 4, id_empleado: 20230011, resultado: 'Satisfactorio'},
          {id_evaluacion: 4, id_empleado: 20240006, resultado: 'Satisfactorio'},
          {id_evaluacion: 4, id_empleado: 20240024, resultado: 'Regular'},
          {id_evaluacion: 4, id_empleado: 20240021, resultado: 'Satisfactorio'},
          {id_evaluacion: 5, id_empleado: 20230011, resultado: 'Regular'},
          {id_evaluacion: 5, id_empleado: 20240006, resultado: 'Satisfactorio'},
          {id_evaluacion: 5, id_empleado: 20240024, resultado: 'Satisfactorio'},
          {id_evaluacion: 5, id_empleado: 20240021, resultado: 'Satisfactorio'},
          {id_evaluacion: 6, id_empleado: 20230011, resultado: 'Regular'},
          {id_evaluacion: 6, id_empleado: 20240006, resultado: 'Regular'},
          {id_evaluacion: 6, id_empleado: 20240024, resultado: 'Satisfactorio'},
          {id_evaluacion: 6, id_empleado: 20240021, resultado: 'Regular'},
          {id_evaluacion: 7, id_empleado: 20230011, resultado: 'Satisfactorio'},
          {id_evaluacion: 7, id_empleado: 20240006, resultado: 'Satisfactorio'},
          {id_evaluacion: 7, id_empleado: 20240024, resultado: 'Regular'},
          {id_evaluacion: 7, id_empleado: 20240021, resultado: 'Satisfactorio'},
          {id_evaluacion: 8, id_empleado: 20210002, resultado: 'Satisfactorio'},
          {id_evaluacion: 8, id_empleado: 20210005, resultado: 'Regular'},
          {id_evaluacion: 8, id_empleado: 20220001, resultado: 'Satisfactorio'},
          {id_evaluacion: 8, id_empleado: 20230008, resultado: 'Deficiente'},
          {id_evaluacion: 8, id_empleado: 20230009, resultado: 'Satisfactorio'},
          {id_evaluacion: 8, id_empleado: 20240002, resultado: 'Regular'},
          {id_evaluacion: 9, id_empleado: 20210002, resultado: 'Regular'},
          {id_evaluacion: 9, id_empleado: 20210005, resultado: 'Deficiente'},
          {id_evaluacion: 9, id_empleado: 20220001, resultado: 'Satisfactorio'},
          {id_evaluacion: 9, id_empleado: 20230008, resultado: 'Regular'},
          {id_evaluacion: 9, id_empleado: 20230009, resultado: 'Regular'},
          {id_evaluacion: 9, id_empleado: 20240002, resultado: 'Deficiente'},
          {id_evaluacion: 10, id_empleado: 20210002, resultado: 'Regular'},
          {id_evaluacion: 10, id_empleado: 20210005, resultado: 'Satisfactorio'},
          {id_evaluacion: 10, id_empleado: 20220001, resultado: 'Satisfactorio'},
          {id_evaluacion: 10, id_empleado: 20230008, resultado: 'Satisfactorio'},
          {id_evaluacion: 10, id_empleado: 20230009, resultado: 'Regular'},
          {id_evaluacion: 10, id_empleado: 20240002, resultado: 'Regular'},
          {id_evaluacion: 11, id_empleado: 20210002, resultado: 'Deficiente'},
          {id_evaluacion: 11, id_empleado: 20210005, resultado: 'Regular'},
          {id_evaluacion: 11, id_empleado: 20220001, resultado: 'Satisfactorio'},
          {id_evaluacion: 11, id_empleado: 20230008, resultado: 'Deficiente'},
          {id_evaluacion: 11, id_empleado: 20230009, resultado: 'Deficiente'},
          {id_evaluacion: 11, id_empleado: 20240002, resultado: 'Regular'},
          {id_evaluacion: 12, id_empleado: 20210002, resultado: 'Satisfactorio'},
          {id_evaluacion: 12, id_empleado: 20210005, resultado: 'Regular'},
          {id_evaluacion: 12, id_empleado: 20220001, resultado: 'Regular'},
          {id_evaluacion: 12, id_empleado: 20230008, resultado: 'Satisfactorio'},
          {id_evaluacion: 12, id_empleado: 20230009, resultado: 'Regular'},
          {id_evaluacion: 12, id_empleado: 20240002, resultado: 'Satisfactorio'},
          {id_evaluacion: 13, id_empleado: 20210004, resultado: 'Deficiente'},
          {id_evaluacion: 13, id_empleado: 20210006, resultado: 'Deficiente'},
          {id_evaluacion: 13, id_empleado: 20220002, resultado: 'Deficiente'},
          {id_evaluacion: 13, id_empleado: 20230010, resultado: 'Regular'},
          {id_evaluacion: 14, id_empleado: 20210004, resultado: 'Satisfactorio'},
          {id_evaluacion: 14, id_empleado: 20210006, resultado: 'Satisfactorio'},
          {id_evaluacion: 14, id_empleado: 20220002, resultado: 'Regular'},
          {id_evaluacion: 14, id_empleado: 20230010, resultado: 'Regular'},
          {id_evaluacion: 15, id_empleado: 20210004, resultado: 'Regular'},
          {id_evaluacion: 15, id_empleado: 20210006, resultado: 'Regular'},
          {id_evaluacion: 15, id_empleado: 20220002, resultado: 'Deficiente'},
          {id_evaluacion: 15, id_empleado: 20230010, resultado: 'Satisfactorio'},
          {id_evaluacion: 16, id_empleado: 20210004, resultado: 'Satisfactorio'},
          {id_evaluacion: 16, id_empleado: 20210006, resultado: 'Satisfactorio'},
          {id_evaluacion: 16, id_empleado: 20220002, resultado: 'Satisfactorio'},
          {id_evaluacion: 16, id_empleado: 20230010, resultado: 'Satisfactorio'}
        ] AS row
        MATCH (ec:Evaluacion_Capacitacion {id_evaluacion: row.id_evaluacion}), (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (e)-[:EVALUADO_EN {resultado: row.resultado}]->(ec);
        
        UNWIND [
          {id_tipo: 1, nombre: 'Indemnización por despido', descripcion: 'Indemnización pagada al empleado por despido'},
          {id_tipo: 2, nombre: 'CTS', descripcion: 'Compensación por Tiempo de Servicio'},
          {id_tipo: 3, nombre: 'Pago de salario pendiente', descripcion: 'Salario pendiente de pago al empleado'},
          {id_tipo: 4, nombre: 'Pago de vacaciones no disfrutadas', descripcion: 'Pago por vacaciones no disfrutadas'},
          {id_tipo: 5, nombre: 'Deuda de empleado con la empresa', descripcion: 'Deuda que el empleado tiene con la empresa'}
        ] AS row
        CREATE (tc:Tipo_Cese {
          id_tipo: row.id_tipo,
          nombre: row.nombre,
          descripcion: row.descripcion
        });
        
        UNWIND [
          {id_cuestionario: 1, id_cese: 2},
          {id_cuestionario: 2, id_cese: 3}
        ] AS row
        CREATE (cs:Cuestionario_Salida {
          id_cuestionario: row.id_cuestionario
        })
        WITH cs, row
        MATCH (c:Cese {id_cese: row.id_cese})
        CREATE (cs)-[:RELACIONADO_CON]->(c);
        
        UNWIND [
          {id_cese: 1, tipo_cese: 'J', fecha_inicio_cese: date('2022-08-15'), id_empleado: 20240024, id_supervisor: 20220002, motivo_cese: null},
          {id_cese: 2, tipo_cese: 'C', fecha_inicio_cese: date('2022-07-15'), id_empleado: 20210009, id_supervisor: 20220002, motivo_cese: null},
          {id_cese: 3, tipo_cese: 'R', fecha_inicio_cese: date('2022-05-15'), id_empleado: 20240018, id_supervisor: 20220002, motivo_cese: null},
          {id_cese: 4, tipo_cese: 'D', fecha_inicio_cese: date('2022-04-15'), id_empleado: 20240004, id_supervisor: 20220002, motivo_cese: 'Urto'},
          {id_cese: 5, tipo_cese: 'R', fecha_inicio_cese: date('2022-03-15'), id_empleado: 20230014, id_supervisor: 20220002, motivo_cese: null},
          {id_cese: 6, tipo_cese: 'J', fecha_inicio_cese: date('2022-11-15'), id_empleado: 20220007, id_supervisor: 20220002, motivo_cese: null},
          {id_cese: 7, tipo_cese: 'C', fecha_inicio_cese: date('2022-11-15'), id_empleado: 20240016, id_supervisor: 20220002, motivo_cese: null}
        ] AS row
        CREATE (c:Cese {
          id_cese: row.id_cese, 
          tipo_cese: row.tipo_cese, 
          fecha_inicio_cese: row.fecha_inicio_cese, 
          motivo_cese: row.motivo_cese
        })
        WITH c, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado}), (s:Supervisor {id_supervisor: row.id_supervisor})
        CREATE (c)-[:CESADO]->(e), (s)-[:SUPERVISA_CESE]->(c);
        
        UNWIND [
          {id_pregunta: 1, pregunta_salida: '¿Que tal fue su experiencia en la empresa?', id_cuestionario: 1},
          {id_pregunta: 2, pregunta_salida: '¿Qué mejoraría en el trato a los empleados de la empresa?', id_cuestionario: 1},
          {id_pregunta: 3, pregunta_salida: '¿Cuál fue el motivo de su renuncia?', id_cuestionario: 1},
          {id_pregunta: 4, pregunta_salida: '¿Por qué trató de tomar pertenencias de la empresa?', id_cuestionario: 2}
        ] AS row
        CREATE (ps:Pregunta_Salida {
          id_pregunta: row.id_pregunta, 
          pregunta_salida: row.pregunta_salida
        })
        WITH ps, row
        MATCH (cs:Cuestionario_Salida {id_cuestionario: row.id_cuestionario})
        CREATE (ps)-[:PREGUNTA_DE]->(cs);
        
        UNWIND [
          {id_respuesta: 1, respuesta_salida: 'Buena', id_pregunta: 1},
          {id_respuesta: 2, respuesta_salida: 'Me gustaría que dieran más tiempo de refrigerio', id_pregunta: 2},
          {id_respuesta: 3, respuesta_salida: 'Me voy a ir del país', id_pregunta: 3},
          {id_respuesta: 4, respuesta_salida: 'Necesitaba el dinero', id_pregunta: 4}
        ] AS row
        CREATE (rs:Respuesta_Salida {
          id_respuesta: row.id_respuesta, 
          respuesta_salida: row.respuesta_salida
        })
        WITH rs, row
        MATCH (ps:Pregunta_Salida {id_pregunta: row.id_pregunta})
        CREATE (rs)-[:RESPONDE_A]->(ps);
        
        UNWIND [
          {id_beneficios: 1, id_tipo: 2, monto: 5674.12, id_cese: 2},
          {id_beneficios: 2, id_tipo: 5, monto: -3450.90, id_cese: 4}
        ] AS row
        CREATE (bc:Beneficios_Cese {
          id_beneficios: row.id_beneficios, 
          monto: row.monto
        })
        WITH bc, row
        MATCH (tc:Tipo_Cese {id_tipo: row.id_tipo}), (c:Cese {id_cese: row.id_cese})
        CREATE (bc)-[:TIPO_DE]->(tc), (bc)-[:ASOCIADO_A]->(c);
        
        UNWIND [
          {id_asistencia: 1, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-10'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20210001},
          {id_asistencia: 2, estado: 'En observación', observacion: 'Revisar código', fecha: date('2022-05-11'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20210002},
          {id_asistencia: 3, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-12'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20210003},
          {id_asistencia: 4, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-13'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20210004},
          {id_asistencia: 5, estado: 'En observación', observacion: 'Optimizar algoritmo', fecha: date('2022-05-14'), hora_entrada: time('09:00'), hora_salida: time('18:30'), id_empleado: 20210005},
          {id_asistencia: 6, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-16'), hora_entrada: time('09:00'), hora_salida: time('17:30'), id_empleado: 20210006},
          {id_asistencia: 7, estado: 'En observación', observacion: 'Revisión de seguridad', fecha: date('2022-05-17'), hora_entrada: time('08:30'), hora_salida: time('18:00'), id_empleado: 20210007},
          {id_asistencia: 8, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-18'), hora_entrada: time('10:30'), hora_salida: time('19:30'), id_empleado: 20210008},
          {id_asistencia: 9, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-05-19'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20210009},
          {id_asistencia: 10, estado: 'En observación', observacion: 'Optimizar consultas', fecha: date('2022-05-20'), hora_entrada: time('09:30'), hora_salida: time('18:30'), id_empleado: 20210010},
          {id_asistencia: 11, estado: 'En observación', observacion: 'Capacitación pendiente', fecha: date('2022-06-06'), hora_entrada: time('10:30'), hora_salida: time('19:00'), id_empleado: 20240001},
          {id_asistencia: 12, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-07'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20230002},
          {id_asistencia: 13, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-08'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20230005},
          {id_asistencia: 14, estado: 'En observación', observacion: 'Reunión externa', fecha: date('2022-06-09'), hora_entrada: time('11:00'), hora_salida: time('20:00'), id_empleado: 20230006},
          {id_asistencia: 15, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-10'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20230007},
          {id_asistencia: 16, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-11'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20230008},
          {id_asistencia: 17, estado: 'En observación', observacion: 'Optimizar consultas SQL', fecha: date('2022-06-12'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20230009},
          {id_asistencia: 18, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-13'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20230010},
          {id_asistencia: 19, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-14'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20230011},
          {id_asistencia: 20, estado: 'En observación', observacion: 'Revisión de seguridad', fecha: date('2022-06-15'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20230012},
          {id_asistencia: 21, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-16'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20230013},
          {id_asistencia: 22, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-17'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20230014},
          {id_asistencia: 23, estado: 'En observación', observacion: 'Optimizar consultas SQL', fecha: date('2022-06-18'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20230015},
          {id_asistencia: 24, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-19'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20220001},
          {id_asistencia: 25, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-20'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20220002},
          {id_asistencia: 26, estado: 'En observación', observacion: 'Reunión externa', fecha: date('2022-06-21'), hora_entrada: time('11:00'), hora_salida: time('20:00'), id_empleado: 20220003},
          {id_asistencia: 27, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-22'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20220004},
          {id_asistencia: 28, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-23'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20220005},
          {id_asistencia: 29, estado: 'En observación', observacion: 'Revisión de seguridad', fecha: date('2022-06-24'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20220006},
          {id_asistencia: 30, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-25'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20220007},
          {id_asistencia: 31, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-26'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240001},
          {id_asistencia: 32, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-27'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240002},
          {id_asistencia: 33, estado: 'En observación', observacion: 'Optimizar código', fecha: date('2022-06-28'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20240003},
          {id_asistencia: 34, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-29'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240004},
          {id_asistencia: 35, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-06-30'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20240005},
          {id_asistencia: 36, estado: 'En observación', observacion: 'Reunión de equipo', fecha: date('2022-07-01'), hora_entrada: time('11:00'), hora_salida: time('20:00'), id_empleado: 20240006},
          {id_asistencia: 37, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-02'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20240007},
          {id_asistencia: 38, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-03'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20240008},
          {id_asistencia: 39, estado: 'En observación', observacion: 'Revisión de seguridad', fecha: date('2022-07-04'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240009},
          {id_asistencia: 40, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-05'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20240010},
          {id_asistencia: 41, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-06'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240011},
          {id_asistencia: 42, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-07'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240012},
          {id_asistencia: 43, estado: 'En observación', observacion: 'Optimizar código', fecha: date('2022-07-08'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20240013},
          {id_asistencia: 44, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-07-09'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240013},
          {id_asistencia: 45, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-01'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240014},
          {id_asistencia: 46, estado: 'En observación', observacion: 'Optimizar código', fecha: date('2022-08-02'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20240015},
          {id_asistencia: 47, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-03'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240016},
          {id_asistencia: 48, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-04'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20240017},
          {id_asistencia: 49, estado: 'En observación', observacion: 'Reunión de equipo', fecha: date('2022-08-05'), hora_entrada: time('11:00'), hora_salida: time('20:00'), id_empleado: 20240018},
          {id_asistencia: 50, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-06'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20240019},
          {id_asistencia: 51, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-07'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240020},
          {id_asistencia: 52, estado: 'En observación', observacion: 'Optimizar consultas SQL', fecha: date('2022-08-08'), hora_entrada: time('08:00'), hora_salida: time('17:30'), id_empleado: 20240021},
          {id_asistencia: 53, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-09'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240022},
          {id_asistencia: 54, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-10'), hora_entrada: time('08:30'), hora_salida: time('17:00'), id_empleado: 20240023},
          {id_asistencia: 55, estado: 'En observación', observacion: 'Reunión de equipo', fecha: date('2022-08-11'), hora_entrada: time('11:00'), hora_salida: time('20:00'), id_empleado: 20240024},
          {id_asistencia: 56, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-19'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240014},
          {id_asistencia: 57, estado: 'En observación', observacion: 'Revisión de protocolos', fecha: date('2022-08-21'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20240034},
          {id_asistencia: 58, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-22'), hora_entrada: time('09:45'), hora_salida: time('18:15'), id_empleado: 20240004},
          {id_asistencia: 59, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-23'), hora_entrada: time('08:15'), hora_salida: time('17:45'), id_empleado: 20240005},
          {id_asistencia: 60, estado: 'En observación', observacion: 'Capacitación pendiente', fecha: date('2022-08-24'), hora_entrada: time('10:30'), hora_salida: time('19:00'), id_empleado: 20240006},
          {id_asistencia: 61, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-25'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240007},
          {id_asistencia: 62, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-26'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20240008},
          {id_asistencia: 63, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-27'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20240009},
          {id_asistencia: 64, estado: 'En observación', observacion: 'Actualización de equipo', fecha: date('2022-08-28'), hora_entrada: time('08:30'), hora_salida: time('17:30'), id_empleado: 20240010},
          {id_asistencia: 65, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-29'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240016},
          {id_asistencia: 66, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-08-30'), hora_entrada: time('09:30'), hora_salida: time('18:30'), id_empleado: 20240019},
          {id_asistencia: 67, estado: 'En observación', observacion: 'Revisión de protocolos', fecha: date('2022-08-31'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20240022},
          {id_asistencia: 68, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-01'), hora_entrada: time('09:45'), hora_salida: time('18:15'), id_empleado: 20240023},
          {id_asistencia: 69, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-02'), hora_entrada: time('08:15'), hora_salida: time('17:45'), id_empleado: 20240025},
          {id_asistencia: 70, estado: 'En observación', observacion: 'Capacitación pendiente', fecha: date('2022-09-03'), hora_entrada: time('10:30'), hora_salida: time('19:00'), id_empleado: 20240026},
          {id_asistencia: 71, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-04'), hora_entrada: time('09:30'), hora_salida: time('18:00'), id_empleado: 20240028},
          {id_asistencia: 72, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-05'), hora_entrada: time('08:00'), hora_salida: time('17:00'), id_empleado: 20240029},
          {id_asistencia: 73, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-06'), hora_entrada: time('09:00'), hora_salida: time('18:00'), id_empleado: 20240030},
          {id_asistencia: 74, estado: 'En observación', observacion: 'Actualización de equipo', fecha: date('2022-09-07'), hora_entrada: time('08:30'), hora_salida: time('17:30'), id_empleado: 20240031},
          {id_asistencia: 75, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-08'), hora_entrada: time('10:00'), hora_salida: time('19:00'), id_empleado: 20240034},
          {id_asistencia: 76, estado: 'En orden', observacion: 'Ninguna', fecha: date('2022-09-09'), hora_entrada: time('09:30'), hora_salida: time('18:30'), id_empleado: 20240037}
        ] AS row
        CREATE (a:Asistencia {
          id_asistencia: row.id_asistencia,
          estado: row.estado,
          observacion: row.observacion,
          fecha: row.fecha,
          hora_entrada: row.hora_entrada,
          hora_salida: row.hora_salida
        })
        WITH a, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado})
        CREATE (a)-[:PERTENECE_A]->(e);
        
        UNWIND [
          {id_licencia: 1, tipo: 'Sindical', estado: 'Aceptado', fecha_inicio: date('2021-03-12'), fecha_fin: date('2021-04-12'), id_empleado: 20240032, id_supervisor: 2},
          {id_licencia: 2, tipo: 'Por paternidad', estado: 'Aprobado', fecha_inicio: date('2020-06-15'), fecha_fin: date('2020-06-29'), id_empleado: 20210002, id_supervisor: 4},
          {id_licencia: 3, tipo: 'Por lactancia', estado: 'Rechazado', fecha_inicio: date('2021-07-01'), fecha_fin: date('2021-07-15'), id_empleado: 20210003, id_supervisor: 6},
          {id_licencia: 4, tipo: 'Por adopción', estado: 'Aprobado', fecha_inicio: date('2022-08-10'), fecha_fin: date('2022-08-24'), id_empleado: 20210004, id_supervisor: 5},
          {id_licencia: 5, tipo: 'Sindical', estado: 'Rechazado', fecha_inicio: date('2020-09-20'), fecha_fin: date('2020-10-05'), id_empleado: 20210005, id_supervisor: 9},
          {id_licencia: 6, tipo: 'Por familiares graves', estado: 'Aprobado', fecha_inicio: date('2021-11-11'), fecha_fin: date('2021-11-25'), id_empleado: 20210006, id_supervisor: 7},
          {id_licencia: 7, tipo: 'Comité SST', estado: 'Rechazado', fecha_inicio: date('2022-12-01'), fecha_fin: date('2022-12-15'), id_empleado: 20210007, id_supervisor: 8},
          {id_licencia: 8, tipo: 'Por asistencia médica a un familiar', estado: 'Aprobado', fecha_inicio: date('2020-01-16'), fecha_fin: date('2020-01-30'), id_empleado: 20210008, id_supervisor: 1},
          {id_licencia: 9, tipo: 'Por ser bombero voluntario', estado: 'Rechazado', fecha_inicio: date('2021-02-14'), fecha_fin: date('2021-02-28'), id_empleado: 20210009, id_supervisor: 5},
          {id_licencia: 10, tipo: 'Por maternidad', estado: 'Aprobado', fecha_inicio: date('2022-03-10'), fecha_fin: date('2022-03-24'), id_empleado: 20210010, id_supervisor: 3},
          {id_licencia: 11, tipo: 'Por paternidad', estado: 'Rechazado', fecha_inicio: date('2020-04-12'), fecha_fin: date('2020-04-26'), id_empleado: 20240001, id_supervisor: 6},
          {id_licencia: 12, tipo: 'Por lactancia', estado: 'Aprobado', fecha_inicio: date('2021-05-09'), fecha_fin: date('2021-05-23'), id_empleado: 20230002, id_supervisor: 9},
          {id_licencia: 13, tipo: 'Por adopción', estado: 'Rechazado', fecha_inicio: date('2022-06-07'), fecha_fin: date('2022-06-21'), id_empleado: 20230005, id_supervisor: 2},
          {id_licencia: 14, tipo: 'Sindical', estado: 'Aprobado', fecha_inicio: date('2020-07-05'), fecha_fin: date('2020-07-19'), id_empleado: 20230006, id_supervisor: 3},
          {id_licencia: 15, tipo: 'Por familiares graves', estado: 'Rechazado', fecha_inicio: date('2021-08-03'), fecha_fin: date('2021-08-17'), id_empleado: 20230007, id_supervisor: 9},
          {id_licencia: 16, tipo: 'Comité SST', estado: 'Aprobado', fecha_inicio: date('2022-09-01'), fecha_fin: date('2022-09-15'), id_empleado: 20230008, id_supervisor: 5},
          {id_licencia: 17, tipo: 'Por asistencia médica a un familiar', estado: 'Rechazado', fecha_inicio: date('2020-10-13'), fecha_fin: date('2020-10-27'), id_empleado: 20230009, id_supervisor: 6},
          {id_licencia: 18, tipo: 'Por ser bombero voluntario', estado: 'Aprobado', fecha_inicio: date('2021-11-11'), fecha_fin: date('2021-11-25'), id_empleado: 20230010, id_supervisor: 8},
          {id_licencia: 19, tipo: 'Por maternidad', estado: 'Rechazado', fecha_inicio: date('2022-12-09'), fecha_fin: date('2022-12-23'), id_empleado: 20230011, id_supervisor: 9},
          {id_licencia: 20, tipo: 'Por paternidad', estado: 'Aprobado', fecha_inicio: date('2020-02-14'), fecha_fin: date('2020-02-28'), id_empleado: 20230012, id_supervisor: 1}
        ] AS row
        CREATE (l:Licencia {
          id_licencia: row.id_licencia,
          tipo: row.tipo,
          estado: row.estado,
          fecha_inicio: row.fecha_inicio,
          fecha_fin: row.fecha_fin
        })
        WITH l, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado}), (s:Supervisor {id_supervisor: row.id_supervisor})
        CREATE (l)-[:OTORGADA_A]->(e), (s)-[:SUPERVISA_LICENCIA]->(l);
        
        UNWIND [
          {id_permiso: 1, tipo: 'Mudanza', motivo: 'Me mudo por motivos familiares', duracion: '10 días', estado: 'Aprobado', id_empleado: 20240023, id_supervisor: 7},
          {id_permiso: 2, tipo: 'Matrimonio', motivo: 'Casamiento con mi pareja de larga data', duracion: '15 días', estado: 'Aprobado', id_empleado: 20210001, id_supervisor: 4},
          {id_permiso: 3, tipo: 'Nacimiento de un familiar', motivo: 'Nacimiento de mi sobrino', duracion: '7 días', estado: 'Rechazado', id_empleado: 20210002, id_supervisor: 6},
          {id_permiso: 4, tipo: 'Fallecimiento de un familiar', motivo: 'Falleció mi abuelo', duracion: '5 días', estado: 'Aprobado', id_empleado: 20210003, id_supervisor: 5},
          {id_permiso: 5, tipo: 'Accidente de un familiar', motivo: 'Mi hermano tuvo un accidente', duracion: '20 días', estado: 'Rechazado', id_empleado: 20210004, id_supervisor: 9},
          {id_permiso: 6, tipo: 'Enfermedad grave de un familiar', motivo: 'Mi madre está gravemente enferma', duracion: '30 días', estado: 'Aprobado', id_empleado: 20210005, id_supervisor: 7},
          {id_permiso: 7, tipo: 'Deberes inexcusables', motivo: 'Debo asistir a una cita judicial', duracion: '3 días', estado: 'Rechazado', id_empleado: 20210006, id_supervisor: 8},
          {id_permiso: 8, tipo: 'Exámenes prenatales', motivo: 'Control prenatal de mi pareja', duracion: '1 día', estado: 'Aprobado', id_empleado: 20210007, id_supervisor: 1},
          {id_permiso: 9, tipo: 'Funciones sindicales', motivo: 'Participación en asamblea sindical', duracion: '2 días', estado: 'Rechazado', id_empleado: 20210008, id_supervisor: 5},
          {id_permiso: 10, tipo: 'Hijos prematuros', motivo: 'Cuidado de mi hijo prematuro', duracion: '25 días', estado: 'Aprobado', id_empleado: 20210009, id_supervisor: 3},
          {id_permiso: 11, tipo: 'Formación', motivo: 'Curso de actualización profesional', duracion: '10 días', estado: 'Rechazado', id_empleado: 20210010, id_supervisor: 6},
          {id_permiso: 12, tipo: 'Despido objetivo', motivo: 'Gestiones por despido', duracion: '14 días', estado: 'Aprobado', id_empleado: 20240001, id_supervisor: 9},
          {id_permiso: 13, tipo: 'Mudanza', motivo: 'Cambio de residencia por trabajo', duracion: '12 días', estado: 'Rechazado', id_empleado: 20230002, id_supervisor: 2},
          {id_permiso: 14, tipo: 'Matrimonio', motivo: 'Mi boda', duracion: '15 días', estado: 'Aprobado', id_empleado: 20230005, id_supervisor: 3},
          {id_permiso: 15, tipo: 'Nacimiento de un familiar', motivo: 'Nacimiento de mi hija', duracion: '7 días', estado: 'Rechazado', id_empleado: 20230006, id_supervisor: 9},
          {id_permiso: 16, tipo: 'Fallecimiento de un familiar', motivo: 'Falleció mi tío', duracion: '5 días', estado: 'Aprobado', id_empleado: 20230007, id_supervisor: 5},
          {id_permiso: 17, tipo: 'Accidente de un familiar', motivo: 'Mi prima sufrió un accidente', duracion: '20 días', estado: 'Rechazado', id_empleado: 20230008, id_supervisor: 6},
          {id_permiso: 18, tipo: 'Enfermedad grave de un familiar', motivo: 'Mi padre tiene una enfermedad grave', duracion: '30 días', estado: 'Aprobado', id_empleado: 20230009, id_supervisor: 8},
          {id_permiso: 19, tipo: 'Deberes inexcusables', motivo: 'Obligaciones legales imprevistas', duracion: '3 días', estado: 'Rechazado', id_empleado: 20230010, id_supervisor: 9},
          {id_permiso: 20, tipo: 'Exámenes prenatales', motivo: 'Exámenes prenatales de mi esposa', duracion: '1 día', estado: 'Aprobado', id_empleado: 20230011, id_supervisor: 1},
          {id_permiso: 21, tipo: 'Funciones sindicales', motivo: 'Reunión sindical importante', duracion: '2 días', estado: 'Rechazado', id_empleado: 20230012, id_supervisor: 1},
          {id_permiso: 22, tipo: 'Hijos prematuros', motivo: 'Atención a mi hijo recién nacido', duracion: '25 días', estado: 'Aprobado', id_empleado: 20230013, id_supervisor: 4},
          {id_permiso: 23, tipo: 'Formación', motivo: 'Seminario de desarrollo personal', duracion: '10 días', estado: 'Rechazado', id_empleado: 20230014, id_supervisor: 7},
          {id_permiso: 24, tipo: 'Despido objetivo', motivo: 'Proceso de despido laboral', duracion: '14 días', estado: 'Aprobado', id_empleado: 20230015, id_supervisor: 7},
          {id_permiso: 25, tipo: 'Mudanza', motivo: 'Relocalización por motivos de salud', duracion: '12 días', estado: 'Rechazado', id_empleado: 20220001, id_supervisor: 4}
        ] AS row
        CREATE (p:Permiso {
          id_permiso: row.id_permiso,
          tipo: row.tipo,
          motivo: row.motivo,
          duracion: row.duracion,
          estado: row.estado
        })
        WITH p, row
        MATCH (e:Empleado {ID_Empleado: row.id_empleado}), (s:Supervisor {id_supervisor: row.id_supervisor})
        CREATE (p)-[:OTORGADO_A]->(e), (s)-[:SUPERVISA_PERMISO]->(p);
        UNWIND [
          {ID_Tipo_Estado: 1, Tipo: 'Enviado'},
          {ID_Tipo_Estado: 2, Tipo: 'No enviado'},
          {ID_Tipo_Estado: 3, Tipo: 'Aprobado'},
          {ID_Tipo_Estado: 4, Tipo: 'No aprobado'},
          {ID_Tipo_Estado: 5, Tipo: 'En espera'}
        ] AS row
        CREATE (:Tipo_Estado {
          ID_Tipo_Estado: row.ID_Tipo_Estado,
          Tipo: row.Tipo
        });
        UNWIND [
          {ID_Tipo_Cuestionario: 1, Tipo: 'Subordinados'},
          {ID_Tipo_Cuestionario: 2, Tipo: 'Supervisores'},
          {ID_Tipo_Cuestionario: 3, Tipo: 'Jefes'},
          {ID_Tipo_Cuestionario: 4, Tipo: 'Gerentes'}
        ] AS row
        CREATE (:Tipo_Cuestionario {
          ID_Tipo_Cuestionario: row.ID_Tipo_Cuestionario,
          Tipo: row.Tipo
        });
         UNWIND [
          {ID_Tipo_Respuesta: 1, Tipo: 'Muy Negativo'},
          {ID_Tipo_Respuesta: 2, Tipo: 'Negativo'},
          {ID_Tipo_Respuesta: 3, Tipo: 'Positivo'},
          {ID_Tipo_Respuesta: 4, Tipo: 'Muy Positivo'}
        ] AS row
        CREATE (:Tipo_Respuesta {
          ID_Tipo_Respuesta: row.ID_Tipo_Respuesta,
          Tipo: row.Tipo
        });
        UNWIND [
          {ID_Cuestionario: 1, ID_Especialista_Relaciones_Laborales: 20210006, ID_Tipo_Cuestionario: 1, Fecha_Creacion: date('2024-04-18'), Hora_Creacion: time('18:30'), ID_Estado_Envio: 1, Fecha_Envio_Gerencia: date('2024-05-18'), Hora_Envio_Gerencia: time('15:25'), ID_Gerente: 20200001, ID_Estado_Aprobacion: 3, Fecha_Revision: date('2024-05-19'), Hora_Revision: time('18:30')},
          {ID_Cuestionario: 2, ID_Especialista_Relaciones_Laborales: 20210008, ID_Tipo_Cuestionario: 2, Fecha_Creacion: date('2024-04-18'), Hora_Creacion: time('17:30'), ID_Estado_Envio: 1, Fecha_Envio_Gerencia: date('2024-05-18'), Hora_Envio_Gerencia: time('17:20'), ID_Gerente: 20200001, ID_Estado_Aprobacion: 3, Fecha_Revision: date('2024-05-19'), Hora_Revision: time('20:30')},
          {ID_Cuestionario: 3, ID_Especialista_Relaciones_Laborales: 20220004, ID_Tipo_Cuestionario: 3, Fecha_Creacion: date('2024-04-18'), Hora_Creacion: time('16:30'), ID_Estado_Envio: 1, Fecha_Envio_Gerencia: date('2024-05-18'), Hora_Envio_Gerencia: time('18:35'), ID_Gerente: 20200001, ID_Estado_Aprobacion: 3, Fecha_Revision: date('2024-05-19'), Hora_Revision: time('21:30')},
          {ID_Cuestionario: 4, ID_Especialista_Relaciones_Laborales: 20230006, ID_Tipo_Cuestionario: 4, Fecha_Creacion: date('2024-04-18'), Hora_Creacion: time('19:30'), ID_Estado_Envio: 1, Fecha_Envio_Gerencia: date('2024-05-18'), Hora_Envio_Gerencia: time('19:55'), ID_Gerente: 20200001, ID_Estado_Aprobacion: 3, Fecha_Revision: date('2024-05-19'), Hora_Revision: time('22:30')}
        ] AS row
        CREATE (c:Cuestionario {
          ID_Cuestionario: row.ID_Cuestionario,
          Fecha_Creacion: row.Fecha_Creacion,
          Hora_Creacion: row.Hora_Creacion,
          Fecha_Envio_Gerencia: row.Fecha_Envio_Gerencia,
          Hora_Envio_Gerencia: row.Hora_Envio_Gerencia,
          Fecha_Revision: row.Fecha_Revision,
          Hora_Revision: row.Hora_Revision
        })
        WITH c, row
        MATCH (e:Empleado {ID_Empleado: row.ID_Especialista_Relaciones_Laborales}), (t:Tipo_Cuestionario {ID_Tipo_Cuestionario: row.ID_Tipo_Cuestionario}), (g:Empleado {ID_Empleado: row.ID_Gerente}), (es:Tipo_Estado {ID_Tipo_Estado: row.ID_Estado_Envio}), (ea:Tipo_Estado {ID_Tipo_Estado: row.ID_Estado_Aprobacion})
        CREATE (c)-[:CREADO_POR]->(e), (c)-[:TIENE_TIPO]->(t), (c)-[:ENVIO]->(es), (c)-[:APROBACION]->(ea), (c)-[:GERENTE]->(g);
        UNWIND [
          {ID_Pregunta: 1, ID_Cuestionario: 1, Enunciado_Pregunta: '¿Cómo calificarías tu nivel de satisfacción en el trabajo?'},
          {ID_Pregunta: 2, ID_Cuestionario: 1, Enunciado_Pregunta: '¿Cómo valoras la efectividad de la retroalimentación que recibes para mejorar tu desempeño laboral?'},
          {ID_Pregunta: 3, ID_Cuestionario: 2, Enunciado_Pregunta: '¿Cómo calificarías la efectividad de tu estilo de liderazgo en el rendimiento del equipo?'},
          {ID_Pregunta: 4, ID_Cuestionario: 2, Enunciado_Pregunta: '¿Cómo valorarías el ambiente de trabajo colaborativo y respetuoso que fomentas dentro de tu equipo?'},
          {ID_Pregunta: 5, ID_Cuestionario: 3, Enunciado_Pregunta: '¿Qué calificación le darías a tu visión para el equipo/departamento/empresa a corto y largo plazo?'},
          {ID_Pregunta: 6, ID_Cuestionario: 3, Enunciado_Pregunta: '¿Qué calificación le darías a la efectividad de tu comunicación con los miembros del equipo?'},
          {ID_Pregunta: 7, ID_Cuestionario: 4, Enunciado_Pregunta: '¿Cómo calificarías tu capacidad para asegurarte de que las actividades del equipo estén alineadas con los objetivos organizacionales?'},
          {ID_Pregunta: 8, ID_Cuestionario: 4, Enunciado_Pregunta: '¿Qué calificación le darías a la cultura organizacional positiva y de alto rendimiento que fomentas?'}
        ] AS row
        CREATE (p:Pregunta_Cuestionario {
          ID_Pregunta: row.ID_Pregunta,
          Enunciado_Pregunta: row.Enunciado_Pregunta
        })
        WITH p, row
        MATCH (c:Cuestionario {ID_Cuestionario: row.ID_Cuestionario})
        CREATE (p)-[:PERTENECE_A]->(c);
        UNWIND [
          {ID_Cuestionario_Empleado: 1, ID_Empleado: 20210005, ID_Cuestionario: 1, Fecha_Rellenado: date('2024-06-15'), Hora_Rellenado: time('15:30')},
          {ID_Cuestionario_Empleado: 2, ID_Empleado: 20210009, ID_Cuestionario: 2, Fecha_Rellenado: date('2024-06-17'), Hora_Rellenado: time('18:30')},
          {ID_Cuestionario_Empleado: 3, ID_Empleado: 20210002, ID_Cuestionario: 3, Fecha_Rellenado: date('2024-06-14'), Hora_Rellenado: time('19:30')},
          {ID_Cuestionario_Empleado: 4, ID_Empleado: 20200001, ID_Cuestionario: 4, Fecha_Rellenado: date('2024-06-13'), Hora_Rellenado: time('12:30')},
          {ID_Cuestionario_Empleado: 5, ID_Empleado: 20220006, ID_Cuestionario: 1, Fecha_Rellenado: date('2024-06-15'), Hora_Rellenado: time('17:30')},
          {ID_Cuestionario_Empleado: 6, ID_Empleado: 20220005, ID_Cuestionario: 2, Fecha_Rellenado: date('2024-06-17'), Hora_Rellenado: time('11:30')},
          {ID_Cuestionario_Empleado: 7, ID_Empleado: 20210007, ID_Cuestionario: 3, Fecha_Rellenado: date('2024-06-14'), Hora_Rellenado: time('20:30')}
        ] AS row
        CREATE (ce:Cuestionario_Empleado {
          ID_Cuestionario_Empleado: row.ID_Cuestionario_Empleado,
          Fecha_Rellenado: row.Fecha_Rellenado,
          Hora_Rellenado: row.Hora_Rellenado
        })
        WITH ce, row
        MATCH (e:Empleado {ID_Empleado: row.ID_Empleado}), (c:Cuestionario {ID_Cuestionario: row.ID_Cuestionario})
        CREATE (ce)-[:RELLENADO_POR]->(e), (ce)-[:PERTENECE_A]->(c);
        UNWIND [
          {ID_Respuesta: 1, ID_Pregunta: 1, ID_Cuestionario_Empleado: 1, ID_Tipo_Respuesta: 3},
          {ID_Respuesta: 2, ID_Pregunta: 2, ID_Cuestionario_Empleado: 1, ID_Tipo_Respuesta: 1},
          {ID_Respuesta: 3, ID_Pregunta: 3, ID_Cuestionario_Empleado: 2, ID_Tipo_Respuesta: 4},
          {ID_Respuesta: 4, ID_Pregunta: 4, ID_Cuestionario_Empleado: 2, ID_Tipo_Respuesta: 1},
          {ID_Respuesta: 5, ID_Pregunta: 5, ID_Cuestionario_Empleado: 3, ID_Tipo_Respuesta: 3},
          {ID_Respuesta: 6, ID_Pregunta: 6, ID_Cuestionario_Empleado: 3, ID_Tipo_Respuesta: 4},
          {ID_Respuesta: 7, ID_Pregunta: 7, ID_Cuestionario_Empleado: 4, ID_Tipo_Respuesta: 2},
          {ID_Respuesta: 8, ID_Pregunta: 8, ID_Cuestionario_Empleado: 4, ID_Tipo_Respuesta: 4},
          {ID_Respuesta: 9, ID_Pregunta: 1, ID_Cuestionario_Empleado: 5, ID_Tipo_Respuesta: 2},
          {ID_Respuesta: 10, ID_Pregunta: 2, ID_Cuestionario_Empleado: 5, ID_Tipo_Respuesta: 4},
          {ID_Respuesta: 11, ID_Pregunta: 3, ID_Cuestionario_Empleado: 6, ID_Tipo_Respuesta: 3},
          {ID_Respuesta: 12, ID_Pregunta: 4, ID_Cuestionario_Empleado: 6, ID_Tipo_Respuesta: 1},
          {ID_Respuesta: 13, ID_Pregunta: 5, ID_Cuestionario_Empleado: 7, ID_Tipo_Respuesta: 3},
          {ID_Respuesta: 14, ID_Pregunta: 6, ID_Cuestionario_Empleado: 7, ID_Tipo_Respuesta: 3}
        ] AS row
        CREATE (r:Respuesta_Cuestionario {
          ID_Respuesta: row.ID_Respuesta
        })
        WITH r, row
        MATCH (p:Pregunta_Cuestionario {ID_Pregunta: row.ID_Pregunta}), (ce:Cuestionario_Empleado {ID_Cuestionario_Empleado: row.ID_Cuestionario_Empleado}), (tr:Tipo_Respuesta {ID_Tipo_Respuesta: row.ID_Tipo_Respuesta})
        CREATE (r)-[:RESPUESTA_A]->(p), (r)-[:RESPONDIDO_POR]->(ce), (r)-[:TIENE_TIPO]->(tr);
        UNWIND [
          {ID_Reporte: 1, ID_Cuestionario_Empleado: 1, Fecha_Ingreso_Empleado: date('2024-01-15'), Calificacion_Empleado: 3},
          {ID_Reporte: 2, ID_Cuestionario_Empleado: 2, Fecha_Ingreso_Empleado: date('2023-05-12'), Calificacion_Empleado: 2},
          {ID_Reporte: 3, ID_Cuestionario_Empleado: 3, Fecha_Ingreso_Empleado: date('2023-08-11'), Calificacion_Empleado: 2},
          {ID_Reporte: 4, ID_Cuestionario_Empleado: 4, Fecha_Ingreso_Empleado: date('2023-09-16'), Calificacion_Empleado: 2},
          {ID_Reporte: 5, ID_Cuestionario_Empleado: 5, Fecha_Ingreso_Empleado: date('2023-05-14'), Calificacion_Empleado: 3},
          {ID_Reporte: 6, ID_Cuestionario_Empleado: 6, Fecha_Ingreso_Empleado: date('2023-07-13'), Calificacion_Empleado: 3},
          {ID_Reporte: 7, ID_Cuestionario_Empleado: 7, Fecha_Ingreso_Empleado: date('2023-12-21'), Calificacion_Empleado: 2}
        ] AS row
        CREATE (r:Reporte {
          ID_Reporte: row.ID_Reporte,
          Fecha_Ingreso_Empleado: row.Fecha_Ingreso_Empleado
        })
        WITH r, row
        MATCH (ce:Cuestionario_Empleado {ID_Cuestionario_Empleado: row.ID_Cuestionario_Empleado}), (tr:Tipo_Respuesta {ID_Tipo_Respuesta: row.Calificacion_Empleado})
        CREATE (r)-[:RELACIONADO_A]->(ce), (r)-[:TIENE_CALIFICACION]->(tr);
        UNWIND [
          {ID_Retroalimentacion: 1, ID_Reporte: 1, Enunciado_Retroalimentacion: 'Falta mejorar algunos puntos en el trabajo.', ID_Evaluador: 20230012, Fecha_Retroalimentacion: date('2024-06-21'), Hora_Retroalimentacion: time('18:30')},
          {ID_Retroalimentacion: 2, ID_Reporte: 2, Enunciado_Retroalimentacion: 'Debes pulir algunos detalles.', ID_Evaluador: 20200001, Fecha_Retroalimentacion: date('2024-06-21'), Hora_Retroalimentacion: time('18:30')},
          {ID_Retroalimentacion: 3, ID_Reporte: 3, Enunciado_Retroalimentacion: 'Se pueden hacer mejoras en ciertos aspectos.', ID_Evaluador: 20200001, Fecha_Retroalimentacion: date('2024-06-21'), Hora_Retroalimentacion: time('18:30')},
          {ID_Retroalimentacion: 4, ID_Reporte: 4, Enunciado_Retroalimentacion: 'Algunos puntos necesitan ser perfeccionados.', ID_Evaluador: 20210008, Fecha_Retroalimentacion: date('2024-06-22'), Hora_Retroalimentacion: time('15:30')},
          {ID_Retroalimentacion: 5, ID_Reporte: 5, Enunciado_Retroalimentacion: 'Se deben abordar algunas deficiencias.', ID_Evaluador: 20230006, Fecha_Retroalimentacion: date('2024-06-22'), Hora_Retroalimentacion: time('19:30')},
          {ID_Retroalimentacion: 6, ID_Reporte: 6, Enunciado_Retroalimentacion: 'Es necesario afinar ciertos aspectos.', ID_Evaluador: 20240027, Fecha_Retroalimentacion: date('2024-06-22'), Hora_Retroalimentacion: time('20:30')},
          {ID_Retroalimentacion: 7, ID_Reporte: 7, Enunciado_Retroalimentacion: 'Se pueden hacer mejoras en ciertos aspectos.', ID_Evaluador: 20240027, Fecha_Retroalimentacion: date('2024-06-22'), Hora_Retroalimentacion: time('20:30')}
        ] AS row
        CREATE (r:Retroalimentacion {
          ID_Retroalimentacion: row.ID_Retroalimentacion,
          Enunciado_Retroalimentacion: row.Enunciado_Retroalimentacion,
          Fecha_Retroalimentacion: row.Fecha_Retroalimentacion,
          Hora_Retroalimentacion: row.Hora_Retroalimentacion
        })
        WITH r, row
        MATCH (re:Reporte {ID_Reporte: row.ID_Reporte}), (e:Empleado {ID_Empleado: row.ID_Evaluador})
        CREATE (r)-[:RELACIONADO_A]->(re), (r)-[:EVALUADO_POR]->(e);
        UNWIND [
          {ID_Reunion: 1, ID_Organizador: 20200001, Asunto_Reunion: 'Explicación de la evaluación de desempeño', Fecha_Reunion: date('2024-06-12'), Hora_Reunion: time('15:30')},
          {ID_Reunion: 2, ID_Organizador: 20210003, Asunto_Reunion: 'Retroalimentación general', Fecha_Reunion: date('2024-06-20'), Hora_Reunion: time('18:30')},
          {ID_Reunion: 3, ID_Organizador: 20230006, Asunto_Reunion: 'Evaluación técnica', Fecha_Reunion: date('2024-06-21'), Hora_Reunion: time('18:30')}
        ] AS row
        CREATE (r:Reunion {
          ID_Reunion: row.ID_Reunion,
          Asunto_Reunion: row.Asunto_Reunion,
          Fecha_Reunion: row.Fecha_Reunion,
          Hora_Reunion: row.Hora_Reunion
        })
        WITH r, row
        MATCH (e:Empleado {ID_Empleado: row.ID_Organizador})
        CREATE (r)-[:ORGANIZADA_POR]->(e);
        UNWIND [
          {ID_certificado: 301, Curso_certificado: 'Certificación en Gestión de Calidad ISO 9001', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 302, Curso_certificado: 'Diplomado en Administración de Empresas', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 303, Curso_certificado: 'Certificado en Control de Calidad Alimentaria', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 304, Curso_certificado: 'Curso en Finanzas Corporativas', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 305, Curso_certificado: 'Certificación en Seguridad Alimentaria HACCP', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 306, Curso_certificado: 'Certificado en Desarrollo de Software', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 307, Curso_certificado: 'Curso en Logística y Distribución', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 308, Curso_certificado: 'Diplomado en Marketing Digital', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 309, Curso_certificado: 'Certificación en Contabilidad Financiera', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 310, Curso_certificado: 'Maestría en Recursos Humanos', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 311, Curso_certificado: 'Curso en Mantenimiento Industrial', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 312, Curso_certificado: 'Diplomado en Seguridad e Higiene Ocupacional', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 313, Curso_certificado: 'Certificado en Gestión Ambiental', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 314, Curso_certificado: 'Diplomado en Ingeniería Agroindustrial', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 315, Curso_certificado: 'Curso en Gestión de Almacenes', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 316, Curso_certificado: 'Certificación en Química Analítica', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 317, Curso_certificado: 'Curso en Tecnología de Alimentos', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 318, Curso_certificado: 'Diplomado en Producción de Frutas', Nivel_certificado: 'Intermedio'},
          {ID_certificado: 319, Curso_certificado: 'Certificado en Biología Molecular', Nivel_certificado: 'Avanzado'},
          {ID_certificado: 320, Curso_certificado: 'Maestría en Logística y Transporte', Nivel_certificado: 'Avanzado'}
        ] AS row
        CREATE (:Certificados {
          ID_certificado: row.ID_certificado,
          Curso_certificado: row.Curso_certificado,
          Nivel_certificado: row.Nivel_certificado
        });
        UNWIND [
          {ID_experiencia: 201, Nombre_lugar: 'Empresa A', Cargo_ejercido: 'Gerente de Producción', Tiempo_ejercido: '5 años'},
          {ID_experiencia: 202, Nombre_lugar: 'Empresa B', Cargo_ejercido: 'Jefe de Recepción', Tiempo_ejercido: '3 años'},
          {ID_experiencia: 203, Nombre_lugar: 'Empresa C', Cargo_ejercido: 'Especialista de Control de Calidad', Tiempo_ejercido: '4 años'},
          {ID_experiencia: 204, Nombre_lugar: 'Empresa D', Cargo_ejercido: 'Supervisor de Producción de Mermelada', Tiempo_ejercido: '6 años'},
          {ID_experiencia: 205, Nombre_lugar: 'Empresa E', Cargo_ejercido: 'Técnico de Producción de Fruta Confitada', Tiempo_ejercido: '2 años'},
          {ID_experiencia: 206, Nombre_lugar: 'Empresa F', Cargo_ejercido: 'Profesional de Investigación y Desarrollo', Tiempo_ejercido: '7 años'},
          {ID_experiencia: 207, Nombre_lugar: 'Empresa G', Cargo_ejercido: 'Asistente de Logística y Distribución', Tiempo_ejercido: '4 años'},
          {ID_experiencia: 208, Nombre_lugar: 'Empresa H', Cargo_ejercido: 'Operario de Marketing y Ventas', Tiempo_ejercido: '3 años'},
          {ID_experiencia: 209, Nombre_lugar: 'Empresa I', Cargo_ejercido: 'Gerente de Finanzas y Contabilidad', Tiempo_ejercido: '5 años'},
          {ID_experiencia: 210, Nombre_lugar: 'Empresa J', Cargo_ejercido: 'Jefe de Recursos Humanos', Tiempo_ejercido: '6 años'},
          {ID_experiencia: 211, Nombre_lugar: 'Empresa K', Cargo_ejercido: 'Especialista de Mantenimiento y Reparación de Equipos', Tiempo_ejercido: '4 años'},
          {ID_experiencia: 212, Nombre_lugar: 'Empresa L', Cargo_ejercido: 'Supervisor de Seguridad e Higiene', Tiempo_ejercido: '3 años'},
          {ID_experiencia: 213, Nombre_lugar: 'Empresa M', Cargo_ejercido: 'Técnico de Gestión Ambiental y Sostenibilidad', Tiempo_ejercido: '5 años'},
          {ID_experiencia: 214, Nombre_lugar: 'Empresa N', Cargo_ejercido: 'Profesional de Producción de Fruta Fresca', Tiempo_ejercido: '6 años'},
          {ID_experiencia: 215, Nombre_lugar: 'Empresa O', Cargo_ejercido: 'Asistente de Recepción y Almacenamiento de Fruta', Tiempo_ejercido: '4 años'},
          {ID_experiencia: 216, Nombre_lugar: 'Empresa P', Cargo_ejercido: 'Operario de Control de Calidad', Tiempo_ejercido: '3 años'},
          {ID_experiencia: 217, Nombre_lugar: 'Empresa Q', Cargo_ejercido: 'Gerente de Producción de Mermelada', Tiempo_ejercido: '5 años'},
          {ID_experiencia: 218, Nombre_lugar: 'Empresa R', Cargo_ejercido: 'Jefe de Producción de Fruta Confitada', Tiempo_ejercido: '4 años'},
          {ID_experiencia: 219, Nombre_lugar: 'Empresa S', Cargo_ejercido: 'Especialista de Investigación y Desarrollo', Tiempo_ejercido: '6 años'},
          {ID_experiencia: 220, Nombre_lugar: 'Empresa T', Cargo_ejercido: 'Supervisor de Logística y Distribución', Tiempo_ejercido: '3 años'}
        ] AS row
        CREATE (:Experiencia_Laboral {
          ID_experiencia: row.ID_experiencia,
          Nombre_lugar: row.Nombre_lugar,
          Cargo_ejercido: row.Cargo_ejercido,
          Tiempo_ejercido: row.Tiempo_ejercido
        });
        UNWIND [
          {ID_curriculum: 101, Grado_Educacion: 'Licenciatura en Ingeniería Industrial', ID_experiencia: 201, ID_certificado: 301},
          {ID_curriculum: 102, Grado_Educacion: 'Maestría en Administración de Empresas', ID_experiencia: 202, ID_certificado: 302},
          {ID_curriculum: 103, Grado_Educacion: 'Técnico en Control de Calidad', ID_experiencia: 203, ID_certificado: 303},
          {ID_curriculum: 104, Grado_Educacion: 'Licenciatura en Administración de Empresas', ID_experiencia: 204, ID_certificado: 304},
          {ID_curriculum: 105, Grado_Educacion: 'Técnico en Producción de Alimentos', ID_experiencia: 205, ID_certificado: 305},
          {ID_curriculum: 106, Grado_Educacion: 'Maestría en Ciencias de la Computación', ID_experiencia: 206, ID_certificado: 306},
          {ID_curriculum: 107, Grado_Educacion: 'Licenciatura en Logística', ID_experiencia: 207, ID_certificado: 307},
          {ID_curriculum: 108, Grado_Educacion: 'Técnico en Mercadotecnia', ID_experiencia: 208, ID_certificado: 308},
          {ID_curriculum: 109, Grado_Educacion: 'Licenciatura en Contaduría Pública', ID_experiencia: 209, ID_certificado: 309},
          {ID_curriculum: 110, Grado_Educacion: 'Maestría en Recursos Humanos', ID_experiencia: 210, ID_certificado: 310},
          {ID_curriculum: 111, Grado_Educacion: 'Técnico en Mantenimiento Industrial', ID_experiencia: 211, ID_certificado: 311},
          {ID_curriculum: 112, Grado_Educacion: 'Especialidad en Seguridad Laboral', ID_experiencia: 212, ID_certificado: 312},
          {ID_curriculum: 113, Grado_Educacion: 'Maestría en Gestión Ambiental', ID_experiencia: 213, ID_certificado: 313},
          {ID_curriculum: 114, Grado_Educacion: 'Licenciatura en Ingeniería Agroindustrial', ID_experiencia: 214, ID_certificado: 314},
          {ID_curriculum: 115, Grado_Educacion: 'Técnico en Almacenamiento y Distribución', ID_experiencia: 215, ID_certificado: 315},
          {ID_curriculum: 116, Grado_Educacion: 'Licenciatura en Química', ID_experiencia: 216, ID_certificado: 316},
          {ID_curriculum: 117, Grado_Educacion: 'Maestría en Producción de Alimentos', ID_experiencia: 217, ID_certificado: 317},
          {ID_curriculum: 118, Grado_Educacion: 'Técnico en Producción de Frutas', ID_experiencia: 218, ID_certificado: 318},
          {ID_curriculum: 119, Grado_Educacion: 'Licenciatura en Biología', ID_experiencia: 219, ID_certificado: 319},
          {ID_curriculum: 120, Grado_Educacion: 'Maestría en Logística y Transporte', ID_experiencia: 220, ID_certificado: 320}
        ] AS row
        CREATE (c:Curriculum {
          ID_curriculum: row.ID_curriculum,
          Grado_Educacion: row.Grado_Educacion
        })
        WITH c, row
        MATCH (e:Experiencia_Laboral {ID_experiencia: row.ID_experiencia}), (ce:Certificados {ID_certificado: row.ID_certificado})
        CREATE (c)-[:TIENE_EXPERIENCIA]->(e), (c)-[:TIENE_CERTIFICADO]->(ce);
        UNWIND [
          {ID_cand: '101', Nombre_cand: 'Juan', Apell_cand: 'González', Fecha_Nac_cand: date('1990-05-15'), Direccion_cand: 'Calle 123, Ciudad', Correo_cand: 'juan.gonzalez@example.com', Num_Telefono: '123-456-7890', ID_curriculum: 101},
          {ID_cand: '102', Nombre_cand: 'María', Apell_cand: 'López', Fecha_Nac_cand: date('1985-08-20'), Direccion_cand: 'Avenida XYZ, Ciudad', Correo_cand: 'maria.lopez@example.com', Num_Telefono: '234-567-8901', ID_curriculum: 102},
          {ID_cand: '103', Nombre_cand: 'Pedro', Apell_cand: 'Martínez', Fecha_Nac_cand: date('1992-03-10'), Direccion_cand: 'Carrera ABC, Ciudad', Correo_cand: 'pedro.martinez@example.com', Num_Telefono: '345-678-9012', ID_curriculum: 103},
          {ID_cand: '104', Nombre_cand: 'Ana', Apell_cand: 'Rodríguez', Fecha_Nac_cand: date('1988-11-25'), Direccion_cand: 'Calle 456, Ciudad', Correo_cand: 'ana.rodriguez@example.com', Num_Telefono: '456-789-0123', ID_curriculum: 104},
          {ID_cand: '105', Nombre_cand: 'Carlos', Apell_cand: 'Pérez', Fecha_Nac_cand: date('1991-07-02'), Direccion_cand: 'Avenida UVW, Ciudad', Correo_cand: 'carlos.perez@example.com', Num_Telefono: '567-890-1234', ID_curriculum: 105},
          {ID_cand: '106', Nombre_cand: 'Laura', Apell_cand: 'Sánchez', Fecha_Nac_cand: date('1987-09-18'), Direccion_cand: 'Carrera DEF, Ciudad', Correo_cand: 'laura.sanchez@example.com', Num_Telefono: '678-901-2345', ID_curriculum: 106},
          {ID_cand: '107', Nombre_cand: 'Daniel', Apell_cand: 'Gómez', Fecha_Nac_cand: date('1993-01-05'), Direccion_cand: 'Calle 789, Ciudad', Correo_cand: 'daniel.gomez@example.com', Num_Telefono: '789-012-3456', ID_curriculum: 107},
          {ID_cand: '108', Nombre_cand: 'Sofía', Apell_cand: 'Hernández', Fecha_Nac_cand: date('1989-06-30'), Direccion_cand: 'Avenida GHI, Ciudad', Correo_cand: 'sofia.hernandez@example.com', Num_Telefono: '890-123-4567', ID_curriculum: 108},
          {ID_cand: '109', Nombre_cand: 'Javier', Apell_cand: 'Díaz', Fecha_Nac_cand: date('1994-04-12'), Direccion_cand: 'Carrera JKL, Ciudad', Correo_cand: 'javier.diaz@example.com', Num_Telefono: '901-234-5678', ID_curriculum: 109},
          {ID_cand: '110', Nombre_cand: 'Paula', Apell_cand: 'Torres', Fecha_Nac_cand: date('1986-12-28'), Direccion_cand: 'Calle 012, Ciudad', Correo_cand: 'paula.torres@example.com', Num_Telefono: '012-345-6789', ID_curriculum: 110},
          {ID_cand: '111', Nombre_cand: 'Andrés', Apell_cand: 'Ruiz', Fecha_Nac_cand: date('1990-02-14'), Direccion_cand: 'Avenida MNO, Ciudad', Correo_cand: 'andres.ruiz@example.com', Num_Telefono: '123-456-7890', ID_curriculum: 111},
          {ID_cand: '112', Nombre_cand: 'Carmen', Apell_cand: 'García', Fecha_Nac_cand: date('1984-10-31'), Direccion_cand: 'Carrera PQR, Ciudad', Correo_cand: 'carmen.garcia@example.com', Num_Telefono: '234-567-8901', ID_curriculum: 112},
          {ID_cand: '113', Nombre_cand: 'Luis', Apell_cand: 'Vázquez', Fecha_Nac_cand: date('1995-07-17'), Direccion_cand: 'Calle 345, Ciudad', Correo_cand: 'luis.vazquez@example.com', Num_Telefono: '345-678-9012', ID_curriculum: 113},
          {ID_cand: '114', Nombre_cand: 'Marta', Apell_cand: 'Fernández', Fecha_Nac_cand: date('1983-03-04'), Direccion_cand: 'Avenida STU, Ciudad', Correo_cand: 'marta.fernandez@example.com', Num_Telefono: '456-789-0123', ID_curriculum: 114},
          {ID_cand: '115', Nombre_cand: 'Diego', Apell_cand: 'Ortega', Fecha_Nac_cand: date('1988-05-22'), Direccion_cand: 'Carrera VWX, Ciudad', Correo_cand: 'diego.ortega@example.com', Num_Telefono: '567-890-1234', ID_curriculum: 115},
          {ID_cand: '116', Nombre_cand: 'Elena', Apell_cand: 'Núñez', Fecha_Nac_cand: date('1992-09-09'), Direccion_cand: 'Calle 678, Ciudad', Correo_cand: 'elena.nunez@example.com', Num_Telefono: '678-901-2345', ID_curriculum: 116},
          {ID_cand: '117', Nombre_cand: 'Roberto', Apell_cand: 'Jiménez', Fecha_Nac_cand: date('1986-12-17'), Direccion_cand: 'Avenida YZA, Ciudad', Correo_cand: 'roberto.jimenez@example.com', Num_Telefono: '789-012-3456', ID_curriculum: 117},
          {ID_cand: '118', Nombre_cand: 'Isabel', Apell_cand: 'Morales', Fecha_Nac_cand: date('1993-02-03'), Direccion_cand: 'Carrera BCD, Ciudad', Correo_cand: 'isabel.morales@example.com', Num_Telefono: '890-123-4567', ID_curriculum: 118},
          {ID_cand: '119', Nombre_cand: 'Manuel', Apell_cand: 'Silva', Fecha_Nac_cand: date('1985-08-11'), Direccion_cand: 'Calle 901, Ciudad', Correo_cand: 'manuel.silva@example.com', Num_Telefono: '901-234-5678', ID_curriculum: 119},
          {ID_cand: '120', Nombre_cand: 'Sara', Apell_cand: 'Gutiérrez', Fecha_Nac_cand: date('1991-04-27'), Direccion_cand: 'Avenida EFG, Ciudad', Correo_cand: 'sara.gutierrez@example.com', Num_Telefono: '012-345-6789', ID_curriculum: 120}
        ] AS row
        CREATE (c:Candidato {
          ID_cand: row.ID_cand,
          Nombre_cand: row.Nombre_cand,
          Apell_cand: row.Apell_cand,
          Fecha_Nac_cand: row.Fecha_Nac_cand,
          Direccion_cand: row.Direccion_cand,
          Correo_cand: row.Correo_cand,
          Num_Telefono: row.Num_Telefono
        })
        WITH c, row
        MATCH (cu:Curriculum {ID_curriculum: row.ID_curriculum})
        CREATE (c)-[:TIENE_CURRICULUM]->(cu);
        
        UNWIND [
          {ID_Evaluacion: 1, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 60, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 2, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 45, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 3, Result_Evaluacion: 'No cumple con requisitos mínimos', Duracion_Evaluacion: 30, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 4, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 50, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 5, Result_Evaluacion: 'No cumple con perfil solicitado', Duracion_Evaluacion: 40, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 6, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 55, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 7, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 60, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 8, Result_Evaluacion: 'No cumple con requisitos mínimos', Duracion_Evaluacion: 35, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 9, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 50, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 10, Result_Evaluacion: 'No cumple con perfil solicitado', Duracion_Evaluacion: 45, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 11, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 55, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 12, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 60, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 13, Result_Evaluacion: 'No cumple con requisitos mínimos', Duracion_Evaluacion: 40, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 14, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 50, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 15, Result_Evaluacion: 'No cumple con perfil solicitado', Duracion_Evaluacion: 45, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 16, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 60, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 17, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 55, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 18, Result_Evaluacion: 'No cumple con requisitos mínimos', Duracion_Evaluacion: 30, Estado_Evaluacion: 'Rechazado'},
          {ID_Evaluacion: 19, Result_Evaluacion: 'Oferta de empleo extendida', Duracion_Evaluacion: 50, Estado_Evaluacion: 'Aprobado'},
          {ID_Evaluacion: 20, Result_Evaluacion: 'No cumple con perfil solicitado', Duracion_Evaluacion: 45, Estado_Evaluacion: 'Rechazado'}
        ] AS row
        CREATE (:Evaluacion {
          ID_Evaluacion: row.ID_Evaluacion,
          Result_Evaluacion: row.Result_Evaluacion,
          Duracion_Evaluacion: row.Duracion_Evaluacion,
          Estado_Evaluacion: row.Estado_Evaluacion
        });
        
        UNWIND [
          {ID_Competencia: 1, Nombre: 'Habilidades técnicas'},
          {ID_Competencia: 2, Nombre: 'Habilidades interpersonales'},
          {ID_Competencia: 3, Nombre: 'Conocimientos específicos'},
          {ID_Competencia: 4, Nombre: 'Capacidad de resolución de problemas'},
          {ID_Competencia: 5, Nombre: 'Comunicación efectiva'},
          {ID_Competencia: 6, Nombre: 'Adaptabilidad'},
          {ID_Competencia: 7, Nombre: 'Trabajo en equipo'},
          {ID_Competencia: 8, Nombre: 'Gestión del tiempo'},
          {ID_Competencia: 9, Nombre: 'Liderazgo'},
          {ID_Competencia: 10, Nombre: 'Creatividad'},
          {ID_Competencia: 11, Nombre: 'Pensamiento crítico'},
          {ID_Competencia: 12, Nombre: 'Resiliencia'},
          {ID_Competencia: 13, Nombre: 'Ética profesional'},
          {ID_Competencia: 14, Nombre: 'Toma de decisiones'},
          {ID_Competencia: 15, Nombre: 'Resolución de conflictos'},
          {ID_Competencia: 16, Nombre: 'Planificación y organización'},
          {ID_Competencia: 17, Nombre: 'Innovación'},
          {ID_Competencia: 18, Nombre: 'Capacidad analítica'},
          {ID_Competencia: 19, Nombre: 'Empatía'},
          {ID_Competencia: 20, Nombre: 'Negociación'}
        ] AS row
        CREATE (:Competencia {
          ID_Competencia: row.ID_Competencia,
          Nombre: row.Nombre
        });
        
        UNWIND [
          {ID_Evaluacion: 1, ID_Competencia: 1}, {ID_Evaluacion: 1, ID_Competencia: 2},
          {ID_Evaluacion: 2, ID_Competencia: 3}, {ID_Evaluacion: 2, ID_Competencia: 4},
          {ID_Evaluacion: 3, ID_Competencia: 5}, {ID_Evaluacion: 3, ID_Competencia: 6},
          {ID_Evaluacion: 4, ID_Competencia: 7}, {ID_Evaluacion: 4, ID_Competencia: 8},
          {ID_Evaluacion: 5, ID_Competencia: 9}, {ID_Evaluacion: 5, ID_Competencia: 10},
          {ID_Evaluacion: 6, ID_Competencia: 11}, {ID_Evaluacion: 6, ID_Competencia: 12},
          {ID_Evaluacion: 7, ID_Competencia: 13}, {ID_Evaluacion: 7, ID_Competencia: 14},
          {ID_Evaluacion: 8, ID_Competencia: 15}, {ID_Evaluacion: 8, ID_Competencia: 16},
          {ID_Evaluacion: 9, ID_Competencia: 17}, {ID_Evaluacion: 9, ID_Competencia: 18},
          {ID_Evaluacion: 10, ID_Competencia: 19}, {ID_Evaluacion: 10, ID_Competencia: 20},
          {ID_Evaluacion: 11, ID_Competencia: 1}, {ID_Evaluacion: 11, ID_Competencia: 2},
          {ID_Evaluacion: 12, ID_Competencia: 3}, {ID_Evaluacion: 12, ID_Competencia: 4},
          {ID_Evaluacion: 13, ID_Competencia: 5}, {ID_Evaluacion: 13, ID_Competencia: 6},
          {ID_Evaluacion: 14, ID_Competencia: 7}, {ID_Evaluacion: 14, ID_Competencia: 8},
          {ID_Evaluacion: 15, ID_Competencia: 9}, {ID_Evaluacion: 15, ID_Competencia: 10},
          {ID_Evaluacion: 16, ID_Competencia: 11}, {ID_Evaluacion: 16, ID_Competencia: 12},
          {ID_Evaluacion: 17, ID_Competencia: 13}, {ID_Evaluacion: 17, ID_Competencia: 14},
          {ID_Evaluacion: 18, ID_Competencia: 15}, {ID_Evaluacion: 18, ID_Competencia: 16},
          {ID_Evaluacion: 19, ID_Competencia: 17}, {ID_Evaluacion: 19, ID_Competencia: 18},
          {ID_Evaluacion: 20, ID_Competencia: 19}, {ID_Evaluacion: 20, ID_Competencia: 20}
        ] AS row
        MATCH (e:Evaluacion {ID_Evaluacion: row.ID_Evaluacion}), (c:Competencia {ID_Competencia: row.ID_Competencia})
        CREATE (e)-[:EVALUA]->(c);
        
        UNWIND [
          {ID_Conocimiento: 1, Nombre: 'Experiencia en producción'},
          {ID_Conocimiento: 2, Nombre: 'Manejo de inventarios'},
          {ID_Conocimiento: 3, Nombre: 'Control de calidad'},
          {ID_Conocimiento: 4, Nombre: 'Supervisión de personal'},
          {ID_Conocimiento: 5, Nombre: 'Procesamiento de frutas'},
          {ID_Conocimiento: 6, Nombre: 'Investigación y desarrollo'},
          {ID_Conocimiento: 7, Nombre: 'Marketing digital'},
          {ID_Conocimiento: 8, Nombre: 'Contabilidad financiera'},
          {ID_Conocimiento: 9, Nombre: 'Gestión de personal'},
          {ID_Conocimiento: 10, Nombre: 'Mantenimiento de equipos'},
          {ID_Conocimiento: 11, Nombre: 'Normativas de seguridad'},
          {ID_Conocimiento: 12, Nombre: 'Gestión ambiental'},
          {ID_Conocimiento: 13, Nombre: 'Producción de frutas'},
          {ID_Conocimiento: 14, Nombre: 'Recepción y almacenamiento'},
          {ID_Conocimiento: 15, Nombre: 'Producción de mermelada'},
          {ID_Conocimiento: 16, Nombre: 'Producción de frutas confitadas'},
          {ID_Conocimiento: 17, Nombre: 'Logística y distribución'}
        ] AS row
        CREATE (:Conocimiento {
          ID_Conocimiento: row.ID_Conocimiento,
          Nombre: row.Nombre
        });
        
        UNWIND [
          {ID_Titulo: 1, Nombre: 'Licenciatura en Ingeniería Industrial'},
          {ID_Titulo: 2, Nombre: 'Técnico en Logística'},
          {ID_Titulo: 3, Nombre: 'Ingeniero en Alimentos'},
          {ID_Titulo: 4, Nombre: 'Diplomado en Gestión de Equipos'},
          {ID_Titulo: 5, Nombre: 'Técnico en Procesamiento de Alimentos'},
          {ID_Titulo: 6, Nombre: 'Doctorado en Ciencias Naturales'},
          {ID_Titulo: 7, Nombre: 'Licenciatura en Marketing'},
          {ID_Titulo: 8, Nombre: 'Licenciatura en Contaduría Pública'},
          {ID_Titulo: 9, Nombre: 'Licenciatura en Recursos Humanos'},
          {ID_Titulo: 10, Nombre: 'Ingeniero Mecánico'},
          {ID_Titulo: 11, Nombre: 'Diplomado en Seguridad Industrial'},
          {ID_Titulo: 12, Nombre: 'Ingeniero Ambiental'},
          {ID_Titulo: 13, Nombre: 'Ingeniero Agrónomo'},
          {ID_Titulo: 14, Nombre: 'Técnico en Almacenamiento'},
          {ID_Titulo: 15, Nombre: 'Licenciatura en Logística'}
        ] AS row
        CREATE (:Titulo {
          ID_Titulo: row.ID_Titulo,
          Nombre: row.Nombre
        });
        
        UNWIND [
          {ID_Perfil: 1, Anos_Exp: 5}, {ID_Perfil: 2, Anos_Exp: 3}, {ID_Perfil: 3, Anos_Exp: 4}, {ID_Perfil: 4, Anos_Exp: 2},
          {ID_Perfil: 5, Anos_Exp: 3}, {ID_Perfil: 6, Anos_Exp: 5}, {ID_Perfil: 7, Anos_Exp: 2}, {ID_Perfil: 8, Anos_Exp: 3},
          {ID_Perfil: 9, Anos_Exp: 4}, {ID_Perfil: 10, Anos_Exp: 3}, {ID_Perfil: 11, Anos_Exp: 5}, {ID_Perfil: 12, Anos_Exp: 4},
          {ID_Perfil: 13, Anos_Exp: 3}, {ID_Perfil: 14, Anos_Exp: 5}, {ID_Perfil: 15, Anos_Exp: 2}, {ID_Perfil: 16, Anos_Exp: 3},
          {ID_Perfil: 17, Anos_Exp: 4}, {ID_Perfil: 18, Anos_Exp: 3}, {ID_Perfil: 19, Anos_Exp: 5}, {ID_Perfil: 20, Anos_Exp: 4}
        ] AS row
        CREATE (:Perfil {
          ID_Perfil: row.ID_Perfil,
          Anos_Exp: row.Anos_Exp
        });
        
        UNWIND [
          {ID_Perfil: 1, ID_Conocimiento: 1}, {ID_Perfil: 2, ID_Conocimiento: 2}, {ID_Perfil: 3, ID_Conocimiento: 3},
          {ID_Perfil: 4, ID_Conocimiento: 4}, {ID_Perfil: 5, ID_Conocimiento: 5}, {ID_Perfil: 6, ID_Conocimiento: 6},
          {ID_Perfil: 7, ID_Conocimiento: 2}, {ID_Perfil: 8, ID_Conocimiento: 7}, {ID_Perfil: 9, ID_Conocimiento: 8},
          {ID_Perfil: 10, ID_Conocimiento: 9}, {ID_Perfil: 11, ID_Conocimiento: 10}, {ID_Perfil: 12, ID_Conocimiento: 11},
          {ID_Perfil: 13, ID_Conocimiento: 12}, {ID_Perfil: 14, ID_Conocimiento: 13}, {ID_Perfil: 15, ID_Conocimiento: 14},
          {ID_Perfil: 16, ID_Conocimiento: 3}, {ID_Perfil: 17, ID_Conocimiento: 15}, {ID_Perfil: 18, ID_Conocimiento: 16},
          {ID_Perfil: 19, ID_Conocimiento: 6}, {ID_Perfil: 20, ID_Conocimiento: 17}
        ] AS row
        MATCH (p:Perfil {ID_Perfil: row.ID_Perfil}), (c:Conocimiento {ID_Conocimiento: row.ID_Conocimiento})
        CREATE (p)-[:TIENE_CONOCIMIENTO]->(c);
        UNWIND [
          {ID_Perfil: 1, ID_Titulo: 1}, {ID_Perfil: 2, ID_Titulo: 2}, {ID_Perfil: 3, ID_Titulo: 3}, {ID_Perfil: 4, ID_Titulo: 4},
          {ID_Perfil: 5, ID_Titulo: 5}, {ID_Perfil: 6, ID_Titulo: 6}, {ID_Perfil: 7, ID_Titulo: 2}, {ID_Perfil: 8, ID_Titulo: 7},
          {ID_Perfil: 9, ID_Titulo: 8}, {ID_Perfil: 10, ID_Titulo: 9}, {ID_Perfil: 11, ID_Titulo: 10}, {ID_Perfil: 12, ID_Titulo: 11},
          {ID_Perfil: 13, ID_Titulo: 12}, {ID_Perfil: 14, ID_Titulo: 13}, {ID_Perfil: 15, ID_Titulo: 14}, {ID_Perfil: 16, ID_Titulo: 3},
          {ID_Perfil: 17, ID_Titulo: 3}, {ID_Perfil: 18, ID_Titulo: 5}, {ID_Perfil: 19, ID_Titulo: 6}, {ID_Perfil: 20, ID_Titulo: 15}
        ] AS row
        MATCH (p:Perfil {ID_Perfil: row.ID_Perfil}), (t:Titulo {ID_Titulo: row.ID_Titulo})
        CREATE (p)-[:TIENE_TITULO]->(t);
        
        UNWIND [
          {ID_Vac: '00200001', ID_Departamento: 1, ID_Cargo: 1, ID_Perfil: 1, Ubicacion: 'Ciudad A', Beneficio: 'Seguro de vida', Salario: 2500.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200002', ID_Departamento: 2, ID_Cargo: 2, ID_Perfil: 2, Ubicacion: 'Ciudad B', Beneficio: 'Bonos de productividad', Salario: 3000.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200003', ID_Departamento: 3, ID_Cargo: 3, ID_Perfil: 3, Ubicacion: 'Ciudad C', Beneficio: 'Transporte subsidiado', Salario: 2000.00, Horario: 'Lunes a Viernes de 7am a 4pm'},
          {ID_Vac: '00200004', ID_Departamento: 4, ID_Cargo: 4, ID_Perfil: 4, Ubicacion: 'Ciudad D', Beneficio: 'Comida subsidiada', Salario: 3500.00, Horario: 'Lunes a Viernes de 10am a 7pm'},
          {ID_Vac: '00200005', ID_Departamento: 5, ID_Cargo: 5, ID_Perfil: 5, Ubicacion: 'Ciudad E', Beneficio: 'Seguro médico', Salario: 4000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200006', ID_Departamento: 6, ID_Cargo: 6, ID_Perfil: 6, Ubicacion: 'Ciudad F', Beneficio: 'Gimnasio en la empresa', Salario: 3000.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200007', ID_Departamento: 7, ID_Cargo: 7, ID_Perfil: 7, Ubicacion: 'Ciudad G', Beneficio: 'Días libres adicionales', Salario: 2000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200008', ID_Departamento: 8, ID_Cargo: 8, ID_Perfil: 8, Ubicacion: 'Ciudad H', Beneficio: 'Teletrabajo', Salario: 4500.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200009', ID_Departamento: 9, ID_Cargo: 1, ID_Perfil: 9, Ubicacion: 'Ciudad I', Beneficio: 'Bonos por resultados', Salario: 3000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200010', ID_Departamento: 10, ID_Cargo: 2, ID_Perfil: 10, Ubicacion: 'Ciudad J', Beneficio: 'Oportunidades de crecimiento', Salario: 2500.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200011', ID_Departamento: 11, ID_Cargo: 3, ID_Perfil: 11, Ubicacion: 'Ciudad K', Beneficio: 'Estacionamiento gratuito', Salario: 3500.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200012', ID_Departamento: 12, ID_Cargo: 4, ID_Perfil: 12, Ubicacion: 'Ciudad L', Beneficio: 'Comedor en la empresa', Salario: 2000.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200013', ID_Departamento: 13, ID_Cargo: 5, ID_Perfil: 13, Ubicacion: 'Ciudad M', Beneficio: 'Seguro dental', Salario: 4000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200014', ID_Departamento: 1, ID_Cargo: 6, ID_Perfil: 1, Ubicacion: 'Ciudad N', Beneficio: 'Asistencia médica', Salario: 3000.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200015', ID_Departamento: 2, ID_Cargo: 7, ID_Perfil: 2, Ubicacion: 'Ciudad O', Beneficio: 'Horario flexible', Salario: 2000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200016', ID_Departamento: 3, ID_Cargo: 8, ID_Perfil: 3, Ubicacion: 'Ciudad P', Beneficio: 'Reembolso de educación', Salario: 3500.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200017', ID_Departamento: 4, ID_Cargo: 1, ID_Perfil: 4, Ubicacion: 'Ciudad Q', Beneficio: 'Bono de cumpleaños', Salario: 2500.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200018', ID_Departamento: 5, ID_Cargo: 2, ID_Perfil: 5, Ubicacion: 'Ciudad R', Beneficio: 'Descuentos en productos', Salario: 4000.00, Horario: 'Lunes a Viernes de 9am a 6pm'},
          {ID_Vac: '00200019', ID_Departamento: 6, ID_Cargo: 3, ID_Perfil: 6, Ubicacion: 'Ciudad S', Beneficio: 'Vacaciones adicionales', Salario: 3000.00, Horario: 'Lunes a Viernes de 8am a 5pm'},
          {ID_Vac: '00200020', ID_Departamento: 7, ID_Cargo: 4, ID_Perfil: 7, Ubicacion: 'Ciudad T', Beneficio: 'Programas de bienestar', Salario: 2000.00, Horario: 'Lunes a Viernes de 9am a 6pm'}
        ] AS row
        CREATE (:Vacante {
          ID_Vac: row.ID_Vac,
          ID_Departamento: row.ID_Departamento,
          ID_Cargo: row.ID_Cargo,
          ID_Perfil: row.ID_Perfil,
          Ubicacion: row.Ubicacion,
          Beneficio: row.Beneficio,
          Salario: row.Salario,
          Horario: row.Horario
        });
        
        UNWIND [
          {ID_solicitud: '00240001', ID_Vacante: '00200001', Est_solicitud: 'En proceso', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-04-20', ID_cand: 101},
          {ID_solicitud: '00240002', ID_Vacante: '00200002', Est_solicitud: 'En revisión', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-04-21', ID_cand: 102},
          {ID_solicitud: '00240003', ID_Vacante: '00200003', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 7am a 4pm', Fecha_aplicacion: '2024-04-22', ID_cand: 103},
          {ID_solicitud: '00240004', ID_Vacante: '00200004', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 10am a 7pm', Fecha_aplicacion: '2024-04-23', ID_cand: 104},
          {ID_solicitud: '00240005', ID_Vacante: '00200005', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-04-24', ID_cand: 105},
          {ID_solicitud: '00240006', ID_Vacante: '00200006', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-04-25', ID_cand: 106},
          {ID_solicitud: '00240007', ID_Vacante: '00200007', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-04-26', ID_cand: 107},
          {ID_solicitud: '00240008', ID_Vacante: '00200008', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-04-27', ID_cand: 108},
          {ID_solicitud: '00240009', ID_Vacante: '00200009', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-04-28', ID_cand: 109},
          {ID_solicitud: '00240010', ID_Vacante: '00200010', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-04-29', ID_cand: 110},
          {ID_solicitud: '00240011', ID_Vacante: '00200011', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-04-30', ID_cand: 111},
          {ID_solicitud: '00240012', ID_Vacante: '00200012', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-05-01', ID_cand: 112},
          {ID_solicitud: '00240013', ID_Vacante: '00200013', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-05-02', ID_cand: 113},
          {ID_solicitud: '00240014', ID_Vacante: '00200014', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-05-03', ID_cand: 114},
          {ID_solicitud: '00240015', ID_Vacante: '00200015', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-05-04', ID_cand: 115},
          {ID_solicitud: '00240016', ID_Vacante: '00200016', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-05-05', ID_cand: 116},
          {ID_solicitud: '00240017', ID_Vacante: '00200017', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-05-06', ID_cand: 117},
          {ID_solicitud: '00240018', ID_Vacante: '00200018', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-05-07', ID_cand: 118},
          {ID_solicitud: '00240019', ID_Vacante: '00200019', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 8am a 5pm', Fecha_aplicacion: '2024-05-08', ID_cand: 119},
          {ID_solicitud: '00240020', ID_Vacante: '00200020', Est_solicitud: 'Pendiente', Horario_disponible: 'Lunes a Viernes de 9am a 6pm', Fecha_aplicacion: '2024-05-09', ID_cand: 120}
        ] AS row
        MATCH (v:Vacante {ID_Vac: row.ID_Vacante}), (c:Candidato {ID_cand: row.ID_cand})
        CREATE (s:Solicitud_Empleo {
          ID_solicitud: row.ID_solicitud,
          Est_solicitud: row.Est_solicitud,
          Horario_disponible: row.Horario_disponible,
          Fecha_aplicacion: row.Fecha_aplicacion
        })-[:APLICA_A]->(v), (c)-[:REALIZA_SOLICITUD]->(s);
        
        UNWIND [
          {ID_Entrevista: 1, Fecha_Eva: '2024-04-20', Hora_entrevista: '09:00', ID_Solicitud: '00240001', ID_Evaluacion: 1, ID_Empleado: 20240014},
          {ID_Entrevista: 2, Fecha_Eva: '2024-04-21', Hora_entrevista: '09:30', ID_Solicitud: '00240002', ID_Evaluacion: 2, ID_Empleado: 20240014},
          {ID_Entrevista: 3, Fecha_Eva: '2024-04-22', Hora_entrevista: '10:00', ID_Solicitud: '00240003', ID_Evaluacion: 3, ID_Empleado: 20240015},
          {ID_Entrevista: 4, Fecha_Eva: '2024-04-23', Hora_entrevista: '10:30', ID_Solicitud: '00240004', ID_Evaluacion: 4, ID_Empleado: 20240014},
          {ID_Entrevista: 5, Fecha_Eva: '2024-04-24', Hora_entrevista: '11:00', ID_Solicitud: '00240005', ID_Evaluacion: 5, ID_Empleado: 20240014},
          {ID_Entrevista: 6, Fecha_Eva: '2024-04-25', Hora_entrevista: '11:30', ID_Solicitud: '00240006', ID_Evaluacion: 6, ID_Empleado: 20240014},
          {ID_Entrevista: 7, Fecha_Eva: '2024-04-26', Hora_entrevista: '12:00', ID_Solicitud: '00240007', ID_Evaluacion: 7, ID_Empleado: 20240014},
          {ID_Entrevista: 8, Fecha_Eva: '2024-04-27', Hora_entrevista: '12:30', ID_Solicitud: '00240008', ID_Evaluacion: 8, ID_Empleado: 20240014},
          {ID_Entrevista: 9, Fecha_Eva: '2024-04-28', Hora_entrevista: '13:00', ID_Solicitud: '00240009', ID_Evaluacion: 9, ID_Empleado: 20240014},
          {ID_Entrevista: 10, Fecha_Eva: '2024-04-29', Hora_entrevista: '13:30', ID_Solicitud: '00240010', ID_Evaluacion: 10, ID_Empleado: 20240015},
          {ID_Entrevista: 11, Fecha_Eva: '2024-04-30', Hora_entrevista: '14:00', ID_Solicitud: '00240011', ID_Evaluacion: 11, ID_Empleado: 20240013},
          {ID_Entrevista: 12, Fecha_Eva: '2024-05-01', Hora_entrevista: '14:30', ID_Solicitud: '00240012', ID_Evaluacion: 12, ID_Empleado: 20240014},
          {ID_Entrevista: 13, Fecha_Eva: '2024-05-02', Hora_entrevista: '15:00', ID_Solicitud: '00240013', ID_Evaluacion: 13, ID_Empleado: 20240015},
          {ID_Entrevista: 14, Fecha_Eva: '2024-05-03', Hora_entrevista: '15:30', ID_Solicitud: '00240014', ID_Evaluacion: 14, ID_Empleado: 20240015},
          {ID_Entrevista: 15, Fecha_Eva: '2024-05-04', Hora_entrevista: '16:00', ID_Solicitud: '00240015', ID_Evaluacion: 15, ID_Empleado: 20240014},
          {ID_Entrevista: 16, Fecha_Eva: '2024-05-05', Hora_entrevista: '16:30', ID_Solicitud: '00240016', ID_Evaluacion: 16, ID_Empleado: 20240014},
          {ID_Entrevista: 17, Fecha_Eva: '2024-05-06', Hora_entrevista: '17:00', ID_Solicitud: '00240017', ID_Evaluacion: 17, ID_Empleado: 20240013},
          {ID_Entrevista: 18, Fecha_Eva: '2024-05-07', Hora_entrevista: '17:30', ID_Solicitud: '00240018', ID_Evaluacion: 18, ID_Empleado: 20240014},
          {ID_Entrevista: 19, Fecha_Eva: '2024-05-08', Hora_entrevista: '18:00', ID_Solicitud: '00240019', ID_Evaluacion: 19, ID_Empleado: 20240015},
          {ID_Entrevista: 20, Fecha_Eva: '2024-05-09', Hora_entrevista: '18:30', ID_Solicitud: '00240020', ID_Evaluacion: 20, ID_Empleado: 20240013}
        ] AS row
        MATCH (s:Solicitud_Empleo {ID_solicitud: row.ID_Solicitud}), (e:Evaluacion {ID_Evaluacion: row.ID_Evaluacion}), (emp:Empleado {ID_Empleado: row.ID_Empleado})
        CREATE (i:Entrevista {
          ID_Entrevista: row.ID_Entrevista,
          Fecha_Eva: row.Fecha_Eva,
          Hora_entrevista: row.Hora_entrevista
        })-[:RELACIONADA_CON]->(s), (i)-[:REALIZA]->(e), (i)-[:CONDUCTOR]->(emp);

