# Querys para registrar acciones

## R-005 / Caso de Uso 5: Registrar cese de personal

### Primera pantalla / I-001
![alt text](../Entregable3/Front/c1.png)

#### Acción 1:
Elegir la opción de cese de personal en la intranet del supervisor

	@Id_cese = (SELECT id_cese FROM cese ORDER BY id_cese DESC LIMIT 1)

### Segunda pantalla / I-002
![alt text](../Entregable3/Front/C2.png)

#### Accion 2
Seleccionar la lupa para buscar el empleado por medio de su Apellido

	SELECT 
		E.DNI, 
		E.nombre_empleado as NOMBRE,
		E.apellido_empleado as APELLIDO,
		D.nombre_departamento
	FROM empleado as E
	INNER JOIN departamento AS D ON E.id_departamento=D.id_departamento
	WHERE E.apellido_empleado LIKE 'INGRESO%'

#### Accion 3
Seleccionar el botón de SI para responder la pregunta sobre la deuda que podría poseer el trabajador con la empresa

	IF (SELECT id_cese FROM cese ORDER BY id_cese DESC LIMIT 1)+1 = @Id_Cese ( 
		INSERT INTO cese (id_cese, tipo_cese, motivo_cese, fecha_inicio_cese, id_supervisor, id_empleado)
		VALUES (
				(SELECT id_cese FROM cese ORDER BY id_cese DESC LIMIT 1)+1,
				@Tipo,
				@Motivo,
				@Fecha,
				@Sup,
				(SELECT id_empleado FROM empleado WHERE DNI = @DNI)
			);
	)
	ELSE (
		UPDATE Cese
		SET 	tipo_cese = @Tipo,
				motivo_cese = @Motivo,
				fecha_inicio_cese = @Fecha,
				id_empleado = (SELECT id_empleado FROM empleado WHERE DNI = @DNI)
		WHERE id_cese=@Id_cese
	);

#### Accion 4
Al escoger el botón de SI antes, se abre una pestaña donde el supervisor puede insertar el monto que debe el trabajador a cesar a la empresa

- RInsertar la deuda con la empresa:

		IF (SELECT id_beneficios FROM beneficios_cese WHERE id_cese = @Id_cese) EXISTS ( 
			UPDATE id_beneficios
			SET monto = -1*@Deud
			WHERE id_beneficios = (SELECT id_beneficios FROM beneficios_cese WHERE id_cese = @Id_cese ORDER BY id_beneficios ASC LIMIT 1)
		)
		ELSE (
			INSERT INTO beneficios_cese (id_beneficios, id_tipo, monto, id_Cese)
			VALUES (
				(SELECT id_beneficios FROM beneficios_cese
				ORDER BY id_beneficios DESC
				LIMIT 1)+1,
				5, 
				-1*@Deud, 
				@Id_cese
			);
		);

- Insertar los beneficios que resivirá el empleado:

		INSERT INTO beneficios_cese (id_beneficios, id_tipo, monto, id_Cese)
			VALUES
				((SELECT id_beneficios FROM beneficios_cese
				ORDER BY id_beneficios DESC
				LIMIT 1)+1,
				1, 
				(
					(SELECT Monto_pagar FROM Pago_Total as P 
					INNER JOIN Nomina as N ON P.ID_Pago_Total=N.ID_Pago_Total 
					WHERE N.id_empleado=(SELECT id_empleado FROM empleado WHERE DNI = @DNI))
				+
					(SELECT Monto_modificacion FROM Modificacion as M 
					INNER JOIN Pago_Total as P ON P.ID_Modificacion=M.id_Modificacion 
					INNER JOIN Nomina as N ON P.ID_Pago_Total=N.ID_Pago_Total
					WHERE N.id_empleado=(SELECT id_empleado FROM empleado WHERE DNI = @DNI) AND M.tipo_modificacion='Gratificacion')
				)/6*(MONTH(SELECT Fecha_Ingreso FROM Empleados WHERE DNI=@DNI)-MONTH(SELECT fecha_inicio_cese FROM cese WHERE Id_cese=@Id_cese)),
				@Id_cese);

- Seleccionar datos para visualización en la siguiente pantalla:

		SELECT
			E.DNI,
			E.nombre_empleado ||' '|| 	E.apellido_empleado,
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
			(SELECT DNI FROM empleado WHERE id_empleado = @Sup)
		FROM cese AS C
		INNER JOIN empleado AS E ON C.id_empleado = E.id_empleado
		INNER JOIN departamento AS D ON E.id_departamento = D.id_departamento
		INNER JOIN cargo AS CA ON E.id_cargo = CA.id_cargo
		INNER JOIN beneficios_cese AS B ON C.id_cese = B.id_cese
		WHERE C.id_cese = @Id_cese
		GROUP BY C.id_empleado, E.nombre_empleado, C.tipo_cese, D.nombre_departamento, CA.nombre, C.fecha_inicio_cese, C.motivo_cese, C.id_supervisor;

#### Accion 5
Seleccionar el botón NO en la pregunta

