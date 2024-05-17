# Querys para registrar acciones

## Registrar el cese:

	INSERT INTO cese (id_cese, tipo_cese, motivo_cese, fecha_inicio_cese, id_supervisor, id_empleado)
	VALUES (
				(SELECT id_cese FROM cese
				ORDER BY id_cese DESC
				LIMIT 1)+1,
			TIPOC, MOTC, FECC, SUPC, EMPC);

![alt text](../Entregable3/Front/RCese1.png)

## Registrar los beneficios y descuentos:

	INSERT INTO beneficios_cese (id_beneficios, tipo, monto, id_Cese)
		VALUES (
			(SELECT id_beneficios FROM beneficios_cese
			ORDER BY id_beneficios DESC
			LIMIT 1)+1,
		TIPO_B, MONTO_B, ID_B);

![alt text](../Entregable3/Front/RCese2.png)

## Mostrar la ficha del cese

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

![alt text](../Entregable3/Front/RCese3.png)

## Registrar preguntas para la persona a cesar:

	INSERT INTO pregunta_salida (id_pregunta, pregunta_salida, id_cuestionario)
		VALUES (
			(SELECT id_pregunta FROM pregunta_salida
			ORDER BY id_pregunta DESC
			LIMIT 1)+1,
		PREG, ID_C);
	END;

![alt text](../Entregable3/Front/RegistroCese4.png)

## Resolver cuestionario:

	INSERT INTO respuesta_salida (id_respuesta, respuesta_salida, id_pregunta)
		VALUES (
			(SELECT id_respuesta FROM respuesta_salida
			ORDER BY id_respuesta DESC
			LIMIT 1)+1,
			RESP , ID_P);
	
![alt text](../Entregable3/Front/CuestionarioCese.png)
