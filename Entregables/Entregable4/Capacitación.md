# Capacitaciones
## Registrar Solicitud:


	INSERT INTO Programa_Capacitador (ID_Programa_C,Fecha_Inicio,Fecha_Fin,Motivo,ID_Departamento)
	VALUES (
				(SELECT ID_Programa_C FROM Programa_Capacitador
				ORDER BY ID_Programa_C DESC
				LIMIT 1)+1,
			FCIN, FCFI, MOT, IDDep);
   
![image](https://github.com/fiis-bd241/grupo02/assets/164259064/3e409c52-6f20-49ff-9310-a19283130ccd)


Al poner confirmar, se procederá a programar las n sesiones mediante n inserts.

	INSERT INTO Sesion(ID_Sesion,Estado,Fecha,Hora,ID_Programa_C)
	VALUES(
 				(SELECT ID_Sesion FROM Sesion ORDER BY ID_Sesion DESC LIMIT 1)+1,EST,FECH,HOR,(SELECT ID_Programa_C FROM Programa_Capacitador ORDER BY ID_Programa_C DESC LIMIT 1));

 ![image](https://github.com/fiis-bd241/grupo02/assets/164259064/45a467de-fc32-4882-8696-32b69ba0c0c7)


Los valores de la ID de la Sesion son autoincrementables, y el estado de la Sesión es "Pendiente" por default, por lo que se le agregan las fechas programadas para las sesiones y el horario de la sesion además se refiere al programa capacitador actual.

## Registrar Empleados:
	INSERT INTO Lista_Matricula(ID_Programa_C,ID_Empleado,Estado_Matricula)
 	VALUES(
  		IDPROG,IDEMP,ESTM);

![image](https://github.com/fiis-bd241/grupo02/assets/164259064/6ae72f6b-5dac-4523-87e3-efc7d9f2bfb0)


## Muestra de Empleados Matriculados en la Capacitación 

	SELECT 
 	CONCAT(Empleado.Nombre_Empleado, ' ', Empleado.Apellido_Empleado) AS Nombre_Completo,
   		Empleado.ID_Empleado,
     		Lista_Matricula.Estado_Matricula
   	FROM Empleado
    	JOIN Lista_Matricula ON Empleado.ID_Empleado= Lista_Matricula.ID_Empleado
     	JOIN Programa_Capacitador ON Lista_Matricula.ID_Programa_C = Programa_Capacitador.ID_Programa_C
	WHERE Programa_Capacitador.ID_Programa_C = @IDPrograma;

![image](https://github.com/fiis-bd241/grupo02/assets/164259064/f345fe1b-e93b-4942-8656-3fc96436a3ea)


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
 
![image](https://github.com/fiis-bd241/grupo02/assets/164259064/18dc8a6a-d283-465b-a1e8-7f1f1e64046f)


## Actualizar Asistencia de Sesiones:
	UPDATE Empleado_Sesion
	SET Asistencia = 'Asistió'
	WHERE ID_Sesion IN (@ID_sesion) AND ID_Empleado IN (@ID_Empleado1,@ID_Empleado2,@ID_Empleado3);
 
 	UPDATE Empleado_Sesion
	SET Asistencia = 'Faltó'
	WHERE ID_Sesion IN (@ID_sesion) AND ID_Empleado IN (@ID_Empleado1,@ID_Empleado2,@ID_Empleado3);
 
![image](https://github.com/fiis-bd241/grupo02/assets/164259064/e22d6067-b044-4da2-a1c2-3c06ac7cd2f7)


Se actualizará el estado de la tabla Empleado_Sesion, eligiendo una sesión específica y el ID de los empleados obtenidos en el parámetro, de la misma forma para las ausencias de los mismos empleados.
 

