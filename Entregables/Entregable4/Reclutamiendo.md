# Querys para registrar acciones
## Primer caso de uso (Elegir puesto y horario)
![alt text](../Entregable3/Front/Reclutamientoparte2.png)
### El postulante ingresa a la página de postulaciones
- Declaración de variables para almacenar los valores necesarios

    DECLARE @NuevoID_cand INT;
    DECLARE @NuevoID_curriculum INT;

- Obtener el nuevo ID_cand y ID_curriculum de manera segura y concurrente
    
    BEGIN TRANSACTION;

- Obtener el próximo ID_cand
    
    SELECT @NuevoID_cand = COALESCE(MAX(ID_cand), 0) + 1 FROM Candidato;

- Obtener el próximo ID_curriculum

    SELECT @NuevoID_curriculum = COALESCE(MAX(ID_curriculum), 0) + 1 FROM Curriculum;

- Insertar el nuevo registro en Candidato
    
    INSERT INTO Candidato (ID_cand, Nombre_cand, Apellido_cand, Fecha_Nac_cand, Direccion_cand, Correo_cand, Num_Telefono, ID_curriculum) 
    VALUES (@NuevoID_cand, NombreCandidato, ApellidoCandidato, FechaNacimiento, DireccionCandidato, CorreoCandidato, TelefonoCandidato, @NuevoID_curriculum);

    COMMIT TRANSACTION;
