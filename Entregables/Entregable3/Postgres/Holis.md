
## Módulo: Cese de personal
### Listar el estado del cese del empleado con sus datos:
	SELECT 
		E.id_empleado as ID_Empleado,
		E.nombre_empleado ||' '|| apellido_empleado as Nombre_Completo,
		C.estadocese as Estado_Cese
	FROM empleado as E
	INNER JOIN cese as C ON E.id_empleado=C.id_empleado;
![Estado](imágenes/Estado_Cese.png)
### Listar los ceses completados y el abono o descuento que se le va hacer al trabajador
	SELECT 
		C.id_empleado as ID_Empleado,
		C.estadocese as Estado_Cese,
		B.tipo as Tipo,
		SUM(B.monto) as Monto,
		CASE
				WHEN SUM(B.monto) < 0 THEN 'Descuento'
				WHEN SUM(B.monto) > 0 THEN 'Bono'
				ELSE 'No hay'
			END AS CASO
	FROM beneficios_cese as B
	INNER JOIN cese as C ON B.id_cese=C.id_cese
	GROUP BY C.id_empleado, C.estadocese, B.tipo
![Monto](imágenes/Monto_Cese.png)
### Listar las preguntas realizadas y sus respuestas en el cuestionario de salida
	SELECT 
		C.id_empleado as ID_Empleado,
		S.fecha_cuestionario as Fecha,
		P.pregunta_salida as Pregunta,
		P.respuesta_salida as Respuesta
	FROM cuestionario_salida as S
	INNER JOIN cese as C ON S.id_cese=C.id_cese
	INNER JOIN pregunta_salida as P ON S.id_cuestionario = P.id_cuestionario
![Monto](imágenes/Cuestionario_Cese.png)
### Revisar los supervisores encargados del cese y cuestionario
	SELECT 
		E.nombre_empleado ||' '|| E.apellido_empleado as Nombre_Supervisor,
		E.id_empleado as ID_Supervisor,
		CESE.id_cese as ID_Cese,
		Cesado.NOM ||' '|| Cesado.APE as Nombre_Cesado,
		Cesado.ID as ID_Cesado
	FROM empleado as E 
	INNER JOIN supervisor as SUP on SUP.id_empleado = E.id_empleado
	INNER JOIN cuestionario_salida as C on C.id_supervisor = SUP.id_supervisor
	INNER JOIN Cese as CESE on CESE.id_cese = C.id_cese
	INNER JOIN (SELECT ID_empleado as ID, nombre_empleado as NOM, apellido_empleado as APE FROM empleado) as Cesado ON Cesado.ID=CESE.id_empleado
![Monto](imágenes/Super_Cese.png)

