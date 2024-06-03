# Requerimientos

## R001 / Caso de uso 1 : Registro de nuevo empleado

|         Objetivo         | Registrar la información de un nuevo empleado                                                                                                                                                         |
| :----------------------: | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos ingresa la información del nuevo empleado en el sistema, incluyendo datos personales, contacto, información de nómina, cargo, unidad de negocio y fecha de inicio. |
|          Actor           | <p align="center"> Asistente de recursos humanos                                                                                                                                                    |
|       Precondición       | <p align="center"> El nuevo empleado ha sido seleccionado y contratado, y la información del nuevo empleado está disponible.                                                                          |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                                                       |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Administración del Personal                                                                                                                   |
|            2             | Selecciona la opción "Registrar nuevo empleado                                                                                                                                                        |
|            3             | Completa el formulario con la información del nuevo empleado                                                                                                                                          |
|            4             | Adjunta los documentos requeridos (por ejemplo, contrato de trabajo, cédula de identidad)                                                                                                             |
|            5             | Revisa y valida la información ingresada                                                                                                                                                              |
|            6             | Guarda el registro                                                                                                                                                                                    |

## R002 / Caso de uso 2 : Modificar información de un empleado

|         Objetivo         | Modificar la información de un empleado en el sistema de Recursos Humanos                                                                                  |
| :----------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos modifica la información de un empleado en el sistema, como cambio de dirección, estado civil, cargo o unidad de negocio |
|          Actor           | <p align="center"> Asistente de recursos humanos                                                                                                         |
|       Precondición       | <p align="center">El empleado existe en el sistema de Recursos Humanos y la información actualizada del empleado está disponible.                          |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                            |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Administración del Personal                                                                        |
|            2             | Busca el empleado cuya información necesita ser actualizada.                                                                                               |
|            3             | Selecciona la opción "Modificar información"                                                                                                               |
|            4             | Modifica los campos que sean necesarios                                                                                                                    |
|            5             | Revisa y valida la información actualizada                                                                                                                 |
|            6             | Guardar los cambios                                                                                                                                        |

## R003 / Caso de uso 3 : Solicitar capacitación

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


## R004 / Caso de uso 4 : Aprobar solicitud de capacitación

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

## R005 / Caso de uso 5 : Registrar cese de personal

|         Objetivo         | Registrar el cese de un empleado en el sistema por parte de su supervisor                                                                                                 |
| :----------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El supervisor registra el cese de un empleado en el sistema, incluyendo el código del empleado, la fecha de fin de contrato y motivo del cese|
|          Actor           | <p align="center">	Supervisor                                                                                                                           |
|       Precondición       | <p align="center"> El empleado ha sido notificado de su cese                                                                       |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                              |
|            1             | El supervisor de área ingresa al módulo de Cese de Personal en su intranet                                                                                                     |
|            2             | Selecciona la opción "Registrar cese de personal".                                                                                                                           |
|            3             | Completa el formulario con la información del cese con el DNI del empleado a cesar (dato que podrá conseguir usando la lupa e insertando el apellido del empleado), tipo de cese, motivo del cese (opcional), fecha en la que aplicará el cese y pulsa el botón "REGISTRAR".                                                                                                    |
|            4             | Luego, selecciona alguna opción para la pregunta "¿El trabajador posee alguna deuda con la empresa? Si la respuesta es positiva selecciona el botón "SÍ" e ingresa el dato de dicha deuda, si es negativa simplemente presiona "NO"                                                     |
|            5             | Revisa y valida la información ingresada.                                                                                                                                    |
|            6             | Proponer preguntas para el cese o seleccionar las predeterminadas.                                                                                                                                    |
|            7             | Confirma los cambios.                                                                             
## R006 / Caso de uso 6 : Registrar evaluación de desempeño

