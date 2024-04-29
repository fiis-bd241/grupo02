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
### Obtener la lista de asistencias de un empleado en particular:
    SELECT a.ID_Asistencia, a.Estado, a.Observacion, a.Fecha, a.Hora_entrada, a.Hora_salida
	FROM Asistencia a
	INNER JOIN Empleado e ON a.ID_Empleado = e.ID_Empleado
	WHERE e.ID_Empleado = <<ID del empleado>>; 
### Obtener la lista de solicitudes de permiso pendientes de aprobación:
    SELECT p.ID_Permiso, p.Tipo, p.Motivo, p.Duracion
	FROM Permiso p
	WHERE p.Estado = 'Pendiente';
### Obtener la lista de licencias aprobadas para un supervisor en particular:
    SELECT l.ID_Licencia, l.Tipo, l.Estado, l.Fecha_inicio, l.Fecha_fin
	FROM Licencia l
	INNER JOIN Supervisor s ON l.ID_Supervisor = s.ID_Supervisor
 	WHERE s.ID_Supervisor = <<ID del supervisor>> AND l.Estado = 'Aprobado';
 
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
			INSERT INTO Registrar_cese (id_cese, tipo_cese, motivo_cese, fecha_inicio_cese, id_supervisor, id_empleado)
			VALUES (
				(SELECT id_beneficios FROM beneficios_cese
				ORDER BY id_beneficios DESC
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
	-- Cuando seleccionan Liquidación: CALL Insert_beneficio ('Liquidación', "monto", "id_cese");
	-- Cuando seleccionan CTS: CALL Insert_beneficio ('CTS', "monto", "id_cese");
	...

![alt text](../Front/RegistroCese2.png)

### Mostrar la ficha del cese

	-- Crear el procedimiento
	CREATE OR REPLACE PROCEDURE Mostrar_cese (IDC INTEGER)
	AS $$
	BEGIN
			SELECT
				C.id_empleado as Codigo_cesado,
				E.nombre_empleado as Nombre_cesado,
				D.nombre_departamento as Nombre_departamento,
				CA.nombre as Cargo_cesado,
				SUM(B.monto) as Suma_beneficios_descuentos,
				C.fecha_inicio_cese as Fecha_Cese,
				CASE
					WHEN C.tipo_cese = 'D' THEN 'Despido'
					WHEN C.tipo_cese = 'R' THEN 'Renuncia'
					WHEN C.tipo_cese = 'C' THEN 'Término de contrato'
					WHEN C.tipo_cese = 'J' THEN 'Juvilación'
					ELSE 'No especificado'
				END AS Tipo_Cese,
				C.motivo_cese as Motivo_Cese,
				C.id_supervisor as Código_Supervisor
			FROM Cese as C
			INNER JOIN Empleado as E On C.id_empleado=E.id_empleado
			INNER JOIN Departamento as D On E.id_departamento=D.id_departamento
			INNER JOIN cargo as CA On E.id_cargo = CA.id_cargo
			INNER JOIN beneficios_cese as B on C.id_cese=B.id_cese
			WHERE C.id_Cese = IDC
			GROUP BY C.id_empleado, E.nombre_empleado, C.tipo_cese, D.nombre_departamento, CA.nombre, C.fecha_inicio_cese, C.motivo_cese, C.id_supervisor;
	END;
	$$ LANGUAGE plpgsql;

	-- Ejecutar el procedimiento: CALL Mostrar_Cese(id_cese);

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