- Registrar el cese:

		IF (SELECT id_cese FROM cese ORDER BY id_cese DESC LIMIT 1)+1 = @Id_Cese ( 
			INSERT INTO cese (id_cese, tipo_cese, motivo_cese, fecha_inicio_cese, id_supervisor, id_empleado)
			VALUES (
					(SELECT id_cese FROM cese ORDER BY id_cese DESC LIMIT 1)+1,
					@Tipo,
					@Motivo,
					@Fecha,
					@Sup,
					(SELECT id_empleado FROM empleado WHERE DNI = @DNI)
				);
		)
		ELSE (
			UPDATE Cese
			SET 	tipo_cese = @Tipo,
					motivo_cese = @Motivo,
					fecha_inicio_cese = @Fecha,
					id_empleado = (SELECT id_empleado FROM empleado WHERE DNI = @DNI)
			WHERE id_cese=@Id_cese
		);

- Ingresar los beneficios:

		INSERT INTO beneficios_cese (id_beneficios, id_tipo, monto, id_Cese)
			VALUES
				((SELECT id_beneficios FROM beneficios_cese
				ORDER BY id_beneficios DESC
				LIMIT 1)+1,
				1, 
				(
					(SELECT Monto_pagar FROM Pago_Total as P 
					INNER JOIN Nomina as N ON P.ID_Pago_Total=N.ID_Pago_Total 
					WHERE N.id_empleado=(SELECT id_empleado FROM empleado WHERE DNI = @DNI))
				+
					(SELECT Monto_modificacion FROM Modificacion as M 
					INNER JOIN Pago_Total as P ON P.ID_Modificacion=M.id_Modificacion 
					INNER JOIN Nomina as N ON P.ID_Pago_Total=N.ID_Pago_Total
					WHERE N.id_empleado=(SELECT id_empleado FROM empleado WHERE DNI = @DNI) AND M.tipo_modificacion='Gratificacion')
				)/6*(MONTH(SELECT Fecha_Ingreso FROM Empleados WHERE DNI=@DNI)-MONTH(SELECT fecha_inicio_cese FROM cese WHERE Id_cese=@Id_cese)),
				@Id_cese);

- Hacer la seleccion de datos para la siguiente pantalla:

		SELECT
			E.DNI,
			E.nombre_empleado ||' '|| 	E.apellido_empleado,
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
			(SELECT DNI FROM empleado WHERE id_empleado = @Sup)
		FROM cese AS C
		INNER JOIN empleado AS E ON C.id_empleado = E.id_empleado
		INNER JOIN departamento AS D ON E.id_departamento = D.id_departamento
		INNER JOIN cargo AS CA ON E.id_cargo = CA.id_cargo
		INNER JOIN beneficios_cese AS B ON C.id_cese = B.id_cese
		WHERE C.id_cese = @Id_cese
		GROUP BY C.id_empleado, E.nombre_empleado, C.tipo_cese, D.nombre_departamento, CA.nombre, C.fecha_inicio_cese, C.motivo_cese, C.id_supervisor;

### Tercera pantalla / I-003
![alt text](../Entregable3/Front/c3.png)

### Cuarta pantalla / I-004
![alt text](../Entregable3/Front/c4.png)

#### Accion 6
Si seleccionan el botón que dice "Usar preguntas predeterminadas"

	INSERT INTO pregunta_salida (id_pregunta, pregunta_salida, id_cuestionario)
		VALUES (
		((SELECT id_pregunta FROM pregunta_salida
			ORDER BY id_pregunta DESC
			LIMIT 1)+1,
		'¿Como describirías tu experiencia en tu empresa?',
		@Id_cese),
		((SELECT id_pregunta FROM pregunta_salida
			ORDER BY id_pregunta DESC
			LIMIT 1)+2,
		'¿Qué mejorarías en la empresa?',
		@Id_cese),
		((SELECT id_pregunta FROM pregunta_salida
			ORDER BY id_pregunta DESC
			LIMIT 1)+2,
		'¿Quéno te gusta de tu empresa?',
		@Id_cese)
	);

#### Accion 7
Cuando seleccionan el botón de CONFIRMAR y han escrito más preguntas propias (a parte de las predeterminadas)

	INSERT INTO pregunta_salida (id_pregunta, pregunta_salida, id_cuestionario)
		VALUES (
			(SELECT id_pregunta FROM pregunta_salida
			ORDER BY id_pregunta DESC
			LIMIT 1)+1,
		@Id_pregunta,
		@Id_cese
	);

## R-027 / Caso de uso 27: Responder cuestionario de salida

### Quinta pantalla / I-005
![alt text](../Entregable3/Front/c5.png)


#### Accion 8
El empleado cesado entra a un link que se le envía al correo registrado donde aparece la pantalla 5, cuando le da click al botón CONTINUAR para poder cargar las preguntas del cuestionario

	SELECT pregunta_salida 
	FROM pregunta_salida
	WHERE id_cuestionario=@Id_cese

### Sexta pantalla / I-006
![alt text](../Entregable3/Front/C6.png)

#### Accion 9
Luego de llenar las preguntas de su cuestionario seleccionar el boton de SIGUIENTE

	INSERT INTO respuesta_salida (id_respuesta, respuesta_salida, id_pregunta)
		VALUES (
			(SELECT id_respuesta FROM respuesta_salida
			ORDER BY id_respuesta DESC
			LIMIT 1)+1,
			RESP , ID_P);
	
# Funcionalidad primaria elegida

Elegí al registro de cese de personal como mi actividad primaria ya que tiene más contenido con el cual trabajar que con la operación del empleado de responder el cuestionario de salida.

Usaré el requerimiento R-005 y las especificaciones de cómo va a funcionar se encuentran al inicio de esta página
