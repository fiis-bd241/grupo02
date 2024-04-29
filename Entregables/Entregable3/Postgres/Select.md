# SELECTS PREDEFINIDOS

## Módulo: Evaluación de desempeño
### Listar todos los empleados y sus respectivos departamentos y cargos:
	SELECT E.Nombre_Empleado, E.Apellido_Empleado, D.Nombre_Departamento, C.Nombre AS Cargo
	FROM Empleado E
	INNER JOIN Departamento D ON E.ID_Departamento = D.ID_Departamento
	INNER JOIN Cargo C ON E.ID_Cargo = C.ID_Cargo;
	
### Ver los cuestionarios enviados por los especialistas de relaciones laborales y el estado de aprobación:
	SELECT CE.ID_Cuestionario, Cu.Tipo_cuestionario,CE.ID_Especialista,E.Nombre_empleado AS nombre_especialista, E.apellido_empleado AS apellido_especialista,CE.Fecha_Creacion, CE.Hora_Creacion, CE.Fecha_Envio_Gerencia, CE.Hora_Envio_Gerencia, CG.Estado_aprobacion
	FROM Cuestionario_Especialista CE inner join Especialista_relaciones_laborales Es on CE.id_especialista=Es.id_especialista inner join Empleado E on E.id_empleado=Es.id_empleado 
	inner join Cuestionario_gerente_rr_hh CG on CG.id_cuestionario=CE.id_cuestionario inner join Cuestionario Cu on Cu.id_cuestionario=CE.ID_cuestionario;


### Mostrar el id_cuestionario, tipo de cuestionario, id_pregunta y los enunciados de las preguntas
	Select Cu.Id_cuestionario,Cu.Tipo_Cuestionario,Pe.id_pregunta,Pe.Enunciado_Pregunta from Cuestionario Cu inner join Pregunta_Cuestionario PE on Cu.id_cuestionario=Pe.id_cuestionario;
	
	
 ### Mostrar los cuestionarios completados por los empleados y sus respuestas:
	SELECT CE.ID_Empleado, CE.ID_Cuestionario, CE.ID_Pregunta, CE.Respuesta, CE.Fecha_Rellenado, CE.Hora_Rellenado
	FROM Cuestionario_Empleado CE;
	
### Obtener empleados, tipo de empleado y sus respuestas a las preguntas del cuestionario:
	Select E.id_empleado, E.Nombre_Empleado,E.Apellido_Empleado, Cu.tipo_Cuestionario, Pe.Enunciado_Pregunta, CE.Respuesta, CE.Fecha_Rellenado, CE.Hora_rellenado from Empleado E 
	inner join Cuestionario_Empleado CE ON E.id_empleado=CE.Id_empleado inner join Cuestionario Cu on CE.ID_cuestionario=Cu.Id_Cuestionario inner join
	pregunta_cuestionario Pe on Cu.id_cuestionario=Pe.id_cuestionario;
	
### Obtener empleados, cargo, tipo de empleado y sus respuestas a las preguntas del cuestionario:
	Select E.Nombre_Empleado,E.Apellido_Empleado, Ca.Nombre as Cargo_Empleado, Cu.tipo_Cuestionario, Pe.Enunciado_Pregunta, CE.Respuesta, CE.Fecha_Rellenado, CE.Hora_rellenado from Empleado E 
	inner join Cuestionario_Empleado CE ON E.id_empleado=CE.Id_empleado inner join Cuestionario Cu on CE.ID_cuestionario=Cu.Id_Cuestionario inner join
	pregunta_cuestionario Pe on Cu.id_cuestionario=Pe.id_cuestionario inner join Cargo Ca on E.id_cargo=Ca.id_cargo;
	
### Listar los reportes de los empleados y sus calificaciones:
	SELECT R.ID_Reporte, E.Nombre_Empleado, E.Apellido_Empleado, R.Calificacion_Empleado, R.Fecha_Ingreso_Empleado
	FROM Reporte R
	INNER JOIN Empleado E ON R.ID_Empleado = E.ID_Empleado;
	
