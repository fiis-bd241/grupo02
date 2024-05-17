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
Values((SELECT ID_Sesion FROM Sesion ORDER BY ID_Sesion DESC LIMIT 1)+1,EST,FECH,HOR,(SELECT ID_Programa_C FROM Programa_Capacitador	ORDER BY ID_Programa_C DESC	LIMIT 1))
