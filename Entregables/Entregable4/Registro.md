# Querys para registrar acciones

## Para solicitar una licencia médica:
    
	INSERT INTO Licencia (id_licencia, tipo, estado, fecha_inicio, fecha_fin, id_empleado, id_supervisor)
        VALUES (
            (SELECT id_licencia FROM Licencia ORDER BY id_licencia DESC LIMIT 1) + 1,
        TIP,
        EST,
        FECHI,
        FECHF,
        ID_E,
        ID_S
);

![alt text](../Front/SolicitudFalta.png)

## Para aceptar o rechazar solicitudes de licencia de cualquier tipo:

    -- Aceptar una licencia
    UPDATE Licencia
    SET estado = 'A'
    WHERE id_licencia = 456 AND estado = 'P';

    -- Rechazar una licencia  
    UPDATE Licencia
    SET estado = 'R'
    WHERE id_licencia = 789 AND estado = 'P';

![alt text](../Front/AceptarSolicitud.png)

## Para registrar asistencias:

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

![alt text](../Front/RegistroAsistencia.png)

## Para generar un reporte de asistencia:

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
 
![alt text](../Front/GenerarReportes.png)