### Obtener retroalimentación proporcionada a los empleados:
	SELECT R.ID_Retroalimentacion, Re.Id_reporte, E.Nombre_Empleado, E.Apellido_Empleado, R.Enunciado_Retroalimentacion, R.Fecha_Retroalimentacion, R.Hora_Retroalimentacion
	FROM Retroalimentacion R
	INNER JOIN Empleado E ON R.ID_Empleado = E.ID_Empleado
	INNER JOIN Reporte Re on Re.id_reporte=R.id_reporte;
	
### Obtener las reuniones:
	SELECT ID_Reunion, Asunto_Reunion, ID_Especialista, ID_Gerente, Fecha_Reunion, Hora_Reunion FROM Reunion;



## Módulo: Reclutamiento y selección de personal
### Select para obtener el nombre del empleado a cargo de la entrevista
	SELECT e.ID_Entrevista, e.Fecha_Eva, e.Hora_entrevista, e.Resp_Eva, e.Resultado_eva, e.ID_Solicitud, e.ID_Evaluacion, e.ID_Empleado, 
	       em.Nombre_Empleado, em.Apellido_Empleado
	FROM Entrevista e
	INNER JOIN Empleado em ON e.ID_Empleado = em.ID_Empleado;



### Seleccionar nombre de candidatos con sus solicitudes de empleo y estado de solicitud:
	SELECT c.Nombre_cand, c.Apell_cand, se.Est_solicitud, se.Vacante_aplicada
	FROM Candidato c
	INNER JOIN Solicitud_Empleo se ON c.ID_cand = se.ID_cand;


### Seleccionar id de candidatos con sus solicitudes de empleo y estado de solicitud:
	SELECT v.ID_Vac, d.Nombre_departamento, c.Nombre, p.Conocimiento_Req
	FROM Vacante v
	INNER JOIN Departamento d ON v.ID_Departamento = d.ID_Departamento
	INNER JOIN Cargo c ON v.ID_Cargo = c.ID_Cargo
	INNER JOIN Perfil p ON v.ID_Perfil = p.ID_Perfil;

## Módulo: Registro de asistencias y solicitudes
### Para solicitar una licencia médica:
    
	-- Crear el procedimiento
	CREATE OR REPLACE PROCEDURE SolicitarLicenciaMedica(
    IN p_ID_Empleado INTEGER,
    IN p_Motivo VARCHAR(128),
    IN p_FechaInicio DATE,
    IN p_FechaFin DATE
    )
    AS $$
    BEGIN
            INSERT INTO Permiso (Tipo, Motivo, Duracion, Estado, ID_Empleado, ID_Supervisor)
            VALUES ('Licencia Médica', p_Motivo, 'Más de un día', 'Pendiente', p_ID_Empleado, NULL);

            INSERT INTO Licencia (Tipo, Estado, Fecha_inicio, Fecha_fin, ID_Empleado, ID_Supervisor)
            VALUES ('Licencia Médica', 'Pendiente', p_FechaInicio, p_FechaFin, p_ID_Empleado, NULL);

	END;
	$$ LANGUAGE plpgsql;

![alt text](../Front/SolicitudFalta.png)

### Para aceptar o rechazar solicitudes de licencia de cualquier tipo:

    -- Crear el procedimiento
    CREATE OR REPLACE PROCEDURE AceptarRechazarSolicitudLicencia(
    IN p_ID_Licencia INTEGER,
    IN p_Estado VARCHAR(64)
    )
    AS $$
    BEGIN
    UPDATE Licencia
    SET Estado = p_Estado
    WHERE ID_Licencia = p_ID_Licencia;
		
	END;
	$$ LANGUAGE plpgsql;

![alt text](../Front/AceptarSolicitud.png)

### Para registrar asistencias:

    -- Crear el procedimiento
    CREATE OR REPLACE PROCEDURE RegistrarAsistencia(
    IN p_ID_Empleado INTEGER,
    IN p_Fecha DATE,
    IN p_HoraEntrada TIME,
    IN p_HoraSalida TIME
    )
    AS $$
    BEGIN
            INSERT INTO Asistencia (ID_Empleado, Estado, Observacion, Fecha, Hora_entrada, Hora_salida)
            VALUES (p_ID_Empleado, 'Presente', NULL, p_Fecha, p_HoraEntrada, p_HoraSalida);
    END;
    $$ LANGUAGE plpgsql;