|         Objetivo         | Registrar la evaluación de desempeño de un empleado en el sistema de Recursos Humanos                                                             |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El supervisor o jefe del empleado completa la evaluación de desempeño, incluyendo las competencias del empleado, su rendimiento y áreas de mejora |
|          Actor           | <p align="center"> Supervisor inmediato                                                                                                 |
|       Precondición       | <p align="center"> El período de evaluación de desempeño ha finalizado y la información del desempeño del empleado está disponible.               |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                   |
|            1             | El supervisor o jefe del empleado ingresa al módulo de Evaluación de Desempeño.                                                                   |
|            2             | Selecciona al empleado que desea evaluar.                                                                                                         |
|            3             | Completa el formulario de evaluación con las calificaciones y comentarios correspondientes.                                                       |
|            4             | Revisa y valida la información ingresada.                                                                                                         |
|            5             | Guarda la evaluación                                                                                                                              |
## R007 / Caso de uso 7 : Registrar asistencia a la inducción
|         Objetivo         | Registrar la asistencia de los nuevos empleados a la inducción del personal                             |
| :----------------------: | ------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de la inducción registra la asistencia de los nuevos empleados a la sesión de inducción  |
|          Actor           | <p align="center"> Asistente de recursos humanos                                                          |
|       Precondición       | <p align="center"> La sesión de inducción ha finalizado y la lista de nuevos empleados está disponible. |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                         |
|            1             | El responsable de la inducción ingresa al módulo de Inducción del Personal.                             |
|            2             | Selecciona la sesión de inducción a la que desea registrar la asistencia.                               |
|            3             | Marca la asistencia de los nuevos empleados que asistieron.                                             |
|            4             | Guarda la información.                                                                                  |

## R008 / Caso de uso 8 : Publicar vacante

|         Objetivo         | Publicar una vacante en el portal de empleo de la empresa                                                                                                                         |
| :----------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos ingresa la información de la vacante en el portal de empleo, incluyendo el cargo, la descripción del puesto, los requisitos y las competencias |
|          Actor           | <p align="center"> Asistente de recursos humanos                                                                                                                                |
|       Precondición       | <p align="center"> La vacante ha sido aprobada por la gerencia y la información de la vacante está disponible.                                                                    |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                                   |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Reclutamiento y Selección del Personal                                                                                    |
|            2             | Selecciona la opción "Publicar vacante"                                                                                                                                           |
|            3             | Completa el formulario con la información de la vacante                                                                                                                           |
|            4             | Adjunta los documentos requeridos (por ejemplo, descripción del puesto)                                                                                                           |
|            5             | Revisa y valida la información ingresada                                                                                                                                          |
|            6             | Publica la vacante                                                                                                                                                                |

## R009 / Caso de uso 9 : Recepción de CVs

|         Objetivo         | Recepción de Curriculums Vitae (CVs) de candidatos a una vacante                                                                                               |
| :----------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | Los candidatos envían sus CVs a través del portal de empleo o por correo electrónico                                                                           |
|          Actor           | <p align="center"> Candidatos                                                                                                                                  |
|       Precondición       | <p align="center"> La vacante ha sido publicada y los candidatos tienen acceso al portal de empleo o a la dirección de correo electrónico de Recursos Humanos. |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                |
|            1             | Los candidatos encuentran la vacante de su interés en el portal de empleo o la reciben por correo electrónico                                                  |
|            2             | Descargan el formulario de postulación (si aplica)                                                                                                             |
|            3             | Completan el formulario de postulación o envían su CV directamente                                                                                             |
|            4             | Envían el formulario o CV por correo electrónico o a través del portal de empleo                                                                               |

## R010 / Caso de uso 10 : Preselección de candidatos

|         Objetivo         | Seleccionar a los candidatos que cumplen con los requisitos mínimos para la vacante                                                              |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------ |
|       Descripción        | El responsable de Recursos Humanos revisa los CVs recibidos y selecciona a los candidatos que cumplen con los requisitos mínimos para la vacante |
|          Actor           | <p align="center"> Asistente de área de reclutamiento                                                                                               |
|       Precondición       | <p align="center"> Los CVs de los candidatos han sido recibidos y los requisitos de la vacante están definidos                                   |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                  |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Reclutamiento y Selección del Personal                                                   |
|            2             | Selecciona la vacante para la que desea realizar la preselección                                                                                 |
|            3             | Revisa los CVs de los candidatos recibidos                                                                                                       |
|            4             | Selecciona a los candidatos que cumplen con los requisitos mínimos para la vacante                                                               |
|            5             | Guarda la información de los candidatos preseleccionados                                                                                         |

## R011 / Caso de uso 11 : Entrevista a candidatos

