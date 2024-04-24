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
### Listar todas las vacantes disponibles con su información relevante:
SELECT v.ID_Vac, d.Nombre AS Departamento, c.Nombre AS Cargo, p.Conocimiento_Req, p.Años_Exp, p.Titulo_Requerido, v.Ubicación, v.Beneficio, v.Salario, v.Horario
FROM Vacante v
INNER JOIN Departamento d ON v.ID_Departamento = d.ID_Departamento
INNER JOIN Cargo c ON v.ID_Cargo = c.ID_Cargo
INNER JOIN Perfil p ON v.ID_Perfil = p.ID_Perfil;

### Listar los candidatos que han aplicado a una vacante específica y su estado de solicitud:
SELECT s.ID_solicitud, c.Nombre_cand, c.Apell_cand, s.Est_solicitud, s.Vacante_aplicada, s.Horario_disponible, s.Fecha_aplicación
FROM Solicitud_Empleo s
INNER JOIN Candidato c ON s.ID_cand = c.ID_cand
WHERE s.ID_Vacante = 'ID_Vacante_Específica';

### Obtener detalles de una vacante específica:
SELECT v.ID_Vac, d.Nombre AS Departamento, c.Nombre AS Cargo, p.Conocimiento_Req, p.Años_Exp, p.Titulo_Requerido, v.Ubicación, v.Beneficio, v.Salario, v.Horario
FROM Vacante v
INNER JOIN Departamento d ON v.ID_Departamento = d.ID_Departamento
INNER JOIN Cargo c ON v.ID_Cargo = c.ID_Cargo
INNER JOIN Perfil p ON v.ID_Perfil = p.ID_Perfil
WHERE v.ID_Vac = 'ID_Vacante_Específica';

### Listar los candidatos que han sido evaluados en una entrevista y su resultado:
SELECT e.ID_Entrevista, e.Fecha_Eva, e.Hora_entrevista, e.Resp_Eva, e.Resultado_eva, s.Vacante_aplicada, c.Nombre_cand, c.Apell_cand
FROM Entrevista e
INNER JOIN Solicitud_Empleo s ON e.ID_Solicitud = s.ID_solicitud
INNER JOIN Candidato c ON s.ID_cand = c.ID_cand
WHERE e.Resultado_eva != 'Entrevista pendiente';

### Listar los candidatos que han sido evaluados y aprobados en una entrevista con su información de contacto:
SELECT c.Nombre_cand, c.Apell_cand, c.Correo_cand, c.Num_Telefono, e.Fecha_Eva, e.Hora_entrevista, e.Resp_Eva
FROM Entrevista e
INNER JOIN Solicitud_Empleo s ON e.ID_Solicitud = s.ID_solicitud
INNER JOIN Candidato c ON s.ID_cand = c.ID_cand
WHERE e.Resultado_eva = 'Oferta de empleo extendida';
