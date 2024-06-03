# Sentencias SQL para el prototipo del módulo de Evaluación de Desempeño

## CREAR UN CUESTIONARIO

| Código requerimiento | R-001 |
|:--------------------:|:-----:|
|    Código interfaz   | I-001 |
|    Imagen interfaz   |    ![ED1](../Entregable3/Front/ED1.png)   |

### Sentencias SQL
#### Eventos

1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario

		Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

2. Botón 'Crear': Se creará un cuestionario de cierto tipo para la evaluación de desempeño.
	
		INSERT INTO Cuestionario(ID_Cuestionario,ID_Especialista_Relaciones_Laborales,ID_Tipo_Cuestionario,Fecha_Creacion,Hora_Creacion,Estado_Envio,Fecha_Envio_Gerencia,Hora_Envio_Gerencia,ID_Gerente,Estado_Aprobacion,Fecha_Revision,Hora_Revision) VALUES
		(CASE 
	        WHEN (SELECT MAX(ID_Cuestionario) FROM Cuestionario) IS NULL THEN 1
	        ELSE (SELECT MAX(ID_Cuestionario) FROM Cuestionario) + 1
	    END, <1>,<2>,CURRENT_DATE,CURRENT_TIME(0),'No enviado',NULL,NULL,20200001,NULL,NULL,NULL);

3. Botón 'Editar': Redirecciona a la página para editar el cuestionario.


## EDITAR UN CUESTIONARIO
| Código requerimiento | R-002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-002 |
|    Imagen interfaz   |    ![ED2](../Entregable3/Front/ED2.png)     |

### Sentencias SQL
#### Eventos
1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	    Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

2. Botón 'Agregar': Agrega una pregunta al cuestionario del tipo elegido.

		INSERT INTO Pregunta_Cuestionario(ID_Pregunta,ID_Cuestionario,Enunciado_Pregunta) VALUES
		(CASE 
			WHEN (Select Id_Tipo_Cuestionario from Cuestionario where Id_Cuestionario=@ID_Cuestionario)=<1> AND (SELECT MAX(ID_Pregunta) FROM Pregunta_Cuestionario WHERE ID_Cuestionario=1) IS NULL THEN 1001 ELSE (SELECT (MAX(ID_Pregunta)) FROM Pregunta_Cuestionario) + 1
			END, @ID_Cuestionario,<2>);

4. Mostrar cuestionario actual: Se mostrará preguntas del cuestionario actual de algún tipo:

	   SELECT PC.ID_Pregunta, PC.Enunciado_Pregunta 
	    FROM Pregunta_Cuestionario PC 
	    INNER JOIN Cuestionario C ON PC.ID_Cuestionario = C.ID_Cuestionario 
	    WHERE C.ID_Tipo_Cuestionario = <2>;

5. Eliminar Pregunta: Se Eliminirá una pregunta dependiendo del tipo de cuestionario.

		DELETE FROM Pregunta_Cuestionario
		WHERE ID_Cuestionario IN (
		SELECT Cu.ID_Cuestionario
		FROM Cuestionario Cu
		WHERE Cu.ID_Tipo_Cuestionario =<1>) AND ID_Pregunta = <4>;

6. Estado de envío: Se muestra el estado de envío del cuestionario.
	
		Select Estado_Envio from Cuestionario where Id_Tipo_Cuestionario=<2>;

7. Estado de aprobación: Se muestra el estado de aprobación del cuestionario.

		Select Estado_Aprobacion from Cuestionario where Id_Tipo_Cuestionario=<2>;

8. Botón 'Enviar a gerencia': Se envía a Gerencia el cuestionario.

		Update Cuestionario set Estado_Envio='Enviado', Fecha_Envio_Gerencia=Current_Date, Hora_Envio_Gerencia=Current_Time(0) where Id_Tipo_Cuestionario=<1>;


## APROBAR CUESTIONARIO
| Código requerimiento | R-003 |
|:--------------------:|:-----:|
|    Código interfaz   | I-003 |
|    Imagen interfaz   |   ![ED3](../Entregable3/Front/ED3.png)       |

### Sentencias SQL
#### Eventos

1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

3. Mostrar cuestionario actual: Se mostrará preguntas del cuestionario actual de algún tipo:

	    SELECT PC.ID_Pregunta, PC.Enunciado_Pregunta 
	    FROM Pregunta_Cuestionario PC 
	    INNER JOIN Cuestionario C ON PC.ID_Cuestionario = C.ID_Cuestionario 
	    WHERE C.ID_Tipo_Cuestionario = <1>;