|         Objetivo         | Realizar entrevistas a los candidatos preseleccionados para la vacante                                                           |
| :----------------------: | -------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos realiza entrevistas a los candidatos preseleccionados para evaluar su potencial para el cargo |
|          Actor           | <p align="center"> Encargado de reclutamiento                                                                               |
|       Precondición       | <p align="center"> Los candidatos han sido preseleccionados y las preguntas de la entrevista han sido definidas                  |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                  |
|            1             | El responsable de Recursos Humanos contacta a los candidatos preseleccionados para programar una entrevista                      |
|            2             | Realiza la entrevista a los candidatos, utilizando las preguntas predefinidas                                                    |
|            3             | Evalúa las respuestas de los candidatos y toma notas                                                                             |
|            4             | Al final de la entrevista, informa al candidato sobre los próximos pasos                                                         |
## R012 / Caso de uso 12 : Seleccionar candidato final
|         Objetivo         | Seleccionar al candidato final para la vacante                                                                                 |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------ |
|       Descripción        | El responsable de Recursos Humanos, junto con el jefe del área y/o la gerencia, seleccionan al candidato final para la vacante |
|          Actor           | <p align="center"> Jefe del área                                                  |
|       Precondición       | <p align="center"> Las entrevistas a los candidatos han sido realizadas y la información de los candidatos ha sido evaluada    |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                |
|            1             | El responsable de Recursos Humanos reúne al jefe del área y/o la gerencia para discutir los resultados de las entrevistas      |
|            2             | Analizan la información de los candidatos y sus competencias                                                                   |
|            3             | Seleccionan al candidato que mejor se ajusta al perfil del cargo y a las necesidades de la empresa                             |
|            4             | Informan al candidato seleccionado sobre su decisión                                                                           |
|            5             | Notifican a los candidatos no seleccionados                                                                                    |

## R013 / Caso de uso 13: Incluir al nuevo empleado

|         Objetivo         | Integrar al nuevo empleado a la empresa y a su equipo de trabajo                                                                                                            |
| :----------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos y el jefe del área del nuevo empleado se encargan de su integración a la empresa y a su equipo de trabajo                                |
|          Actor           | <p align="center"> Responsable de Recursos Humanos / jefe del área                                                                                                          |
|       Precondición       | <p align="center"> El candidato ha aceptado la oferta de trabajo y la fecha de inicio del nuevo empleado ha sido definida                                                   |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                             |
|            1             | El responsable de Recursos Humanos envía al nuevo empleado la información necesaria para su incorporación (por ejemplo, manual de bienvenida, políticas de la empresa, etc) |
|            2             | El jefe del área del nuevo empleado organiza una reunión de bienvenida con el equipo de trabajo                                                                             |
|            3             | El jefe del área asigna un mentor al nuevo empleado para que lo acompañe en su proceso de integración                                                                       |
|            4             | Se realizan actividades de integración para que el nuevo empleado se familiarice con la empresa y sus compañeros                                                            |

## R014 / Caso de uso 14: Evaluar la satisfacción del cliente


|         Objetivo         | Evaluar la satisfacción del cliente con el servicio de reclutamiento y selección de personal                                                                         |
| :----------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos envía una encuesta de satisfacción al cliente para evaluar su experiencia con el proceso de reclutamiento y selección de personal |
|          Actor           | <p align="center"> Responsable de Recursos Humanos / cliente                                                                                                         |
|       Precondición       | <p align="center"> El proceso de reclutamiento y selección de personal ha finalizado, y el cliente tiene acceso a la encuesta de satisfacción.                       |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                      |
|            1             | El responsable de Recursos Humanos envía la encuesta de satisfacción al cliente por correo electrónico                                                               |
|            2             | El cliente completa la encuesta y la envía de vuelta                                                                                                                 |
|            3             | El responsable de Recursos Humanos analiza los resultados de la encuesta                                                                                             |
|            4             | Se toman medidas para mejorar el servicio de reclutamiento y selección de personal en base a los resultados de la encuesta                                           |
---


## R015 / Caso de Uso 15: Registro de Asistencia

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

## R016 / Caso de Uso 16: Gestión de Solicitudes de Ausencia

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

## R017 / Caso de Uso 17: Aprobación de Solicitudes de Ausencia

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

## R018 / Caso de Uso 18: Reportes de Asistencia

