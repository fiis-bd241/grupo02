# Capacitaciones
## Registrar Solicitud:


	INSERT INTO Programa_Capacitador (ID_Programa_C,Fecha_Inicio,Fecha_Fin,Motivo,ID_Departamento)
	VALUES (
				(SELECT ID_Programa_C FROM Programa_Capacitador
				ORDER BY ID_Programa_C DESC
				LIMIT 1)+1,
			FCIN, FCFI, MOT, IDDep);
   
![Solicitud Capacitacion](https://github.com/fiis-bd241/grupo02/assets/164259064/776eedbf-ac45-4a5b-86b0-a098c9b7c6a3)

Al poner confirmar, se procederá a programar las n sesiones mediante n inserts.

	INSERT INTO Sesion(ID_Sesion,Estado,Fecha,Hora,ID_Programa_C)
	VALUES(
 				(SELECT ID_Sesion FROM Sesion ORDER BY ID_Sesion DESC LIMIT 1)+1,EST,FECH,HOR,(SELECT ID_Programa_C FROM Programa_Capacitador ORDER BY ID_Programa_C DESC LIMIT 1));

  ![Resistrar Sesion](https://github.com/fiis-bd241/grupo02/assets/164259064/ecbba794-9d27-4f99-8985-f04f5a01147d)

Los valores de la ID de la Sesion son autoincrementables, y el estado de la Sesión es "Pendiente" por default, por lo que se le agregan las fechas programadas para las sesiones y el horario de la sesion además se refiere al programa capacitador actual.

## Registrar Empleados:
	INSERT INTO Lista_Matricula(ID_Programa_C,ID_Empleado,Estado_Matricula)
 	VALUES(
  		IDPROG,IDEMP,ESTM);

![Matricula Empleado Programa](https://github.com/fiis-bd241/grupo02/assets/164259064/4521524a-5523-4fc5-aeaf-9eae8f561f44)

## Muestra de Empleados Matriculados en la Capacitación 

	SELECT 
 	CONCAT(Empleado.Nombre_Empleado, ' ', Empleado.Apellido_Empleado) AS Nombre_Completo
   		Empleado.ID_Empleado,
     		Lista_Matricula.Estado_Matricula
   	FROM Empleado
    	JOIN Listra_Matricula ON Empleado.ID_Empleado= Lista_Matricula.ID_Empleado
     	JOIN Programa_Capacitador ON Lista_Matricula.ID_Programa_C = Programa_Capacitador.ID_Programa_C
	WHERE Programa_Capacitador.ID_Programa_C = @IDPrograma;

![Lista Capacitacion](https://github.com/fiis-bd241/grupo02/assets/164259064/a5f8d22f-74dd-48d5-8b92-b794c6331ffb)

## Muestra de Capacitaciones:
	SELECT 
	    d.Nombre_Departamento, 
	    p.ID_Departamento, 
	    COUNT(DISTINCT s.ID_Sesion) AS Numero_Sesiones, 
	    p.Fecha_Inicio AS Fecha_Programa, 
	    COUNT(DISTINCT lm.ID_Empleado) AS Total_Empleados, 
	    p.Motivo
	FROM 
	    Programa_Capacitador p
	JOIN 
	    Departamento d ON p.ID_Departamento = d.ID_Departamento
	LEFT JOIN 
	    Sesion s ON p.ID_Programa_C = s.ID_Programa_C
	LEFT JOIN 
	    Lista_Matricula lm ON p.ID_Programa_C = lm.ID_Programa_C
	GROUP BY 
	    d.Nombre_Departamento, 
	    p.ID_Departamento, 
	    p.Fecha_Inicio, 
	    p.Motivo
	ORDER BY 
	    d.Nombre_Departamento, 
	    p.ID_Departamento, 
	    p.Fecha_Inicio;
 
 ![Solicitud de Capacitacion Muestra](https://github.com/fiis-bd241/grupo02/assets/164259064/33e1fea1-c165-4ffa-b711-a836c1ae4adc)

