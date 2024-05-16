# SELECTS PREDEFINIDOS

## Módulo: Evaluación de desempeño
### Obtener empleados con su departamento y cargo correspondiente:
	SELECT E.ID_Empleado, E.Nombre_Empleado, E.Apellido_Empleado, D.Nombre_Departamento, C.Nombre AS Nombre_Cargo
	FROM Empleado E
	JOIN Departamento D ON E.ID_Departamento = D.ID_Departamento
	JOIN Cargo C ON E.ID_Cargo = C.ID_Cargo;
	
### Obtener el id_cuestionario, tipo de cuestionario, id_pregunta y los enunciados de las preguntas:
	SELECT C.ID_Cuestionario, C.Tipo_Cuestionario, PC.ID_Pregunta, PC.Enunciado_Pregunta
	FROM Cuestionario C
	JOIN Pregunta_Cuestionario PC ON C.ID_Cuestionario = PC.ID_Cuestionario;

### Obtener empleados, cargo, departamento y sus respuestas a las preguntas del cuestionario:
		SELECT E.Nombre_Empleado,E.Apellido_Empleado,Ca.nombre as Cargo_Empleado,D.Nombre_Departamento,C.Tipo_Cuestionario,
    PC.Enunciado_Pregunta, RC.Enunciado_Respuesta,CE.Fecha_Rellenado,
    CE.Hora_Rellenado
	FROM 
		Empleado E
	JOIN 
		Cargo Ca on Ca.ID_cargo=E.ID_Cargo
	JOIN 
		Departamento D ON E.ID_Departamento = D.ID_Departamento
	JOIN 
		Cuestionario_Empleado CE ON E.ID_Empleado = CE.ID_Empleado
	JOIN 
		Cuestionario C ON CE.ID_Cuestionario = C.ID_Cuestionario
	JOIN 
		Pregunta_Cuestionario PC ON C.ID_Cuestionario = PC.ID_Cuestionario
	JOIN 
		Respuesta_Cuestionario RC ON PC.ID_Pregunta = RC.ID_Pregunta AND CE.ID_Cuestionario_Empleado = RC.ID_Cuestionario_Empleado
	JOIN 
		Reporte R ON CE.ID_Cuestionario_Empleado = R.ID_Cuestionario_Empleado;
 
 ### Obtener retroalimentación proporcionada a los empleados:
	SELECT
	E.ID_Empleado,
	RE.ID_Gerente,
	Re.ID_Especialista_Relaciones_Laborales,
    E.Nombre_Empleado,
    E.Apellido_Empleado,
	RE.Id_Retroalimentacion,
    RE.Enunciado_Retroalimentacion
	FROM
		Retroalimentacion RE
	JOIN
		Reporte R ON R.ID_Reporte = RE.ID_Reporte
	JOIN
		Cuestionario_Empleado CE ON R.ID_Cuestionario_Empleado=CE.ID_Cuestionario_Empleado
	JOIN
		Empleado E ON CE.ID_Empleado = E.ID_Empleado;




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


### Seleccionar vista general de las vacantes, sus departamentos asociados, los cargos y los perfiles requeridos.:
	SELECT v.ID_Vac, d.Nombre_departamento, c.Nombre, p.Conocimiento_Req
	FROM Vacante v
	INNER JOIN Departamento d ON v.ID_Departamento = d.ID_Departamento
	INNER JOIN Cargo c ON v.ID_Cargo = c.ID_Cargo
	INNER JOIN Perfil p ON v.ID_Perfil = p.ID_Perfil;
### Saber los candidatos que fuero aceptados
	SELECT c.ID_cand, c.Nombre_cand, c.Apell_cand
	FROM Candidato c
	INNER JOIN Solicitud_Empleo se ON c.ID_cand = se.ID_cand
	INNER JOIN Entrevista e ON se.ID_solicitud = e.ID_Solicitud
	INNER JOIN Evaluacion ev ON e.ID_Evaluacion = ev.ID_Evaluacion
	WHERE ev.Estado_Evaluacion = 'Aprobado';

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

### Select para ver el registro de los ceses
	SELECT 
		id_cese,
		CASE
			WHEN tipo_cese = 'D' THEN 'Despido'
			WHEN tipo_cese = 'R' THEN 'Renuncia'
			WHEN tipo_cese = 'C' THEN 'Término de contrato'
			WHEN tipo_cese = 'J' THEN 'Jubilación'
			ELSE 'No especificado'
		END AS Tipo_Cese,
		fecha_inicio_cese,
		id_empleado,
		id_supervisor,
		motivo_cese
	FROM CESE;

### Select para ver los datos de los empleados cesados
	SELECT 
		C.id_cese,
		CASE
			WHEN tipo_cese = 'D' THEN 'Despido'
			WHEN tipo_cese = 'R' THEN 'Renuncia'
			WHEN tipo_cese = 'C' THEN 'Término de contrato'
			WHEN tipo_cese = 'J' THEN 'Jubilación'
			ELSE 'No especificado'
		END AS Tipo_Cese,
		C.fecha_inicio_cese as Fecha,
		C.id_empleado,
		E.nombre_empleado || ' ' || E.apellido_empleado as "Nombre completo",
		D.nombre_departamento as Departamento,
		Ca.nombre as Cargo
	FROM Cese as C
	INNER JOIN Empleado as E on C.id_empleado=E.id_empleado
	INNER JOIN Departamento as D on D.id_departamento=E.id_departamento
	INNER JOIN Cargo as Ca on Ca.id_cargo=E.id_cargo