|         Objetivo         | Generar reportes sobre la asistencia de los empleados.                                                                                                               |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El sistema debe ser capaz de generar reportes detallados sobre la asistencia de los empleados, proporcionando información útil para la toma de decisiones y la gestión de recursos humanos.                                      |
|          Actor           | Administrador de Recursos Humanos.                                                                                                                                  |
|       Precondición       | Existe información de asistencia registrada en el sistema.                                                                                                           |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El administrador de Recursos Humanos accede al sistema de reportes de asistencia.                                                                                    |
|            2             | Selecciona el rango de fechas y los parámetros relevantes para el reporte.                                                                                           |
|            3             | Genera el reporte de asistencia.                                                                                                                                    |
|       Postcondición      | Se genera un reporte detallado sobre la asistencia de los empleados, que puede ser utilizado para análisis y seguimiento.                                           |

## R019 / Caso de Uso 19: Integración con el Módulo de Nómina

|         Objetivo         | Integrar la información de asistencia con el módulo de nómina.                                                                                                       |
| :----------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El sistema debe integrarse con el módulo de nómina para calcular de manera automática los salarios y beneficios de los empleados, teniendo en cuenta la información de asistencia registrada.                                         |
|          Actor           | Sistema.                                                                                                                                                            |
|       Precondición       | El sistema de nómina está configurado y en funcionamiento.                                                                                                          |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                    |
|            1             | El sistema de nómina accede a la información de asistencia de los empleados.                                                                                        |
|            2             | Calcula los salarios y beneficios correspondientes con base en la información de asistencia.                                                                         |
|            3             | Actualiza los registros de nómina con los cálculos realizados.                                                                                                       |
|       Postcondición      | La información de nómina se actualiza automáticamente con los datos de asistencia registrados.                                                                      |

## R020 / Caso de uso 20: Registro y Actualización de Beneficios

| **Objetivo** | Permitir a los administradores registrar y actualizar los beneficios ofrecidos a los empleados, así como garantizar la precisión y transparencia en la gestión de esta información. |
|:------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  Descripción | Los administradores pueden ingresar nuevos beneficios ofrecidos por la empresa, como planes de pensiones, vacaciones pagadas y bonificaciones, así como actualizar la información existente cuando sea necesario. Además, se deben registrar los cambios de beneficios para cada empleado de manera individual. |
|     Actor    | Administrador de Recursos Humanos                                                                                                                                            |
| Precondición | El administrador ha iniciado sesión en el sistema de gestión de beneficios y compensaciones.                                                                                |
|     Paso     |                                                                                                                                                                             |
|       1      | El administrador accede al módulo de registro de beneficios y compensaciones.                                                                                               |
|       2      | Selecciona la opción para ingresar un nuevo beneficio o actualizar uno existente.                                                                                            |
|       3      | Completa los detalles del beneficio, como nombre, descripción y condiciones de elegibilidad.                                                                                 |
|       4      | Asigna el beneficio a los empleados correspondientes o actualiza la asignación según sea necesario.                                                                          |
|       5      | Confirma los cambios y guarda la información en el sistema.                                                                                                                  |

## R021 / Caso de uso 21: Programación y Gestión de Pagos

| **Objetivo** | Facilitar la programación y gestión de los pagos relacionados con los beneficios y compensaciones de los empleados, garantizando su realización de manera oportuna y eficiente. |
|:------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  Descripción | Los administradores pueden programar y gestionar los pagos relacionados con los beneficios y compensaciones de los empleados, como salarios, bonificaciones y planes de pensiones. Además, se deben establecer alertas y recordatorios automáticos para garantizar que los pagos se realicen dentro de los plazos establecidos. |
|     Actor    | Administrador de Recursos Humanos                                                                                                                                          |
| Precondición | El administrador ha iniciado sesión en el sistema de gestión de beneficios y compensaciones.                                                                              |
|     Paso     |                                                                                                                                                                           |
|       1      | El administrador accede al módulo de programación y gestión de pagos.                                                                                                      |
|       2      | Selecciona la opción para programar un nuevo pago o gestionar uno existente.                                                                                                |
|       3      | Ingresa los detalles del pago, incluyendo el monto, la fecha de pago y los beneficiarios.                                                                                  |
|       4      | Establece alertas y recordatorios automáticos para garantizar la realización del pago dentro del plazo establecido.                                                          |
|       5      | Confirma la programación o gestión del pago y guarda la información en el sistema.                                                                                         |

