# Querys para registrar acciones

## Primer caso de uso (Para solicitar una licencia médica):
![alt text](../Entregable3/Front/SolicitudFalta.png)

### El empleado ingresa a la pantalla de solicitud de licencias:
Primero se guarda el nuevo identificador de la solicitud de licencia:
	@Id_licencia = (SELECT id_licencia FROM licencia ORDER BY id_licencia DESC LIMIT 1)

### Búsqueda del empleado por su código (En la barra de códigos):
Si el empleado escribe su código, digamos '20220003' y le da a buscar se ejecuta:

	SELECT 
		E.ID_Empleado, 
		D.nombre_departamento,
	FROM empleado as E
	INNER JOIN departamento AS D ON E.id_departamento=D.id_departamento
	WHERE E.ID_Empleado= '%20220003%'

### Solicitar licencia médica:
El empleado con id @emp ya identificó su código de empleado, ya redactó el motivo de su solicitud de licencia, aclaró las fechas de inicio y de fin y adjuntó su constancia médica.

Si el empleado le da al botón 'CONFIRMAR':

	IF (SELECT id_licencia FROM licencia ORDER BY id_licencia DESC LIMIT 1)+1 = @Id_Licencia ( 
		INSERT INTO licencia (id_licencia, tipo, estado, fecha_inicio, fecha_fin, id_empleado, id_supervisor)
		VALUES (
				(SELECT id_licencia FROM licencia ORDER BY id_licencia DESC LIMIT 1)+1,
				@Tipo,
				@Fecha_I,
                @Fecha_F,
				@Emp,
				(SELECT id_empleado FROM empleado WHERE CODIGO = @CODIGO)
			);
	)
	ELSE (
		UPDATE Licencia
		SET 	tipo = @Tipo,
				fecha_inicio = @Fecha_I,
                fecha_fin = @Fecha_F,
				id_empleado = (SELECT id_empleado FROM empleado WHERE CODIGO = @CODIGO)
		WHERE id_licencia=@Id_licencia
	);

## Segundo caso de uso (Para aceptar o rechazar solicitudes de licencia de cualquier tipo):
![alt text](../Entregable3/Front/AceptarSolicitud.png)

    -- Aceptar una licencia
    UPDATE Licencia
    SET estado = 'Aprobado'
    WHERE id_licencia = 456 AND estado = 'Pendiente';

    -- Rechazar una licencia  
    UPDATE Licencia
    SET estado = 'Rechazado'
    WHERE id_licencia = 789 AND estado = 'Pendiente';

## Para registrar asistencias:
![alt text](../Entregable3/Front/RegistroAsistencia.png)

    INSERT INTO Asistencia (ID_Asistencia, Estado, Observacion, Fecha, Hora_entrada, Hora_salida, ID_Empleado)
        VALUES (
            (SELECT COALESCE(MAX(ID_Asistencia), 0) + 1 FROM Asistencia),
        EST,
        OBS,
        FEC,
        HRE,
        HRS,
        ID_A,
);

## Para generar un reporte de asistencia:
![alt text](../Entregable3/Front/GenerarReportes.png)

    SELECT
        A.ID_Asistencia,
        A.Estado,
        A.Observacion,
        A.Fecha,
        A.Hora_entrada,
        A.Hora_salida,
        E.Nombre_Empleado,
        D.Nombre_Departamento,
        C.Nombre
    FROM Asistencia A
    INNER JOIN Empleado E ON A.id_empleado = E.id_empleado
    INNER JOIN Departamento D ON E.id_departamento = D.id_departamento
    INNER JOIN Cargo C ON E.id_cargo = C.id_cargo
    WHERE A.fecha BETWEEN '2020-01-01' AND '2020-12-31'
    ORDER BY A.fecha DESC, A.hora_entrada DESC;
 