![alt text](../Front/RegistroAsistencia.png)

### Para generar un reporte de asistencia:

    -- Crear el procedimiento
	CREATE OR REPLACE PROCEDURE GenerarReporteAsistencia(
    IN p_ID_Departamento INTEGER,
    IN p_FechaDesde DATE,
    IN p_FechaHasta DATE
    )
    AS $$
    BEGIN
            SELECT A.Fecha, A.Hora_entrada, A.Hora_salida
            FROM Asistencia A
              INNER JOIN Empleado E ON A.ID_Empleado = E.ID_Empleado
              WHERE E.ID_Departamento = p_ID_Departamento
              AND A.Fecha BETWEEN p_FechaDesde AND p_FechaHasta;
    END;
    $$ LANGUAGE plpgsql;

![alt text](../Front/GenerarReportes.png)

## Módulo: Capacitación de Personal

 ### Select para obtener el nombre de los instructores
	SELECT Instructor.ID_Instructor, Empleado.Nombre_Empleado, Empleado.Apellido_Empleado
	FROM Instructor
	INNER JOIN Empleado ON Empleado.ID_Empleado = Instructor.ID_Empleado;

### Select para obtener la asistencia de los empleados en la Sesión 1 
	SELECT Empleado.Nombre_Empleado,Empleado.Apellido_Empleado, Empleado_Sesion.Asistencia
	FROM Empleado 
	INNER JOIN Empleado_Sesion ON Empleado.ID_Empleado = Empleado_Sesion.ID_Empleado
	WHERE Empleado_Sesion.Asistencia='Asistio' AND Empleado_Sesion.ID_Sesion= 1;

### Select para identificar todos los resultados del programa capacitador 1, donde la evaluación de las sesiones hayan sido  satisfactorias
	SELECT Evaluacion_Sesion.ID_Sesion,Evaluacion_Sesion.ID_Evaluacion
 	FROM Evaluacion_Sesion 
	INNER JOIN Sesion ON Sesion.ID_Sesion=Evaluacion_Sesion.ID_Sesion
	WHERE Sesion.ID_Programa_C=1 AND Evaluacion_Sesion.Resultado='Satisfactorio' ;

## Módulo: Cese de personal
### Registrar el cese:

	-- Crear el procedimiento
	CREATE OR REPLACE PROCEDURE Registrar_cese (TIPOC CHAR(1), MOTC VARCHAR(64), FECC date, SUPC INTEGER, EMPC INTEGER)
	AS $$
	BEGIN
			INSERT INTO cese (id_cese, tipo_cese, motivo_cese, fecha_inicio_cese, id_supervisor, id_empleado)
			VALUES (
				(SELECT id_cese FROM cese
				ORDER BY id_cese DESC
				LIMIT 1)+1,
			TIPOC, MOTC, FECC, SUPC, EMPC);
	END;
	$$ LANGUAGE plpgsql;

	-- Si llenan el campo "Motivo Cese": CALL Registrar_cese ("tipo_cese", "motivo_cese", "fecha_inicio_cese", "id_supervisor", "id_empleado");
	-- Si NO llenan el campo "Motivo Cese": CALL Registrar_cese ("tipo_cese", null, "fecha_inicio_cese", "id_supervisor", "id_empleado");
	

![alt text](../Front/RegistroCese1.png)

### Registrar los beneficios y descuentos:

	--Crear el procedimiento
	CREATE OR REPLACE PROCEDURE Insertar_beneficio (TIPO_B varchar(32), MONTO_B FLOAT, ID_B INTEGER)
	AS $$
	BEGIN
			INSERT INTO beneficios_cese (id_beneficios, tipo, monto, id_Cese)
			VALUES (
				(SELECT id_beneficios FROM beneficios_cese
				ORDER BY id_beneficios DESC
				LIMIT 1)+1,
			TIPO_B, MONTO_B, ID_B);
	END;
	$$ LANGUAGE plpgsql;
	--Ejecutar el procedimiento
	-- Cuando seleccionan Liquidación: CALL Insertar_beneficio ('Liquidación', "monto", "id_cese");
	-- Cuando seleccionan CTS: CALL Insertar_beneficio ('CTS', "monto", "id_cese");
	...