5. Mostrar estado de envío: Se muestra el estado de envío del cuestionario.

	   Select Estado_Envio from Cuestionario where Id_Tipo_Cuestionario=<1>;

7. Botón 'Enviar Estado de Aprobación': Se actualiza el estado de aprobación del cuestionario.

	   Update Cuestionario set Estado_Aprobacion=<3>,Fecha_Revision=Current_Date,Hora_Revision=Current_Time(0) where Id_Tipo_Cuestionario=<1>;


## RESPONDER CUESTIONARIO
| Código requerimiento | R-004 |
|:--------------------:|:-----:|
|    Código interfaz   | I-004 |
|    Imagen interfaz   |   ![ED4](../Entregable3/Front/ED4.png)       |

### Sentencias SQL
#### Eventos
1. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

2. Botón 'Enviar Respuestas': Se envían las respuesta del empleado.

	   INSERT INTO Cuestionario_Empleado(ID_Cuestionario_Empleado,ID_Empleado,ID_Cuestionario,Fecha_Rellenado,Hora_Rellenado) VALUES
	    (CASE 
	            WHEN (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Cuestionario_Empleado) FROM Cuestionario_Empleado) + 1
	        END,<1>,<2>,Current_Date,Current_Time(0));


	    INSERT INTO Respuesta_Cuestionario(ID_Respuesta,ID_Pregunta,ID_Cuestionario_Empleado,ID_Tipo_Respuesta) VALUES
	        (CASE 
	            WHEN (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Respuesta) FROM Respuesta_Cuestionario) + 1
	        END, <3>,(Select ID_Cuestionario_Empleado FROM Cuestionario_Empleado where ID_Empleado=<2>),<4>);

3. Mostrar tipos de respuesta: Selección del tipo de respuesta.

	   SELECT Id_Tipo_Respuesta,Tipo from Tipo_Respuesta;

## REVISAR CUESTIONARIOS
| Código requerimiento | R-005 |
|:--------------------:|:-----:|
|    Código interfaz   | I-005 |
|    Imagen interfaz   |   ![ED5](../Entregable3/Front/ED5.png)       |

### Sentencias SQL
#### Eventos
1. Mostrar cuestionarios completados: Se muestran los cuestionarios que han sido rellenados.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado;

2. Mostrar tipos de cuestionarios: Selección del tipo de cuestionario.

	   Select Id_Tipo_Cuestionario,Tipo from Tipo_Cuestionario;

3. Mostrar cuestionario por nombre: Se muestran los empleados según el apellido escrito.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado WHERE
	    Em.Apellido_Empleado=<1>;

4. Mostrar cuestionario por tipo: Se muestran los empleados según el tipo de cuestionario que se haya escogido.

	   Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado inner join
	    Cuestionario CU on CE.ID_Cuestionario=Cu.ID_Cuestionario where Cu.ID_Tipo_Cuestionario=<2>;

5. Mostrar cuestionario por calificación: Se muestran los empleados según el tipo de calificación que se haya escogido.

	    Select Em.Id_Empleado,Em.Apellido_Empleado,Em.Nombre_Empleado from Empleado Em inner join Cuestionario_Empleado CE on Em.Id_Empleado=CE.Id_Empleado inner join
	    Reporte Re on Re.Id_Cuestionario_Empleado=CE.Id_Cuestionario_Empleado where calificacion_empleado=<3>;

6. Botón 'Realizar Reporte': Redirecciona la página para realizar el reporte de uno de los empleados que han completado la encuesta.



## REALIZAR REPORTE
| Código requerimiento | R-005 |
|:--------------------:|:-----:|
|    Código interfaz   | I-006 |
|    Imagen interfaz   |    ![ED6](../Entregable3/Front/ED6.png)      |

### Sentencias SQL
#### Eventos
1. Mostrar datos del empleado: Se muestra el ID, apellido, ID_Cuestionario_Empleado y el tipo de cuestionario;

	   SELECT DISTINCT Em.id_empleado, Em.nombre_empleado, Em.apellido_empleado, Ce.ID_Cuestionario_Empleado, TC.Tipo
	    FROM Empleado Em
	    INNER JOIN Cuestionario_Empleado CE ON Em.id_empleado = CE.id_empleado
	    INNER JOIN Cuestionario Cu ON CE.id_cuestionario = Cu.id_cuestionario
	    INNER JOIN Tipo_Cuestionario TC ON Cu.id_tipo_cuestionario = TC.id_tipo_cuestionario where em.id_empleado=<1>;