## R022 / Caso de uso 22: Crer un cuestionario
| **Objetivo** |          **Permitir al especialista en relaciones laborales crear y editar cuestionarios para distintos tipos de empleados.**          |
|:------------:|:--------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El especialista puede crear cuestionarios dirigidos a subordinados, supervisores, jefes y gerentes, o editar cuestionarios existentes. |
|     Actor    |                                                  Especialista en relaciones laborales                                                  |
| Precondición |    El especialista ha iniciado sesión en el sistema de Recursos Humanos y tiene acceso a la función de crear y editar cuestionarios.   |
|     Paso     |                                                                 Acción                                                                 |
|       1      |                                            Acceder a la página de creación de cuestionarios.                                           |
|       2      |                                                     Ingresar su ID de especialista.                                                    |
|       3      |                  Seleccionar el tipo de cuestionario a crear o editar (subordinados, supervisores, jefes o gerentes).                  |
|       4      |                                         Verificar si ya existe un cuestionario del mismo tipo.                                         |
|       5      |                                     Si existe un cuestionario del mismo tipo, editar el existente.                                     |
|       6      |                                Si no existe un cuestionario del mismo tipo, presionar el botón "Crear".                                |
|       7      |                          Opcional: Si se desea editar un cuestionario existente, presionar el botón "Editar".                          |
|       8      |                                         Ser redirigido a la página de edición del cuestionario.                                        |

## R023 / Caso de uso 23: Editar un cuestionario
| **Objetivo** |                                                             **Permitir al especialista en relaciones laborales editar un cuestionario existente para distintos tipos de empleados.**                                                             |
|:------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El especialista puede seleccionar el tipo de cuestionario que desea editar y agregar, eliminar o modificar preguntas. Además, puede visualizar el estado de envío y aprobación del cuestionario, así como enviarlo a gerencia una vez terminado. |
|     Actor    |                                                                                                       Especialista en relaciones laborales                                                                                                       |
| Precondición |                                                             El especialista ha iniciado sesión en el sistema de Recursos Humanos y tiene acceso a la función de editar cuestionarios.                                                            |
|     Paso     |                                                                                                                      Acción                                                                                                                      |
|       1      |                                                                           Seleccionar el tipo de cuestionario a editar (subordinados, supervisores, jefes o gerentes).                                                                           |
|       2      |                                                                           Mostrar el cuestionario actual del tipo seleccionado, incluyendo ID de pregunta y enunciado.                                                                           |
|       3      |                                                              Ingresar una nueva pregunta, especificando las opciones de respuesta (muy negativo, negativo, positivo o muy positivo).                                                             |
|       4      |                                                                                                Agregar la pregunta utilizando el botón "Agregar".                                                                                                |
|       5      |                                                                                       Opcional: Eliminar una pregunta seleccionando el símbolo de eliminar.                                                                                      |
|       6      |                                                                                                  Visualizar el estado de envío del cuestionario.                                                                                                 |
|       7      |                                                                                               Visualizar el estado de aprobación del cuestionario.                                                                                               |
|       8      |                                                                           Enviar el cuestionario a gerencia si está terminado utilizando el botón "Enviar a Gerencia".                                                                           |

## R024 / Caso de uso 24: Aprobar Cuestionario
| **Objetivo** |                                                                        **Permitir al gerente de Recursos Humanos aprobar un cuestionario existente para distintos tipos de empleados.**                                                                        |
|:------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El gerente puede seleccionar el tipo de cuestionario que desea aprobar y visualizar el cuestionario actual del tipo seleccionado, incluyendo ID de pregunta y enunciado. Además, puede ingresar el estado de aprobación correspondiente y enviar dicho estado. |
|     Actor    |                                                                                                                   Gerente de Recursos Humanos                                                                                                                  |
| Precondición |                                                                      El gerente ha iniciado sesión en el sistema de Recursos Humanos y tiene acceso a la función de aprobar cuestionarios.                                                                     |
|     Paso     |                                                                                                                             Acción                                                                                                                             |
|       1      |                                                                                  Seleccionar el tipo de cuestionario a aprobar (subordinados, supervisores, jefes o gerentes).                                                                                 |
|       2      |                                                                                  Mostrar el cuestionario actual del tipo seleccionado, incluyendo ID de pregunta y enunciado.                                                                                  |
|       3      |                                                                                                         Visualizar el estado de envío del cuestionario.                                                                                                        |
|       4      |                                                                                          Ingresar el estado de aprobación respectivo al tipo de cuestionario elegido.                                                                                          |
|       5      |                                                                                        Enviar el estado de aprobación utilizando el botón "Enviar estado de aprobación".                                                                                       |Gerencia".                                                                           |

