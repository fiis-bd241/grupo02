## Requisitos de Registro de Asistencias y Solicitudes:

1. **Registro de Asistencias:**
   - El sistema debe permitir el registro de las asistencias de los empleados, incluyendo la fecha, hora de entrada y salida, así como cualquier ausencia justificada o no justificada.
   - Debe ser posible registrar diferentes tipos de ausencias, como vacaciones, licencias médicas, días feriados, entre otros.

2. **Gestión de Horarios:**
   - Debe permitir la gestión de los horarios de trabajo de los empleados, incluyendo la asignación de turnos, días libres y horas extras.
   - Debe ser posible visualizar y modificar los horarios de manera flexible, teniendo en cuenta las necesidades operativas y las preferencias de los empleados.

3. **Control de Solicitudes:**
   - El sistema debe permitir a los empleados realizar solicitudes de ausencia, como vacaciones, licencias médicas o permisos.
   - Debe existir un flujo de aprobación para las solicitudes, donde los supervisores puedan revisar y aprobar o rechazar las solicitudes de sus subordinados.

4. **Notificaciones Automatizadas:**
   - Deben enviarse notificaciones automáticas a los supervisores y empleados involucrados cuando se realice una solicitud de ausencia.
   - Las notificaciones deben incluir detalles relevantes, como la fecha y el tipo de ausencia solicitada, así como el estado de la solicitud.

5. **Calendario de Ausencias:**
   - El sistema debe contar con un calendario visual que muestre las ausencias programadas de los empleados, facilitando la planificación de recursos y la gestión del personal.
   - Deben destacarse las fechas en las que se prevé una alta concentración de ausencias para tomar las medidas necesarias.

6. **Informes de Asistencia:**
   - Deben generarse informes periódicos sobre la asistencia de los empleados, proporcionando estadísticas sobre la puntualidad, ausencias, horas extras, entre otros.
   - Estos informes pueden ayudar a identificar tendencias y patrones de asistencia, así como a detectar posibles problemas o áreas de mejora.

7. **Integración con Nómina:**
   - El sistema debe integrarse con el módulo de nómina para calcular de manera automática los pagos correspondientes a las horas trabajadas, horas extras y ausencias.
   - Deben aplicarse las políticas y normativas laborales vigentes en el cálculo de los salarios y beneficios asociados a la asistencia y puntualidad.

8. **Seguridad y Confidencialidad:**
   - Se deben implementar medidas de seguridad robustas para proteger la información relacionada con la asistencia y las solicitudes de los empleados.
   - Solo los usuarios autorizados deben tener acceso a los datos de asistencia, garantizando la privacidad y confidencialidad de la información.

# Requerimientos
### Caso de Uso 15: Registro de Asistencia

|         Objetivo         | Registrar la asistencia de los empleados.                                                                                                                           |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El sistema debe permitir el registro preciso de la asistencia de los empleados, incluyendo la hora de entrada, la hora de salida y cualquier tipo de ausencia. |
|          Actor           | Asistente de Recursos Humanos.                                                                                                                                     |
|       Precondición       | El empleado está programado para trabajar en el día correspondiente.                                                                                                |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El asistente de Recursos Humanos accede al sistema de registro de asistencias.                                                                                     |
|            2             | Selecciona al empleado para el cual se va a registrar la asistencia.                                                                                                |
|            3             | Ingresa la hora de entrada y, si es aplicable, la hora de salida.                                                                                                   |
|            4             | Si hay alguna ausencia justificada o no justificada, selecciona el tipo de ausencia y proporciona detalles adicionales.                                           |
|            5             | Guarda el registro de asistencia.                                                                                                                                   |
|       Postcondición      | El registro de asistencia del empleado queda registrado en el sistema.                                                                                              |

### Caso de Uso 16: Gestión de Solicitudes de Ausencia

|         Objetivo         | Gestionar las solicitudes de ausencia de los empleados.                                                                                                             |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El sistema debe permitir a los empleados solicitar diferentes tipos de ausencias, como vacaciones, licencias médicas o permisos, y gestionar el proceso de aprobación. |
|          Actor           | Empleado.                                                                                                                                                           |
|       Precondición       | El empleado está registrado en el sistema y tiene acceso para solicitar ausencias.                                                                                  |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El empleado accede al sistema de solicitudes de ausencia.                                                                                                           |
|            2             | Selecciona el tipo de ausencia que desea solicitar.                                                                                                                 |
|            3             | Ingresa la fecha de inicio y de fin de la ausencia, junto con cualquier detalle adicional.                                                                          |
|            4             | Envía la solicitud de ausencia.                                                                                                                                    |
|       Postcondición      | La solicitud de ausencia queda registrada en el sistema y pendiente de aprobación por parte del supervisor.                                                         |

### Caso de Uso 17: Aprobación de Solicitudes de Ausencia

|         Objetivo         | Aprobar o rechazar las solicitudes de ausencia de los empleados.                                                                                                     |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | Los supervisores deben revisar las solicitudes de ausencia de sus subordinados y tomar decisiones para su aprobación o rechazo.                                      |
|          Actor           | Supervisor o Jefe.                                                                                                                                                  |
|       Precondición       | Hay solicitudes de ausencia pendientes de aprobación en el sistema.                                                                                                 |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El supervisor accede al sistema de gestión de solicitudes de ausencia.                                                                                               |
|            2             | Revisa las solicitudes pendientes y la información asociada.                                                                                                         |
|            3             | Aprueba o rechaza la solicitud, proporcionando comentarios si es necesario.                                                                                         |
|            4             | En caso de aprobación, el supervisor puede ajustar el horario del empleado si es necesario.                                                                         |
|       Postcondición      | La solicitud de ausencia queda aprobada o rechazada en el sistema, y se notifica al empleado correspondiente.                                                       |

### Caso de Uso 18: Reportes de Asistencia

|         Objetivo         | Generar reportes sobre la asistencia de los empleados.                                                                                                               |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El sistema debe ser capaz de generar reportes detallados sobre la asistencia de los empleados, proporcionando información útil para la toma de decisiones y la gestión de recursos humanos.                                      |
|          Actor           | Administrador de Recursos Humanos.                                                                                                                                  |
|       Precondición       | Existe información de asistencia registrada en el sistema.                                                                                                           |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El administrador de Recursos Humanos accede al sistema de reportes de asistencia.                                                                                    |
|            2             | Selecciona el rango de fechas y los parámetros relevantes para el reporte.                                                                                           |
|            3             | Genera el reporte de asistencia.                                                                                                                                    |
|       Postcondición      | Se genera un reporte detallado sobre la asistencia de los empleados, que puede ser utilizado para análisis y seguimiento.             