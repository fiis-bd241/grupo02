# SELECTS PREDEFINIDOS

## Módulo: Evaluación de desempeño
### Obtener empleados con su departamento y cargo correspondiente:
	SELECT 
		E.ID_Empleado, 
		E.Nombre_Empleado, 
		E.Apellido_Empleado, 
		D.Nombre_Departamento, 
		C.Nombre AS Nombre_Cargo
	FROM 
		Empleado E
	JOIN 
		Departamento D ON E.ID_Departamento = D.ID_Departamento
	JOIN 
		Cargo C ON E.ID_Cargo = C.ID_Cargo;
	
### Obtener el id_cuestionario, tipo de cuestionario, id_pregunta y los enunciados de las preguntas:
	SELECT 
		C.ID_Cuestionario, 
		TC.Tipo, 
		PC.ID_Pregunta, 
		PC.Enunciado_Pregunta
	FROM 
		Cuestionario C
	JOIN
		Tipo_Cuestionario TC ON C.Id_Tipo_Cuestionario=TC.Id_Tipo_Cuestionario
	JOIN 
		Pregunta_Cuestionario PC ON C.ID_Cuestionario = PC.ID_Cuestionario;	


### Obtener empleados, cargo, departamento y sus respuestas a las preguntas del cuestionario:
	SELECT 
		E.Nombre_Empleado,
		E.Apellido_Empleado,
		Ca.nombre as Cargo_Empleado,
		D.Nombre_Departamento,
		TC.Tipo,
		PC.Enunciado_Pregunta, 
		TR.Tipo as Tipo_Respuesta,
		CE.Fecha_Rellenado,
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
		Reporte R ON CE.ID_Cuestionario_Empleado = R.ID_Cuestionario_Empleado
	JOIN
		Tipo_Cuestionario TC ON C.Id_Tipo_Cuestionario=TC.Id_Tipo_Cuestionario
	JOIN
		Tipo_Respuesta TR ON RC.Id_Tipo_Respuesta=TR.Id_Tipo_Respuesta;
 
 ### Obtener retroalimentación proporcionada a los empleados:
	SELECT
		E.ID_Empleado,
		RE.ID_Evaluador,
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
	SELECT 
		e.ID_Entrevista, 
		e.Fecha_Eva, 
		e.Hora_entrevista, 
		e.Resp_Eva, 
		e.Resultado_eva, 
		e.ID_Solicitud, 
		e.ID_Evaluacion, 
		e.ID_Empleado, 
	    em.Nombre_Empleado, 
		em.Apellido_Empleado
	FROM 
		Entrevista e
	INNER JOIN 
		Empleado em ON e.ID_Empleado = em.ID_Empleado;

### Seleccionar nombre de candidatos con sus solicitudes de empleo y estado de solicitud:
	SELECT 
		c.Nombre_cand, 
		c.Apell_cand, 
		se.Est_solicitud, 
		se.Vacante_aplicada
	FROM 
		Candidato c
	INNER JOIN 
		Solicitud_Empleo se ON c.ID_cand = se.ID_cand;

### Seleccionar vista general de las vacantes, sus departamentos asociados, los cargos y los perfiles requeridos.:
	SELECT 
		v.ID_Vac, 
		d.Nombre_departamento, 
		c.Nombre, 
		p.Conocimiento_Req
	FROM 
		Vacante v
	INNER JOIN 
		Departamento d ON v.ID_Departamento = d.ID_Departamento
	INNER JOIN 
		Cargo c ON v.ID_Cargo = c.ID_Cargo
	INNER JOIN 
		Perfil p ON v.ID_Perfil = p.ID_Perfil;

### Saber los candidatos que fueron aceptados
	SELECT 
		c.ID_cand, 
		c.Nombre_cand, 
		c.Apell_cand
	FROM 
		Candidato c
	INNER JOIN 
		Solicitud_Empleo se ON c.ID_cand = se.ID_cand
	INNER JOIN 
		Entrevista e ON se.ID_solicitud = e.ID_Solicitud
	INNER JOIN 
		Evaluacion ev ON e.ID_Evaluacion = ev.ID_Evaluacion
	WHERE 
		ev.Estado_Evaluacion = 'Aprobado';




