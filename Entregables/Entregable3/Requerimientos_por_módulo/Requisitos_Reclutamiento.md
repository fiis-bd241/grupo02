## Requisitos el Reclutamiento y Selección del Personal:

1. **Registro de Vacantes:**
   - El sistema debe permitir a los usuarios registrar información detallada sobre las vacantes disponibles, incluyendo el cargo, descripción del puesto, requisitos, competencias requeridas y ubicación.
   - Se debe registrar la fecha de publicación de la vacante y su estado (abierto, cerrado, en proceso, etc.).

2. **Recepción de CVs:**
   - El sistema debe facilitar la recepción de currículums vitae (CVs) de los candidatos interesados en las vacantes publicadas.
   - Se deben almacenar los CVs recibidos de manera organizada, asociados a la vacante correspondiente.

3. **Preselección de Candidatos:**
   - El sistema debe permitir a los usuarios revisar los CVs recibidos y preseleccionar a los candidatos que cumplen con los requisitos mínimos para la vacante.
   - Debe ser posible registrar la información de los candidatos preseleccionados en el sistema, junto con sus CVs y detalles de contacto.

4. **Entrevista a Candidatos:**
   - Se debe registrar la programación de entrevistas con los candidatos preseleccionados.
   - El sistema debe permitir a los usuarios registrar los resultados de las entrevistas, incluyendo notas y evaluaciones de los candidatos.

5. **Selección del Candidato Final:**
   - Los usuarios deben poder reunirse para discutir y seleccionar al candidato final para la vacante.
   - Debe ser posible registrar la decisión final y notificar al candidato seleccionado, así como a los candidatos no seleccionados.

6. **Integración del Nuevo Empleado:**
   - El sistema debe apoyar el proceso de integración del nuevo empleado a la empresa.
   - Debe ser posible registrar las actividades de integración realizadas, como la entrega de manuales, la organización de reuniones de bienvenida y la asignación de un mentor.

7. **Evaluación de la Satisfacción del Cliente:**
   - Se debe facilitar el envío de encuestas de satisfacción al cliente para evaluar su experiencia con el proceso de reclutamiento y selección.
   - Deben registrarse los resultados de las encuestas y tomar medidas para mejorar el servicio en base a los comentarios recibidos.

## Caso de uso 8 : Publicar vacante

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

## Caso de uso 9 : Recepción de CVs

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

## Caso de uso 10 : Preselección de candidatos

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

## Caso de uso 11 : Entrevista a candidatos

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
## Caso de uso 12 : Seleccionar candidato final
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

## Caso de uso 13: Incluir al nuevo empleado

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