2. Mostrar las respuestas del empleado: Se muestran las respuestas del empleado a cada pregunta.

	   SELECT 
	        PC.ID_Pregunta,
	        PC.Enunciado_Pregunta,
	        TR.Tipo AS Respuesta
	    FROM 
	        Empleado Em
	    INNER JOIN 
	        Cuestionario_Empleado CE ON Em.id_empleado = CE.id_empleado
	    INNER JOIN 
	        Respuesta_Cuestionario RC ON CE.ID_Cuestionario_Empleado = RC.ID_Cuestionario_Empleado
	    INNER JOIN 
	        Pregunta_Cuestionario PC ON RC.ID_Pregunta = PC.ID_Pregunta
	    INNER JOIN 
	        Tipo_Respuesta TR ON RC.ID_Tipo_Respuesta = TR.ID_Tipo_Respuesta
	    WHERE 
	        Em.id_empleado = <1>;
        
3. Mostrar tipps de calificación: Selección del tipo de calificación.
   
	    SELECT Id_Tipo_Respuesta,Tipo from Tipo_Respuesta;

4. Botón 'Confirmar reporte': Confirma la calificación y la retroalimentación al cuestionario del empleado.
   
	    INSERT INTO Reporte (ID_Reporte, ID_Cuestionario_Empleado, Fecha_Ingreso_Empleado, Calificacion_Empleado)
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Reporte) FROM Reporte) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Reporte) FROM Reporte) + 1
	        END,
	        <2>,(Select Fecha_Ingreso from Empleado where ID_empleado=<1>),<4>);

	    INSERT INTO Retroalimentacion (ID_Retroalimentacion, ID_Reporte, Enunciado_Retroalimentacion, ID_Evaluador, Fecha_Retroalimentacion, Hora_Retroalimentacion)
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) IS NULL THEN 1
	            ELSE (SELECT MAX(ID_Retroalimentacion) FROM Retroalimentacion) + 1
	        END,
	        (SELECT Re.ID_Reporte
	        FROM Reporte Re
	        INNER JOIN Cuestionario_Empleado CE ON Re.ID_Cuestionario_Empleado = CE.ID_Cuestionario_Empleado
	        WHERE CE.ID_Empleado = <1>
	        LIMIT 1),
	        <5>, <6>, CURRENT_DATE, CURRENT_TIME(0)
	    );

## REVISAR MIS RESULTADOS
| Código requerimiento | R-006 |
|:--------------------:|:-----:|
|    Código interfaz   | I-007 |
|    Imagen interfaz   |   ![ED7](../Entregable3/Front/ED7.png)       |

### Sentencias SQL
#### Eventos
1. Mostrar resultados: Se muestran los resultados del empleado.
   
	    SELECT 
	        Em.ID_Empleado, 
	        Re.Fecha_Ingreso_Empleado, 
	        Re.Calificacion_Empleado, 
	        Ret.Enunciado_Retroalimentacion
	    FROM 
	        Empleado Em
	    INNER JOIN 
	        Cuestionario_Empleado CE ON Em.ID_Empleado = CE.ID_Empleado
	    INNER JOIN 
	        Reporte Re ON CE.ID_Cuestionario_Empleado = Re.ID_Cuestionario_Empleado
	    INNER JOIN 
	        Retroalimentacion Ret ON Re.ID_Reporte = Ret.ID_Reporte
	    WHERE 
	        Em.ID_Empleado = <1>; 


## PROGRAMAR REUNIÓN
| Código requerimiento | R-007 |
|:--------------------:|:-----:|
|    Código interfaz   | I-008 |
|    Imagen interfaz   |   ![ED8](../Entregable3/Front/ED8.png)       |

### Sentencias SQL
#### Eventos
1. Botón 'Programar': Se programa una reunión.
   
	    INSERT INTO Reunion (ID_Reunion, ID_Organizador, Asunto_Reunion, Fecha_Reunion, Hora_Reunion) 
	    VALUES (
	        CASE 
	            WHEN (SELECT MAX(ID_Reunion) FROM Reunion) IS NULL THEN 1 
	            ELSE (SELECT MAX(ID_Reunion) FROM Reunion) + 1 
	        END, <1>, <2>, <3>,<4>);

## REUNIONES PENDIENTES
| Código requerimiento | R-008 |
|:--------------------:|:-----:|
|    Código interfaz   | I-009 |
|    Imagen interfaz   |    ![ED9](../Entregable3/Front/ED9.png)      |

### Sentencias SQL
#### Eventos
1. Mostrar reuniones: Se muestra las reuniones pendientes:
	   
		SELECT Asunto_Reunion, Fecha_Reunion, Hora_Reunion
		    FROM Reunion;