## R025 / Caso de uso 25: Responder cuestionario
| **Objetivo** |                                                                                                                                                                        **Permitir al empleado responder un cuestionario aprobado para su tipo (subordinado, supervisor, jefe o gerente).**                                                                                                                                                                       |
|:------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El empleado primero ingresa su ID de empleado y selecciona el tipo de cuestionario que desea responder. Luego, se muestra el cuestionario actual del tipo seleccionado, incluyendo ID de pregunta y enunciado. Para cada pregunta, se presenta una lista desplegable con las posibles respuestas (muy negativo, negativo, positivo o muy positivo). Finalmente, el empleado puede enviar sus respuestas al cuestionario utilizando el botón "Enviar respuestas". |
|     Actor    |                                                                                                                                                                                               Empleado de cualquier tipo (subordinado, supervisor, jefe o gerente)                                                                                                                                                                                               |
| Precondición |                                                                                                                                                                     El empleado ha iniciado sesión en el sistema de Recursos Humanos y tiene acceso a la función de responder cuestionarios.                                                                                                                                                                     |
|     Paso     |                                                                                                                                                                                                                              Acción                                                                                                                                                                                                                              |
|       1      |                                                                                                                                                                                                                    Ingresar el ID de empleado.                                                                                                                                                                                                                   |
|       2      |                                                                                                                                                                                  Seleccionar el tipo de cuestionario a responder (subordinados, supervisores, jefes o gerentes).                                                                                                                                                                                 |
|       3      |                                                                                                                                                                                   Mostrar el cuestionario actual del tipo seleccionado, incluyendo ID de pregunta y enunciado.                                                                                                                                                                                   |
|       4      |                                                                                                                                                                 Presentar una lista desplegable por cada pregunta con las posibles respuestas (muy negativo, negativo, positivo o muy positivo).                                                                                                                                                                 |
|       5      |                                                                                                                                                                                          Enviar las respuestas al cuestionario utilizando el botón "Enviar respuestas".                                                                                                                                                                                          |
## R026 / Caso de uso 26: Revisar cuestionarios
| **Objetivo** |                                                                                                                                                                                                         **Permitir a los especialistas en relaciones laborales revisar los cuestionarios completados por los empleados.**                                                                                                                                                                                                         |
|:------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | Al ingresar a la página, se mostrará una lista de empleados que han completado su cuestionario, incluyendo el ID del empleado, apellido y nombre. Se proporcionará la opción de generar un informe mediante el botón "Realizar reporte", el cual llevará a otra página para realizar el reporte. Además, se permitirá filtrar la lista de empleados por apellido utilizando el campo "Buscar por apellido". También se podrá filtrar por tipo de cuestionario y por la calificación recibida en el cuestionario de los empleados. |
|     Actor    |                                                                                                                                                                                                                                                Especialista en relaciones laborales                                                                                                                                                                                                                                               |
| Precondición |                                                                                                                                                                                                     El especialista ha iniciado sesión en el sistema de Recursos Humanos y tiene acceso a la función de revisar cuestionarios.                                                                                                                                                                                                    |
|     Paso     |                                                                                                                                                                                                                                                               Acción                                                                                                                                                                                                                                                              |
|       1      |                                                                                                                                                                                                                                         Ingresar a la página de revisión de cuestionarios.                                                                                                                                                                                                                                        |
|       2      |                                                                                                                                                                                                         Visualizar la lista de empleados que han completado su cuestionario, mostrando ID del empleado, apellido y nombre.                                                                                                                                                                                                        |
|       3      |                                                                                                                                                                                                   Opción para realizar un informe mediante el botón "Realizar reporte", el cual llevará a otra página para realizar el reporte.                                                                                                                                                                                                   |
|       4      |                                                                                                                                                                                                                       Filtrar la lista de empleados por apellido utilizando el campo "Buscar por apellido".                                                                                                                                                                                                                       |
|       5      |                                                                                                                                                                                                           Filtrar la lista por tipo de cuestionario y por la calificación recibida en el cuestionario de los empleados.                                                                                                                                                                                                           |

