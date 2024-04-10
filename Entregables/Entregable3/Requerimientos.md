# Requerimientos

### Caso de uso 1 : Registro de nuevo empleado

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

### Caso de uso 2 : Modificar información de un empleado

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

### Caso de uso 3 : Solicitar capacitación

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


### Caso de uso 4 : Aprobar solicitud de capacitación

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

### Caso de uso 5 : Registrar cese de personal

|         Objetivo         | Registrar el cese de un empleado en el sistema de Recursos Humanos                                                                                                           |
| :----------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       Descripción        | El responsable de Recursos Humanos registra el cese de un empleado en el sistema, incluyendo la fecha de fin de contrato, motivo del cese, y si aplica, la liquidación final |
|          Actor           | <p align="center">	Analista de recursos humanos                                                                                                                           |
|       Precondición       | <p align="center"> El empleado ha sido notificado de su cese y la información del cese está disponible                                                                       |
| <p align="center">  Paso | <p align="center">  Acción </p>                                                                                                                                              |
|            1             | El responsable de Recursos Humanos ingresa al módulo de Cese de Personal                                                                                                     |
|            2             | Selecciona la opción "Registrar cese de personal".                                                                                                                           |
|            3             | Completa el formulario con la información del cese (fecha, motivo, etc.).                                                                                                    |
|            4             | Si aplica, ingresa la información de la liquidación final.                                                                                                                   |
|            5             | Revisa y valida la información ingresada.                                                                                                                                    |
|            6             | Guarda el registro.                                                                                                                                                          |

### Caso de uso 6 : Registrar evaluación de desempeño

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
### Caso de uso 7 : Registrar asistencia a la inducción
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

### Caso de uso 8 : Publicar vacante

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

### Caso de uso 9 : Recepción de CVs

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

### Caso de uso 10 : Preselección de candidatos

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

### Caso de uso 11 : Entrevista a candidatos

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
### Caso de uso 12 : Seleccionar candidato final
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

### Caso de uso 13: Incluir al nuevo empleado

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

### Caso de uso 14: Evaluar la satisfacción del cliente


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
