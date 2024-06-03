# Querys para registrar acciones
## Primer caso de uso (Llenado de datos)
![alt text](../Entregable3/Front/Reclutamientoparte2.png)
### El postulante ingresa a la página de postulaciones
Declaración de variables para almacenar los valores necesarios

    DECLARE @NuevoID_cand INT;
    DECLARE @NuevoID_curriculum INT;

Obtener el nuevo ID_cand y ID_curriculum de manera segura y concurrente
    
    BEGIN TRANSACTION;

Obtener el próximo ID_cand
    
    SELECT @NuevoID_cand = COALESCE(MAX(ID_cand), 0) + 1 FROM Candidato;

Obtener el próximo ID_curriculum

    SELECT @NuevoID_curriculum = COALESCE(MAX(ID_curriculum), 0) + 1 FROM Curriculum;

Insertar el nuevo registro en Candidato
    
    INSERT INTO Candidato (ID_cand, Nombre_cand, Apellido_cand, Fecha_Nac_cand, Direccion_cand, Correo_cand, Num_Telefono, ID_curriculum) 
    VALUES (@NuevoID_cand, NombreCandidato, ApellidoCandidato, FechaNacimiento, DireccionCandidato, CorreoCandidato, TelefonoCandidato, @NuevoID_curriculum);

    COMMIT TRANSACTION;
## Segundo caso de uso (Seleccionado de horario y puesto)
![alt text](../Entregable3/Front/Reclutamientoparte1.png)

### El postulante selecciona el puesto que desea y horario que desea 

Declaración de variables para almacenar los valores necesarios

    DECLARE @NuevoID_solicitud VARCHAR(8);
    DECLARE @Fecha_aplicacion DATE = GETDATE(); -- Fecha actual de la aplicación

Obtener el nuevo ID_solicitud de manera segura y concurrente

    BEGIN TRANSACTION;

Obtener el próximo ID_solicitud
    
    SELECT @NuevoID_solicitud = RIGHT('00000000' + CAST(COALESCE(MAX(CAST(ID_solicitud AS INT)), 0) + 1 AS VARCHAR), 8) FROM Solicitud_Empleo;

Insertar el nuevo registro en Solicitud_Empleo

    INSERT INTO Solicitud_Empleo (ID_solicitud, ID_Vacante, Est_solicitud, Vacante_aplicada, Horario_disponible, Fecha_aplicación, ID_cand)
    VALUES (@NuevoID_solicitud, @ID_Vacante, 'Pendiente', @Vacante_aplicada, @Horario_disponible, @Fecha_aplicacion, @NuevoID_cand);

    COMMIT TRANSACTION;

## Tercer caso de uso (Preselección de candidato)

![ ](../Entregable3/Front/Preselección.png)

Se obtiene la lista de candidatos postulados a una vacante específica.
    
    SELECT se.ID_solicitud, c.ID_cand, c.Nombre_cand, c.Apellido_cand, se.Horario_disponible, se.Est_solicitud
    FROM Solicitud_Empleo se
    JOIN Candidato c ON se.ID_cand = c.ID_cand
    WHERE se.Vacante = @ID_Vacante_Aplicada
    AND se.Est_solicitud = 'Pendiente';

Después de que el asistente marque los candidatos que cumplen con los requisitos, se actualiza el estado de la solicitud a 'Preseleccionado'.

    UPDATE Solicitud_Empleo
    SET Est_solicitud = 'Preseleccionado'
    WHERE ID_solicitud IN (@IDs_Solicitudes);

## Cuarto caso de uso (Selección Final)

![ ](../Entregable3/Front/SelecciónFinal.png)

Declaración de variables y sanitización de entrada

    DECLARE @ID_Vacante INT;

Simulación de sanitización y asignación de valor

    SET @ID_Vacante = 1; -- Este valor debería ser proporcionado por el usuario a través de la interfaz de usuario

Obtener la lista de candidatos preseleccionados para la vacante seleccionada
    
    SELECT se.ID_solicitud, c.ID_cand, c.Nombre_cand, c.Apellido_cand, se.Horario_disponible, se.Est_solicitud
    FROM Solicitud_Empleo se
    JOIN Candidato c ON se.ID_cand = c.ID_cand
    WHERE se.ID_Vacante = @ID_Vacante
    AND se.Est_solicitud = 'Preseleccionado';

Utilizamos transacciones para asegurar la consistencia de los datos y STRING_SPLIT para manejar múltiples IDs de solicitudes de empleo seleccionadas.

Declaración de variables y sanitización de entrada

    DECLARE @ID_Solicitud VARCHAR(8);

Simulación de sanitización y asignación de valor
  
    SET @ID_Solicitud = '1'; -- Este valor debería ser proporcionado por el usuario a través de la interfaz de usuario


Iniciar una transacción

    BEGIN TRANSACTION;

    BEGIN TRY

        -- Actualizar el estado del candidato seleccionado
        UPDATE Solicitud_Empleo
        SET Est_solicitud = 'Seleccionado'
        WHERE ID_solicitud = @ID_Solicitud;

        -- Notificar a los candidatos no seleccionados
        UPDATE Solicitud_Empleo
        SET Est_solicitud = 'No Seleccionado'
        WHERE ID_solicitud IN (
            SELECT ID_solicitud
            FROM Solicitud_Empleo
            WHERE ID_Vacante = (SELECT ID_Vacante FROM Solicitud_Empleo WHERE ID_solicitud = @ID_Solicitud)
            AND Est_solicitud = 'Preseleccionado'
            AND ID_solicitud != @ID_Solicitud
        );

        -- Confirmar la transacción
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Deshacer la transacción en caso de error
        ROLLBACK;

        -- Manejo de errores (log, mensajes, etc.)
        PRINT 'Error occurred during the update. Transaction rolled back.';
    END CATCH;
