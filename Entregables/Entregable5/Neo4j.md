## Nodos y Datos

### Nodo de Departamentos:

    CREATE (d1:Departamento {ID_Departamento: 1, Nombre_Departamento: 'Producción de Fruta Fresca'}),
         (d2:Departamento {ID_Departamento: 2, Nombre_Departamento: 'Recepción y Almacenamiento de Fruta'}),
         (d3:Departamento {ID_Departamento: 3, Nombre_Departamento: 'Control de Calidad'}),
         (d4:Departamento {ID_Departamento: 4, Nombre_Departamento: 'Producción de Mermelada'}),
         (d5:Departamento {ID_Departamento: 5, Nombre_Departamento: 'Producción de Fruta Confitada'}),
         (d6:Departamento {ID_Departamento: 6, Nombre_Departamento: 'Investigación y Desarrollo'}),
         (d7:Departamento {ID_Departamento: 7, Nombre_Departamento: 'Logística y Distribución'}),
         (d8:Departamento {ID_Departamento: 8, Nombre_Departamento: 'Marketing y Ventas'}),
         (d9:Departamento {ID_Departamento: 9, Nombre_Departamento: 'Finanzas y Contabilidad'}),
         (d10:Departamento {ID_Departamento: 10, Nombre_Departamento: 'Recursos Humanos'}),
         (d11:Departamento {ID_Departamento: 11, Nombre_Departamento: 'Mantenimiento y Reparación de Equipos'}),
         (d12:Departamento {ID_Departamento: 12, Nombre_Departamento: 'Seguridad e Higiene'}),
         (d13:Departamento {ID_Departamento: 13, Nombre_Departamento: 'Gestión Ambiental y Sostenibilidad'}),
         (d14:Departamento {ID_Departamento: 14, Nombre_Departamento: 'Directorio'});

### Nodo de Cargos:

    CREATE (c1:Cargo {ID_Cargo: 1, Nombre_Cargo: 'Gerente', Descripcion: 'Encargado de la dirección de alguna área.'}),
           (c2:Cargo {ID_Cargo: 2, Nombre_Cargo: 'Jefe', Descripcion: 'Persona que tiene autoridad sobre un grupo de trabajadores'}),
           (c3:Cargo {ID_Cargo: 3, Nombre_Cargo: 'Especialista', Descripcion: 'Persona con conocimientos específicos en un área determinada.'}),
           (c4:Cargo {ID_Cargo: 4, Nombre_Cargo: 'Supervisor', Descripcion: 'Encargado de supervisar y coordinar las actividades de un grupo de trabajadores.'}),
           (c5:Cargo {ID_Cargo: 5, Nombre_Cargo: 'Técnico', Descripcion: 'Persona con conocimientos técnicos especializados en una determinada área.'}),
           (c6:Cargo {ID_Cargo: 6, Nombre_Cargo: 'Profesional', Descripcion: 'Persona con formación académica y experiencia en un campo específico.'}),
           (c7:Cargo {ID_Cargo: 7, Nombre_Cargo: 'Asistente', Descripcion: 'Persona que brinda apoyo administrativo o técnico en una organización.'}),
           (c8:Cargo {ID_Cargo: 8, Nombre_Cargo: 'Operario', Descripcion: 'Persona encargada de realizar tareas operativas o de producción en una empresa.'});

### Nodo de Empleados:

// Create Empleado nodes (primer batch)

    CREATE (e1:Empleado {ID_Empleado: 20200001, Nombre_Empleado: 'Juan', Apellido_Empleado: 'Pérez', Telefono: '912345688', Direccion: 'Av. Arequipa 123, Lima', Correo: 'juan.perez@gmail.com', Fecha_Nacimiento: date('1975-05-10'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '11223344', Fecha_Ingreso: date('2020-01-01')}),
       (e2:Empleado {ID_Empleado: 20210001, Nombre_Empleado: 'Juan', Apellido_Empleado: 'López', Telefono: '912345678', Direccion: 'Calle Los Pinos 123, Lima', Correo: 'juan.lopez@gmail.com', Fecha_Nacimiento: date('1990-01-15'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '12345678', Fecha_Ingreso: date('2021-01-01')}),
       (e3:Empleado {ID_Empleado: 20210002, Nombre_Empleado: 'María', Apellido_Empleado: 'García', Telefono: '912345679', Direccion: 'Avenida El Sol 456, Arequipa', Correo: 'maria.garcia@gmail.com', Fecha_Nacimiento: date('1985-05-20'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '23456789', Fecha_Ingreso: date('2021-01-02')}),
       (e4:Empleado {ID_Empleado: 20210003, Nombre_Empleado: 'Pedro', Apellido_Empleado: 'Rodríguez', Telefono: '912345680', Direccion: 'Jirón Junín 789, Cusco', Correo: 'pedro.rodriguez@gmail.com', Fecha_Nacimiento: date('1988-11-10'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '34567890', Fecha_Ingreso: date('2021-01-03')}),
       (e5:Empleado {ID_Empleado: 20210004, Nombre_Empleado: 'Ana', Apellido_Empleado: 'Martínez', Telefono: '912345681', Direccion: 'Calle Las Flores 012, Trujillo', Correo: 'ana.martinez@gmail.com', Fecha_Nacimiento: date('1992-07-03'), Cant_Hijos: 3, Estado_Civil: 'Casado', DNI: '45678901', Fecha_Ingreso: date('2021-01-04')}),
       (e6:Empleado {ID_Empleado: 20210005, Nombre_Empleado: 'Luis', Apellido_Empleado: 'Hernández', Telefono: '912345682', Direccion: 'Avenida Los Alamos 345, Chiclayo', Correo: 'luis.hernandez@gmail.com', Fecha_Nacimiento: date('1995-04-18'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '56789012', Fecha_Ingreso: date('2021-01-05')});

// Create Empleado nodes (segundo batch)

    CREATE (e7:Empleado {ID_Empleado: 20210006, Nombre_Empleado: 'Laura', Apellido_Empleado: 'González', Telefono: '912345683', Direccion: 'Calle Los Pájaros 678, Piura', Correo: 'laura.gonzalez@gmail.com', Fecha_Nacimiento: date('1991-09-25'), Cant_Hijos: 2, Estado_Civil: 'Casado', DNI: '67890123', Fecha_Ingreso: date('2021-01-06')}),
           (e8:Empleado {ID_Empleado: 20210007, Nombre_Empleado: 'Carlos', Apellido_Empleado: 'Ramírez', Telefono: '912345684', Direccion: 'Jirón Los Laureles 901, Huancayo', Correo: 'carlos.ramirez@gmail.com', Fecha_Nacimiento: date('1987-03-12'), Cant_Hijos: 1, Estado_Civil: 'Soltero', DNI: '78901234', Fecha_Ingreso: date('2021-01-07')}),
           (e9:Empleado {ID_Empleado: 20210008, Nombre_Empleado: 'Diana', Apellido_Empleado: 'Vargas', Telefono: '912345685', Direccion: 'Avenida Los Cerezos 234, Iquitos', Correo: 'diana.vargas@gmail.com', Fecha_Nacimiento: date('1993-06-28'), Cant_Hijos: 0, Estado_Civil: 'Soltero', DNI: '89012345', Fecha_Ingreso: date('2021-01-08')});

## Relaciones

    CREATE (e1)-[:PERTENECE_A]->(d1),
           (e1)-[:OCUPA {roles: ['Gerente']}]->(c1);
    
    CREATE (e2)-[:PERTENECE_A]->(d2)
           (e2)-[:OCUPA {roles: ['Analista']}]->(c2);
    
    CREATE (e3)-[:PERTENECE_A]->(d3),
           (e3)-[:OCUPA {roles: ['Desarrollador']}]->(c3);

    CREATE (e4)-[:PERTENECE_A]->(d3),
           (e4)-[:OCUPA {roles: ['Analista']}]->(c2);
    
    
    CREATE (e5)-[:PERTENECE_A]->(d1),
           (e5)-[:OCUPA {roles: ['Desarrollador']}]->(c3);
    
    
    CREATE (e6)-[:PERTENECE_A]->(d3),
           (e6)-[:OCUPA {roles: ['Analista', 'Desarrollador']}]->(c2);
    
    
    CREATE (e7)-[:PERTENECE_A]->(d2),
           (e7)-[:OCUPA {roles: ['Gerente']}]->(c1);
    
    CREATE (e8)-[:PERTENECE_A]->(d1),
           (e8)-[:OCUPA {roles: ['Analista']}]->(c2);
    
    
    CREATE (e9)-[:PERTENECE_A]->(d2),
           (e9)-[:OCUPA {roles: ['Desarrollador']}]->(c3);
    
    
    CREATE (e10)-[:PERTENECE_A]->(d1),
           (e10)-[:OCUPA {roles: ['Desarrollador']}]->(c3);

## Mach

### Relacion Empleado 'Pertenece a' Departamento:

    MATCH (e:Empleado), (d:Departamento)
    WHERE e.ID_Empleado = 20200001 AND d.ID_Departamento = 1


    MATCH (e:Empleado), (d:Departamento)
    WHERE e.ID_Empleado = 20210001 AND d.ID_Departamento = 2


    MATCH (e:Empleado), (d:Departamento)
    WHERE e.ID_Empleado = 20210002 AND d.ID_Departamento = 3


### Relacion Empleado 'Ocupa' Cargo:

    MATCH (e:Empleado), (c:Cargo)
    WHERE e.ID_Empleado = 20200001 AND c.ID_Cargo = 1
  
    
    MATCH (e:Empleado), (c:Cargo)
    WHERE e.ID_Empleado = 20210001 AND c.ID_Cargo = 4
 
    MATCH (e:Empleado), (c:Cargo)
    WHERE e.ID_Empleado = 20210002 AND c.ID_Cargo = 7





