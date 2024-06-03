## Requisitos de Evaluación de Desempeño:

1. **Registro de Evaluaciones:**
   - El sistema debe permitir a los supervisores o jefes de departamento registrar las evaluaciones de desempeño de los empleados.
   - Se deben definir criterios de evaluación y competencias a evaluar para cada empleado.
   - Debe ser posible registrar las calificaciones y comentarios correspondientes a cada criterio de evaluación.

2. **Programación de Evaluaciones:**
   - El sistema debe facilitar la programación de evaluaciones de desempeño de forma periódica (por ejemplo, anual, semestral).
   - Debe enviar recordatorios automáticos a los supervisores y empleados para completar las evaluaciones en las fechas establecidas.

3. **Acceso a Evaluaciones Anteriores:**
   - Los empleados y supervisores deben poder acceder a las evaluaciones de desempeño anteriores para realizar comparaciones y seguimiento del progreso.

4. **Generación de Informes:**
   - El sistema debe ser capaz de generar informes detallados sobre el desempeño de los empleados, incluyendo calificaciones, comentarios, tendencias y áreas de mejora.
   - Debe ser posible exportar los informes en formatos compatibles (por ejemplo, PDF, Excel) para su revisión y análisis.

5. **Feedback y Planes de Mejora:**
   - El sistema debe permitir a los supervisores proporcionar feedback a los empleados basado en los resultados de las evaluaciones.
   - Debe ser posible establecer planes de mejora individualizados para aquellos empleados que necesiten desarrollar habilidades específicas o mejorar su rendimiento.

6. **Integración con Objetivos y Desarrollo:**
   - Debe existir integración con otros módulos del sistema, como el establecimiento de objetivos individuales y el desarrollo profesional, para alinear la evaluación de desempeño con los planes de crecimiento y desarrollo de los empleados.

7. **Confidencialidad y Seguridad:**
   - El sistema debe garantizar la confidencialidad de las evaluaciones de desempeño, permitiendo el acceso solo a los usuarios autorizados.
   - Debe implementar medidas de seguridad para proteger la información sensible de los empleados.

8. **Seguimiento y Retroalimentación Continua:**
   - El sistema debe facilitar el seguimiento continuo del desempeño de los empleados y la retroalimentación regular por parte de los supervisores.
   - Deben establecerse mecanismos para revisar y actualizar las evaluaciones de manera periódica, según sea necesario.

## Requisitos la Evaluación de Desempeño:

## Requisitos de Evaluación de Desempeño:

1. **Registro de Evaluaciones:**
   - El sistema debe permitir a los supervisores o jefes de departamento registrar las evaluaciones de desempeño de los empleados.
   - Se deben definir criterios de evaluación y competencias a evaluar para cada empleado.
   - Debe ser posible registrar las calificaciones y comentarios correspondientes a cada criterio de evaluación.

2. **Programación de Evaluaciones:**
   - El sistema debe facilitar la programación de evaluaciones de desempeño de forma periódica (por ejemplo, anual, semestral).
   - Debe enviar recordatorios automáticos a los supervisores y empleados para completar las evaluaciones en las fechas establecidas.

3. **Acceso a Evaluaciones Anteriores:**
   - Los empleados y supervisores deben poder acceder a las evaluaciones de desempeño anteriores para realizar comparaciones y seguimiento del progreso.

4. **Generación de Informes:**
   - El sistema debe ser capaz de generar informes detallados sobre el desempeño de los empleados, incluyendo calificaciones, comentarios, tendencias y áreas de mejora.
   - Debe ser posible exportar los informes en formatos compatibles (por ejemplo, PDF, Excel) para su revisión y análisis.

5. **Feedback y Planes de Mejora:**
   - El sistema debe permitir a los supervisores proporcionar feedback a los empleados basado en los resultados de las evaluaciones.
   - Debe ser posible establecer planes de mejora individualizados para aquellos empleados que necesiten desarrollar habilidades específicas o mejorar su rendimiento.

6. **Integración con Objetivos y Desarrollo:**
   - Debe existir integración con otros módulos del sistema, como el establecimiento de objetivos individuales y el desarrollo profesional, para alinear la evaluación de desempeño con los planes de crecimiento y desarrollo de los empleados.

7. **Confidencialidad y Seguridad:**
   - El sistema debe garantizar la confidencialidad de las evaluaciones de desempeño, permitiendo el acceso solo a los usuarios autorizados.
   - Debe implementar medidas de seguridad para proteger la información sensible de los empleados.

8. **Seguimiento y Retroalimentación Continua:**
   - El sistema debe facilitar el seguimiento continuo del desempeño de los empleados y la retroalimentación regular por parte de los supervisores.
   - Deben establecerse mecanismos para revisar y actualizar las evaluaciones de manera periódica, según sea necesario.

## Requerimientos de Evaluación de Desempeño:

## Caso de uso 1: Crer un cuestionario
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

#### Prototipo
![ ](../Front/ED1.png)


## Caso de uso 2: Editar un cuestionario
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

#### Prototipo
![ ](../Front/ED2.png)


## Caso de uso 3: Aprobar Cuestionario
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

#### Prototipo
![ ](../Front/ED3.png)


## Caso de uso 4: Responder cuestionario
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
#### Prototipo
![ ](../Front/ED4.png)


## Caso de uso 5: Revisar cuestionarios
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

#### Prototipo
![ ](../Front/ED5.png)


## Caso de uso 6: Realizar reporte
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
#### Prototipo
![ ](../Front/ED6.png)


## Caso de uso 7: Mis resultados
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

#### Prototipo
![ ](../Front/ED7.png)


## Caso de uso 8: Programar reunión
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

#### Prototipo
![ ](../Front/ED8.png)

## Caso de uso 9: Mostrar reuniones pendientes
| **Objetivo** |                                                      **Permitir a los trabajadores o empleados ver las reuniones pendientes.**                                                     |
|:------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  Descripción | Los trabajadores o empleados pueden acceder a la página de reuniones pendientes donde se mostrarán el asunto de la reunión, la fecha y la hora de todas las reuniones programadas. |
|     Actor    |                                                                                Trabajador o Empleado                                                                               |
| Precondición |                                                   El actor tiene acceso al sistema y permisos para ver las reuniones pendientes.                                                   |
|     Paso     |                                                                                       Acción                                                                                       |
|       1      |                                                                    Acceder a la página de reuniones pendientes.                                                                    |
|       2      |                                                 Visualizar el asunto de la reunión, la fecha y la hora de cada reunión programada.                                                 |

#### Prototipo
![ ](../Front/ED9.png)