## Módulo: Registro de asistencias y solicitudes
### Select para ver el registro de permisos
    SELECT
        P.ID_Permiso,
        CASE
            WHEN P.Tipo = 'V' THEN 'Vacaciones'
            WHEN P.Tipo = 'E' THEN 'Enfermedad'
            WHEN P.Tipo = 'C' THEN 'Calamidad'
            ELSE P.Tipo
        END AS Tipo_Permiso,
        P.Motivo,
        P.Duracion,
        P.Estado,
        P.ID_Empleado,
        E.nombre_empleado || ' ' || E.apellido_empleado AS Nombre_Empleado,
        P.ID_Supervisor,
        S.nombre_supervisor || ' ' || S.apellido_supervisor AS Nombre_Supervisor
    FROM 
		Permiso P
    INNER JOIN 
		Empleado E ON P.ID_Empleado = E.ID_Empleado
    INNER JOIN 
		Supervisor S ON P.ID_Supervisor = S.ID_Supervisor;

### Select para ver el registro de licencias
    SELECT
        L.ID_Licencia,
            CASE
            WHEN L.Tipo = 'M' THEN 'Médica'
            WHEN L.Tipo = 'P' THEN 'Paternidad'
            WHEN L.Tipo = 'M' THEN 'Maternidad'
            ELSE L.Tipo
        END AS Tipo_Licencia,
        L.Estado,
        L.Fecha_inicio,
        L.Fecha_fin,
        L.ID_Empleado,
        E.nombre_empleado || ' ' || E.apellido_empleado AS Nombre_Empleado,
        L.ID_Supervisor,
        S.nombre_supervisor || ' ' || S.apellido_supervisor AS Nombre_Supervisor
    FROM 
		Licencia L
    INNER JOIN 
		Empleado E ON L.ID_Empleado = E.ID_Empleado
    INNER JOIN 
		Supervisor S ON L.ID_Supervisor = S.ID_Supervisor;
	
### Select para ver el registro de asistencias
    SELECT
        A.ID_Asistencia,
            CASE
            WHEN A.Estado = 'P' THEN 'Presente'
            WHEN A.Estado = 'A' THEN 'Ausente'
            WHEN A.Estado = 'R' THEN 'Retardo'
        END AS Estado_Asistencia,
        A.Observacion,
        A.Fecha,
        A.Hora_entrada,
        A.Hora_salida,
        A.ID_Empleado,
        E.nombre_empleado || ' ' || E.apellido_empleado AS Nombre_Empleado,
        D.nombre_departamento AS Departamento,
        C.nombre AS Cargo
    FROM 
		Asistencia A
    INNER JOIN 
		Empleado E ON A.ID_Empleado = E.ID_Empleado
    INNER JOIN 
		Departamento D ON E.id_departamento = D.id_departamento
    INNER JOIN 
		Cargo C ON E.id_cargo = C.id_cargo;




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




## Módulo: Nómina
### Obtener el nombre del banco, tipo de cuenta, el tipo de moneda en la que se le paga y la entidad financiera del empleado 
	SELECT 
    	e.ID_Empleado AS codigo_empleado,
    	e.Apellido_Empleado AS apellidos,
   		e.Nombre_Empleado AS nombres,
    	e.DNI AS numero_de_documento,
    	e.Fecha_Ingreso AS fecha_de_ingreso,
    	c.FechaInicioCese AS fecha_de_cese,
    	cb.Nombre_Banco AS nombre_de_la_cuenta,
    	cb.Numero_Cuenta AS numero_de_cuenta,
    	cb.Tipo_Cuenta AS tipo_de_cuenta,
    	cb.Moneda,
    	cb.Nombre_Banco AS entidad_financiera
	FROM 
    	Cuenta_Bancaria cb
	JOIN 
    	Empleado e ON cb.ID_Empleado = e.ID_Empleado
	LEFT JOIN 
    	Cese c ON e.ID_Empleado = c.ID_Empleado;

### Obtener el concepto de remuneración o descuento, importe, el tipo de moneda, tipo de cuenta, fecha de emisión y el monto a pagar final
	SELECT 
    	e.ID_Empleado AS codigo_empleado,
    	e.Apellido_Empleado AS apellidos,
    	e.Nombre_Empleado AS nombres,
    	e.DNI AS numero_de_documento,
    	m.Tipo_Modificacion AS tipo_de_modificacion,
    	m.Monto_Modificacion AS monto_modificacion,
    	cb.Moneda,
    	cb.Tipo_Cuenta AS tipo_de_cuenta,
    	n.Fecha_Emision AS fecha_de_emision,
    	pt.Monto_Pagar AS monto_a_pagar
	FROM 
    	Empleado e
	JOIN 
    	Nomina n ON e.ID_Empleado = n.ID_Empleado
	JOIN 
    	Pago_Total pt ON n.ID_Pago_Total = pt.ID_Pago_Total
	JOIN 
    	Modificacion m ON pt.ID_Modificacion = m.ID_Modificacion
	JOIN 
    	Cuenta_Bancaria cb ON e.ID_Empleado = cb.ID_Empleado;