![alt text](../Front/RegistroCese2.png)

### Mostrar la ficha del cese

	-- Crear el procedimiento
	CREATE OR REPLACE FUNCTION Mostrar_cese (IDC INTEGER)
	RETURNS TABLE (
	    Codigo_cesado INTEGER,
	    Nombre_cesado VARCHAR(64),
	    Nombre_departamento VARCHAR(64),
	    Cargo_cesado VARCHAR(64),
	    Suma_beneficios_descuentos FLOAT,
	    Fecha_Cese DATE,
	    Tipo_Cese TEXT,
	    Motivo_Cese VARCHAR(64),
	    Código_Supervisor INTEGER
	) AS $$
	BEGIN
	    RETURN QUERY
	        SELECT
	            C.id_empleado,
	            E.nombre_empleado,
	            D.nombre_departamento,
	            CA.nombre,
	            SUM(B.monto),
	            C.fecha_inicio_cese,
	            CASE
	                WHEN C.tipo_cese = 'D' THEN 'Despido'
	                WHEN C.tipo_cese = 'R' THEN 'Renuncia'
	                WHEN C.tipo_cese = 'C' THEN 'Término de contrato'
	                WHEN C.tipo_cese = 'J' THEN 'Jubilación'
	                ELSE 'No especificado'
	            END AS Tipo_Cese,
	            C.motivo_cese,
	            C.id_supervisor
	        FROM cese AS C
	        INNER JOIN empleado AS E ON C.id_empleado = E.id_empleado
	        INNER JOIN departamento AS D ON E.id_departamento = D.id_departamento
	        INNER JOIN cargo AS CA ON E.id_cargo = CA.id_cargo
	        INNER JOIN beneficios_cese AS B ON C.id_cese = B.id_cese
	        WHERE C.id_cese = IDC
	        GROUP BY C.id_empleado, E.nombre_empleado, C.tipo_cese, D.nombre_departamento, CA.nombre, C.fecha_inicio_cese, C.motivo_cese, C.id_supervisor;
	END;
	$$ LANGUAGE plpgsql;
	
	-- Ejecutar el procedimiento: SELECT * FROM Mostrar_cese("id_Cese");

![alt text](../Front/RegistroCese3.png)

### Registrar preguntas para la persona a cesar:

	--Crear el procedimiento
	CREATE OR REPLACE PROCEDURE Anadir_pregunta (PREG varchar(256), ID_C INTEGER)
	AS $$
	BEGIN
			INSERT INTO pregunta_salida (id_pregunta, pregunta_salida, id_cuestionario)
			VALUES (
				(SELECT id_pregunta FROM pregunta_salida
				ORDER BY id_pregunta DESC
				LIMIT 1)+1,
			PREG, ID_C);
	END;
	$$ LANGUAGE plpgsql;

	--Insertar una pregunta: CALL Anadir_pregunta("Pregunta1","ID_Cuestionario");
	--Insertar otra pregunta: CALL Anadir_pregunta("Pregunta2","ID_Cuestionario");
	...

![alt text](../Front/RegistroCese4.png)

### Resolver cuestionario:

	--Crear el procedimiento
	CREATE OR REPLACE PROCEDURE Anadir_respuesta (RESP varchar(256), ID_P INTEGER)
	AS $$
	BEGIN
			INSERT INTO respuesta_salida (id_respuesta, respuesta_salida, id_pregunta)
			VALUES (
				(SELECT id_respuesta FROM respuesta_salida
				ORDER BY id_respuesta DESC
				LIMIT 1)+1,
			RESP , ID_P);
	END;
	$$ LANGUAGE plpgsql;

	--Insertar una respuesta: CALL Anadir_respuesta("respuesta1","ID_Pregunta");
	--Insertar otra respuesta: CALL Anadir_respuesta("respuesta2","ID_Pregunta");

![alt text](../Front/CuestionarioCese.png)