## R027 / Caso de uso 27: Realizar reporte
| **Objetivo** | **Permitir al especialista en relaciones laborales visualizar y calificar los cuestionarios completados por los empleados, proporcionando retroalimentación.** |
|:------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción |   El especialista puede acceder a los cuestionarios completados por los empleados, ver sus detalles y calificarlos, además de proporcionar retroalimentación.  |
|     Actor    |                                                              Especialista en relaciones laborales                                                              |
| Precondición |                El especialista ha accedido al sistema y tiene permisos para visualizar y calificar cuestionarios completados por los empleados.                |
|     Paso     |                                                                             Acción                                                                             |
|       1      |                                                Visualizar lista de empleados que han completado su cuestionario.                                               |
|       2      |                                            Seleccionar un empleado de la lista para ver detalles de su cuestionario.                                           |
|       3      |                            Visualizar el ID del empleado, apellido, nombre, ID del cuestionario del empleado y tipo de cuestionario.                           |
|       4      |                     Mostrar las preguntas del cuestionario completado por el empleado (ID de pregunta, enunciado de pregunta y respuesta).                     |
|       5      |                               Seleccionar una calificación para el cuestionario (muy negativo, negativo, positivo, muy positivo).                              |
|       6      |                                                          Redactar retroalimentación, si es necesario.                                                          |
|       7      |                                                        Confirmar la calificación y la retroalimentación.                                                       |
|       8      |                                                        Procesar la calificación y la retroalimentación.                                                        |                                                                                                                                                                                      |

## R028 / Caso de uso 28: Mis resultados
| **Objetivo** |                         **Permitir al empleado acceder y visualizar sus resultados de cuestionarios previamente completados.**                        |
|:------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El empleado puede ver su ID, fecha de ingreso a la empresa, calificación obtenida y retroalimentación proporcionada en sus cuestionarios completados. |
|     Actor    |                                                                 Trabajador o empleado                                                                 |
| Precondición |                              El empleado ha iniciado sesión en el sistema y tiene permisos para acceder a sus resultados.                             |
|     Paso     |                                                                         Acción                                                                        |
|       1      |                                                  Acceder a la sección "Mis resultados" en el sistema.                                                 |
|       2      |                                                             Visualizar el ID del empleado.                                                            |
|       3      |                                                   Ver la fecha de ingreso a la empresa del empleado.                                                  |
|       4      |                                         Mostrar la calificación obtenida por el empleado en sus cuestionarios.                                        |
|       5      |                                       Leer la retroalimentación proporcionada en los cuestionarios completados.                                       |

## R029 / Caso de uso 29: Programar reunión
| **Objetivo** |                                                               **Permitir al gerente de recursos humanos o especialista en relaciones laborales programar una reunión.**                                                               |
|:------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | El gerente de recursos humanos o especialista en relaciones laborales puede ingresar su ID, el asunto de la reunión, la fecha y la hora de la reunión, y luego confirmar la programación de la reunión mediante el botón "Programar". |
|     Actor    |                                                                                   Gerente de Recursos Humanos o Especialista en Relaciones Laborales                                                                                  |
| Precondición |                                                                          El actor ha iniciado sesión en el sistema y tiene permisos para programar reuniones.                                                                         |
|     Paso     |                                                                                                                 Acción                                                                                                                |
|       1      |                                                                                               Ingresar el ID del gerente o especialista.                                                                                              |
|       2      |                                                                                                   Escribir el asunto de la reunión.                                                                                                   |
|       3      |                                                                                                  Seleccionar la fecha de la reunión.                                                                                                  |
|       4      |                                                                                                    Ingresar la hora de la reunión.                                                                                                    |
|       5      |                                                                             Confirmar la programación de la reunión haciendo clic en el botón "Programar".                                                                            |

## R030 / Caso de uso 30: Mostrar reuniones pendientes
| **Objetivo** |                                                      **Permitir a los trabajadores o empleados ver las reuniones pendientes.**                                                     |
|:------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | Los trabajadores o empleados pueden acceder a la página de reuniones pendientes donde se mostrarán el asunto de la reunión, la fecha y la hora de todas las reuniones programadas. |
|     Actor    |                                                                                Trabajador o Empleado                                                                               |
| Precondición |                                                   El actor tiene acceso al sistema y permisos para ver las reuniones pendientes.                                                   |
|     Paso     |                                                                                       Acción                                                                                       |
|       1      |                                                                    Acceder a la página de reuniones pendientes.                                                                    |
|       2      |                                                 Visualizar el asunto de la reunión, la fecha y la hora de cada reunión programada.                                                 |
                                                                            
***[Volver al inicio](../../README.md)***
