## Requisitos el Procedimiento de Capacitaciones:

1. **Registro de Capacitaciones:**
   - El sistema debe permitir la creación y registro de eventos de capacitación presenciales para los empleados.
   - Debe incluir información detallada sobre cada capacitación, como título, descripción, fecha, duración, ubicación y facilitador.

2. **Solicitud de Participación:**
   - Los empleados deben poder solicitar participar en las capacitaciones disponibles a través del sistema.
   - Deben indicar su interés en asistir a un evento de capacitación específico, proporcionando información adicional si es necesario.

3. **Aprobación de Participación:**
   - Los supervisores o responsables de capacitación deben revisar y aprobar las solicitudes de participación de los empleados.
   - Deben considerar la relevancia de la capacitación para el desarrollo profesional del empleado y la disponibilidad de cupos en el evento.

4. **Programación de Eventos:**
   - El sistema debe permitir la programación de eventos de capacitación presenciales, especificando fechas, horarios, ubicaciones y facilitadores.
   - Debe enviar notificaciones automáticas a los empleados y supervisores sobre los detalles del evento y la confirmación de participación.

5. **Registro de Asistencia:**
   - Debe ser posible registrar la asistencia de los empleados a los eventos de capacitación de forma presencial.
   - Se deben implementar métodos de registro de asistencia, como listas de asistencia físicas o sistemas de registro automatizado (por ejemplo, escaneo de códigos QR).

6. **Evaluación de Impacto:**
   - Después de cada evento de capacitación, se debe realizar una evaluación del impacto en el desempeño y desarrollo de los empleados.
   - Deben recopilarse y analizarse datos sobre la efectividad de la capacitación para identificar áreas de mejora y ajustar futuros eventos.

7. **Historial de Capacitaciones:**
   - El sistema debe mantener un historial completo de las capacitaciones realizadas por cada empleado, incluyendo eventos asistidos, fechas y horas de participación.

8. **Seguimiento del Cumplimiento:**
   - Debe ser posible realizar un seguimiento del cumplimiento de los planes de capacitación por parte de los empleados y los departamentos.
   - Deben generarse informes para identificar tendencias de capacitación y asegurar el cumplimiento de los objetivos organizacionales.

9. **Feedback y Evaluación del Evento:**
    - Los empleados deben poder proporcionar feedback sobre los eventos de capacitación realizados para mejorar la calidad de futuras capacitaciones.
    - Debe ser posible evaluar la efectividad de cada evento y realizar ajustes según las necesidades y comentarios recibidos.
 
 ## Caso de uso 3 : Solicitar capacitación

|         Objetivo         | Un empleado solicita una capacitación a través del sistema de Recursos Humanos                                                    |
| :----------------------: | --------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El empleado busca en el catálogo de cursos disponibles y solicita la capacitación que desea realizar.                             |
|          Actor           | <p align="center"> Colaboradores                                                                                                       |
|       Precondición       | <p align="center">El empleado tiene acceso al sistema de Recursos Humanos y el catálogo de cursos de capacitación está disponible |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                   |
|            1             | El empleado ingresa al módulo de Procedimiento de Capacitaciones                                                                  |
|            2             | Busca el curso de capacitación que desea realizar                                                                                 |
|            3             | Selecciona la opción "Solicitar capacitación"                                                                                     |
|            4             | Completa el formulario de solicitud con la información requerida (por ejemplo, fecha preferida, motivo de la solicitud)           |
|            5             | Revisa y valida la información ingresada                                                                                          |
|            6             | Envía la solicitud                                                                                                                |


## Caso de uso 4 : Aprobar solicitud de capacitación

|         Objetivo         | El responsable de Recursos Humanos aprueba o rechaza la solicitud de capacitación de un empleado                                            |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos revisa la solicitud de capacitación y la aprueba si hay cupos disponibles y el presupuesto lo permite    |
|          Actor           | <p align="center"> Jefe de área                                                                                          |
|       Precondición       | <p align="center"> La solicitud de capacitación ha sido enviada por el empleado y la información del curso de capacitación está disponible. |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                             |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Procedimiento de Capacitaciones                                                     |
|            2             | Busca la solicitud de capacitación que desea revisar                                                                                        |
|            3             | Selecciona la opción "Aprobar" o "Rechazar"                                                                                                 |
|            4             | Si la solicitud es aprobada, indica la fecha y hora de la capacitación                                                                      |
|            5             | Si la solicitud es rechazada, indica el motivo del rechazo                                                                                  |
|            6             | Envía la respuesta al empleado                                                                                                              |
