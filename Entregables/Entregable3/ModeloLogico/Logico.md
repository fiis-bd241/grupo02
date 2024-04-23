# Modelo Lógico
- [Link del modelo lógico en Diagrams.net](https://drive.google.com/file/d/1SUAWgRUIfU5sTKT0W7yCftdfM9p4HbZy/view?usp=sharing)
![Modelo lógico](lógico.png)
## Diccionario de datos
### Entidad: Empleado
#### Descripción: Trabajador de la empresa.
|     Atributo     |                  Descripción                  |   Formato   | Naturaleza |  Valores |
|:----------------:|:---------------------------------------------:|:-----------:|:----------:|:--------:|
|    ID_Empleado   |              Código del empleado              |  99999999   |     Int    | NOT NULL |
|  Nombre_Empleado |          Nombre completo del empleado         |     AAA     |   String   | NOT NULL |
|       Tipo       |                Tipo de empleado               |     AAA     |   Varchar  | NOT NULL |
|     Teléfono     |        Número de teléfono del empleado        | 999 999 999 |    Char    | NOT NULL |
|     Dirección    |      Dirección de residencia del empleado     |   999-AAA   |   Varchar  | NOT NULL |
|      Correo      | Dirección del correo electrónico del empleado |   999-AAA   |   Varchar  | NOT NULL |
| Fecha_Nacimineto |        Fecha de nacimiento del empleado       |     999     |     Int    | NOT NULL |
|   Estado_Civil   |           Estado civil del empleado           |     AAA     |   String   | NOT NULL |
|  Cantidad_Hijos  |          Número de hijos del empleado         |      99     |  Small-Int |  (0-99)  |
### Entidad: Cargo
#### Descripción: Puesto de trabajo que ejerce el empleado.
|     Atributo    |          Descripción          | Formato | Naturaleza |  Valores |
|:---------------:|:-----------------------------:|:-------:|:----------:|:--------:|
|      ID_Cargo     |      Código único del cargo     | 9999 |   Int  | NOT NULL |
| Descripción_Cargo | Descripción detallada del cargo |   AAA   |   String   | NOT NULL |
|    Nombre_Cargo   |         Nombre del cargo        |   AAA   |   String   | NOT NULL |
### Entidad: Departamento
#### Descripción: División administrativa de la empresa que agrupa a un conjunto de empleados.
|      Atributo     |                     Descripción                    | Formato | Naturaleza |  Valores |
|:-----------------:|:--------------------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Departamento  |            Código único del departamento           | 9999 |   Int  | NOT NULL |
|       Nombre      |               Nombre del departamento              |   AAA   |   String   | NOT NULL |
### Entidad: Sueldo
#### Descripción: Información sobre el salario del empleado.
|      Atributo      |                Descripción               | Formato | Naturaleza |  Valores |
|:------------------:|:----------------------------------------:|:-------:|:----------:|:--------:|
|      ID_Sueldo     |    Código único del registro de sueldo   | 999999 |   Int  | NOT NULL |
| Monto_Salario_Base |    Monto del salario base del empleado   | 9999.99 |   Double   |  [0.0;+> |
### Entidad: Cuenta_Bancaria
#### Descripción: Información sobre la cuenta bancaria de un empleado.
|    Atributo   |                    Descripción                    | Formato | Naturaleza |  Valores |
|:-------------:|:-------------------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Cuenta_B  |         Código único de la cuenta bancaria        | 999999 |   Int  | NOT NULL |
| Número_Cuenta |            Número de la cuenta bancaria           |   9999  |   Varchar  | NOT NULL |
|  Nombre_Banco |   Nombre del banco donde se encuentra la cuenta   |   AAA   |   String   | NOT NULL |
|  Tipo_Cuenta  | Tipo de cuenta bancaria (ahorro, corriente, etc.) |   AAA   |   String   | NOT NULL |
|     Moneda    |     Moneda en la que está denominada la cuenta    |   AAA   |   String   | NOT NULL |
### Entidad: Nomina
#### Descripción: Registro de los pagos realizados a los empleados.
|      Atributo     |                  Descripción                 |  Formato | Naturaleza |  Valores |
|:-----------------:|:--------------------------------------------:|:--------:|:----------:|:--------:|
|     ID_Nomina     |      Código único del registro de nómina     | 999999 |   Int  | NOT NULL |
|   Fecha_Emision   |         Fecha de emisión de la nómina        | AAAAMMDD |    DATE    | NOT NULL |
|    Periodo_Pago   | Periodo de pago al que corresponde la nómina |  999-AAA |   Varchar  | NOT NULL |
### Entidad: Modificaciones
#### Descripción: Registro de los conceptos de pago o deducción de la nómina.
|   Atributo  |             Descripción             |  Formato | Naturaleza |  Valores |
|:-----------:|:-----------------------------------:|:--------:|:----------:|:--------:|
|   ID_Modificacion  |  Código único de las modificaciones de nómina | 999999 |   Int  | NOT NULL |
|  Tipo_Modificacion | Tipo de concepto (pago o deducción) |    AAA   |   String   | NOT NULL |
|    Monto_Modificacion    |          Monto de la modificación         |  999.99  |   Double   |  [0.0;+> |
### Entidad: Pago Total
#### Descripción: Información sobre el pago total que se le asignará en la la nómina de los empleados.
|       Atributo       |                       Descripción                      |  Formato | Naturaleza |  Valores |
|:--------------------:|:------------------------------------------------------:|:--------:|:----------:|:--------:|
|   ID_Pago_Total  |           Código único del pago total           | 999999 |   Int  | NOT NULL |
|      Monto_Pagar     |           Monto asociado al elemento de costo          |  999.99  |   Double   |  [0.0;+> |
### Entidad: Asistencia
#### Descripción: Almacena la información relacionada con la asistencia de los empleados.
|    Atributo   |                      Descripción                      |  Formato | Naturaleza |  Valores |
|:-------------:|:-----------------------------------------------------:|:--------:|:----------:|:--------:|
| ID_Asistencia |   Identificador único de cada registro de asistencia  | 999999 |   Int  | NOT NULL |
|     Estado    |   Estado de la asistencia (presente, ausente, etc.)   |    AAA   |   String   | NOT NULL |
|  Observación  | Observaciones o notas adicionales sobre la asistencia |    AAA   |   String   | NOT NULL |
|     Fecha     |       Fecha en la que se registró la asistencia       |  AAAMMDD |    DATE    | NOT NULL |
|  Hora_Entrada |             Hora de entrada del empleado             | HH:MM:SS |    TIME    | NOT NULL |
|  Hora_Salida  |              Hora de salida del empleado             | HH:MM:SS |    TIME    | NOT NULL |
### Entidad: Supervisor
#### Descripción: Trabajador que dirige las actividades de otros.
|    Atributo   |         Descripción         | Formato | Naturaleza |  Valores |
|:-------------:|:---------------------------:|:-------:|:----------:|:--------:|
| ID_Supervisor | Código único del supervisor | 999999 |   Int  | NOT NULL |
### Entidad: Licencia
#### Descripción: Almacena la información relacionada con las licencias o permisos de los empleados.
|   Atributo   |                             Descripción                            |  Formato | Naturaleza |  Valores |
|:------------:|:------------------------------------------------------------------:|:--------:|:----------:|:--------:|
|  ID_Licencia |                 Identificador único de la licencia.                 | 999999 |   Int  | NOT NULL |
|    Tipo    | Tipo de la licencia, por ejemplo, aprobada, pendiente, rechazada. |    AAA   |   String   | NOT NULL |
|  Observación |      Observaciones o comentarios relacionados con la licencia.      |    AAA   |   String   | NOT NULL |
|     Fecha    |                        Fecha de la licencia.                        |  AAAMMDD |    DATE    | NOT NULL |
| Hora_Inicio |                   Hora de entrada de la licencia.                   | HH:MM:SS |    TIME    | NOT NULL |
|  Hora_Fin |                    Hora de salida de la licencia.                   | HH:MM:SS |    TIME    | NOT NULL |
### Entidad: Permiso
#### Descripción: Almacena la información relacionada con los permisos de los empleados.
|  Atributo  |                            Descripción                            | Formato | Naturaleza |  Valores |
|:----------:|:-----------------------------------------------------------------:|:-------:|:----------:|:--------:|
| ID_Permiso |                  Identificador único del permiso                  | 999999 |   Int  | NOT NULL |
|    Tipo    | Tipo de permiso, por ejemplo, médico, personal, capacitación, etc |   AAA   |   String   | NOT NULL |
|   Motivo   |             Motivo por el cual se solicita el permiso             |   AAA   |   String   | NOT NULL |
|  Duración  |                        Duración del permiso                       | 999999 |   Int  | NOT NULL |
|   Estado   |  Estado del permiso, por ejemplo, aprobado, pendiente, rechazado  |   AAA   |   String   | NOT NULL |
### Entidad: Cese
#### Descripción: Retiro de un trabajador de su cargo en la empresa.
|      Atributo     |                       Descripción                       |  Formato | Naturaleza |  Valores |
|:-----------------:|:-------------------------------------------------------:|:--------:|:----------:|:--------:|
|      ID_Cese      |            Código único del registro de cese            | 999999 |   Int  | NOT NULL |
|    Estado_Cese    | Estado del cese (voluntario, despido, jubilación, etc.) |    AAA   |   String   | NOT NULL |
| Fecha_Inicio_Cese |                 Fecha de inicio del cese                | AAAAMMDD |    DATE    | NOT NULL |
### Entidad: Cuestionario_Salida
#### Descripción: Almacena la información relacionada con las renuncias de los empleados.
|      Atributo      |                       Descripción                       | Formato | Naturaleza |  Valores |
|:------------------:|:-------------------------------------------------------:|:-------:|:----------:|:--------:|
|   ID_Cuestionario  |   Identificador único de cuestionario salida.   | 999999 |   Int  | NOT NULL |
| Fecha_Cuestionario | Fecha en la que se realizó el cuestionario de salida. | AAAMMDD |    DATE    | NOT NULL |
### Entidad: Pregunta_Salida
#### Descripción: Almacena las diferentes preguntas que son parte del cuestionario salida.
| Atributo |                             Descripción                            | Formato | Naturaleza |  Valores |
|:--------:|:------------------------------------------------------------------:|:-------:|:----------:|:--------:|
| ID_Pregunta |                  Identificador único de la pregunta.                  | 999999 |   Int  | NOT NULL |
|   Pregunta_Salida   | Tipo de pregunta salida en el cuestionario. |   AAA   |   String   | NOT NULL |
### Entidad: Beneficios_Cese
#### Descripción: Almacena la información relacionada con los beneficios de cese que se designa a un empleado.
|   Atributo   |                                  Descripción                                 | Formato | Naturaleza |  Valores |
|:------------:|:----------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Beneficio |                  Código de identificación único del beneficio.                 | 999999 |   Int  | NOT NULL |
| Tipo_Beneficio | Tipo de beneficio. |   AAA   |   String   | NOT NULL |
|  Monto_Beneficio |                      Monto de beneficio o descuento que se le asigna.                      |   999.9   |   Double   | NOT NULL |
### Entidad: Instructor
#### Descripción: Almacena la información relacionada con los instructores que imparten los programas de capacitación.
|    Atributo   |           Descripción           | Formato | Naturaleza |  Valores |
|:-------------:|:-------------------------------:|:-------:|:----------:|:--------:|
| ID_Instructor | Identificador único de cada instructor. | 999999 |   Int  | NOT NULL |
### Entidad: Evaluación_Capacitación
#### Descripción: Almacena la información relacionada con la evaluación de los candidatos durante los programas de capacitación.
|       Atributo      |                   Descripción                   | Formato | Naturaleza |  Valores |
|:-------------------:|:-----------------------------------------------:|:-------:|:----------:|:--------:|
|    ID_Evaluación    | Identificador único de cada evaluación de capacitación. | 999999 |   Int  | NOT NULL |
| Duración_Evaluación |        Duración de la evaluación para la capacitación.        |     999     |     Int    | NOT NULL |
| Hora |    Hora de la evaluación de capacitación.    | HH:MM:SS |    TIME    | NOT NULL |
### Entidad: Evaluación_Sesión
#### Descripción: Almacena la información relacionada con la evaluación de la sesión de los candidatos durante los programas de capacitación.
|       Atributo      |                   Descripción                   | Formato | Naturaleza |  Valores |
|:-------------------:|:-----------------------------------------------:|:-------:|:----------:|:--------:|
|    ID_Evaluación    | Identificador único de cada evaluación de capacitación. | 999999 |   Int  | NOT NULL |
| Resultado |    Duración de la evaluación de capacitación.    |    99   |    Char    | NOT NULL |
### Entidad: Sesión
#### Descripción: Almacena la información relacionada con las sesiones de capacitación ofrecidas a los candidatos.
|  Atributo |                          Descripción                          | Formato | Naturaleza |  Valores |
|:---------:|:-------------------------------------------------------------:|:-------:|:----------:|:--------:|
| ID_Sesión |          Identificador único de cada sesión de capacitación.         | 999999 |   Int  | NOT NULL |
|   Estado  | Estado de la sesión (programada, en curso, finalizada, etc.). |   AAA   |   String   | NOT NULL |
|  Duración |             Duración de la sesión de capacitación.            |    99   |    Char    | NOT NULL |
|   Fecha   |     Fecha en la que se realizó la sesión de capacitación.     | AAAMMDD |    DATE    | NOT NULL |
| Hora_Inicio_Sesión |                   Hora de entrada de la sesión de capacitación.                   | HH:MM:SS |    TIME    | NOT NULL |
|  Hora_Fin_Sesión |                    Hora de salida de la sesión de capacitación.                   | HH:MM:SS |    TIME    | NOT NULL |
### Entidad: Programa_Capacitador
#### Descripción: Almacena la información relacionada con los programas de capacitación ofrecidos a los candidatos.
|   Atributo   |                     Descripción                    | Formato | Naturaleza |  Valores |
|:------------:|:--------------------------------------------------:|:-------:|:----------:|:--------:|
|     ID_Programa_C    |      Identificador único del programa de capacitación.     | 999999 |   Int  | NOT NULL |
| Fecha_Inicio |    Fecha de inicio del programa de capacitación.    | AAAMMDD |    DATE    | NOT NULL |
|   Fecha_Fin  | Fecha de finalización del programa de capacitación. | AAAMMDD |    DATE    | NOT NULL |
### Entidad: Vacante
#### Descripción: Almacena la información relacionada con las vacantes disponibles en la organización.
|    Atributo    |                   Descripción                  | Formato | Naturaleza |  Valores |
|:--------------:|:----------------------------------------------:|:-------:|:----------:|:--------:|
|     Id_Vac     |       Identificador único de cada vacante.      | 999999 |   Int  | NOT NULL |
|  Nivel_Exp_Req | Nivel de experiencia requerido para la vacante. |   AAA   |   String   | NOT NULL |
|    Ubicación   |             Ubicación de la vacante.            |   AAA   |   String   | NOT NULL |
|    Benefício   |      Beneficios ofrecidos para la vacante.      |   AAA   |   String   | NOT NULL |
|     Salario    |          Rango salarial de la vacante.          | 9999.99 |   Double   |  [0.0;+> |
| Requisitos_Esp |      Requisitos específicos de la vacante.      |   AAA   |   String   | NOT NULL |
### Entidad: Solicitud_Empleo
#### Descripción: Almacena la información relacionada con las solicitudes de empleo presentadas por los candidatos.
|     Atributo     |                              Descripción                              | Formato | Naturaleza |  Valores |
|:----------------:|:---------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|      ID_sol      |            Identificador único de cada solicitud de empleo.            | 999999 |   Int  | NOT NULL |
|   Est_Solicitud  | Estado actual de la solicitud (en proceso, aceptada, rechazada, etc.). |   AAA   |   String   | NOT NULL |
| Vacante_aplicada |        Identificador de la vacante a la que el candidato aplicó.       |   AAA   |   String   | NOT NULL |
|  Fech_aplicación |                Fecha en la que se presentó la solicitud.               | AAAMMDD |    DATE    | NOT NULL |
### Entidad: Entrevista
#### Descripción: Almacena la información relacionada con las entrevistas realizadas a los candidatos durante el proceso de reclutamiento y selección.
| Atributo |                Descripción               | Formato | Naturaleza |  Valores |
|:--------:|:----------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Entrevista  |  Identificador único de cada entrevista para el reclutamiento. | 999999 |   Int  | NOT NULL |
|       Fecha_Entrevista       |           Fecha en la que se realizó la entrevista.           | AAAMMDD |    DATE    | NOT NULL |
|       Respuesta_Entrevista       |           Respuestas o resultados de la entrevista.          |  AAA    |   String   | NOT NULL |
|     Resultado_Entrevista    | Resultado final de la entrevista. |  99.99  |   Double   | NOT NULL |
### Entidad: Evaluación
#### Descripción: Almacena la información relacionada con la evaluación de los candidatos durante el proceso de reclutamiento y selección.
|       Atributo       |                          Descripción                         | Formato | Naturaleza |  Valores |
|:--------------------:|:------------------------------------------------------------:|:-------:|:----------:|:--------:|
| ID_Eva_Reclutamiento |            Identificador único de cada evaluación.            | 999999 |   Int  | NOT NULL |
|       Resultado_Evaluación     |           Resultado de la evaluación.          |  AAA    |   String   | NOT NULL |
|  Duración_Evaluación |             Duración de la sesión de evaluación.            |    99   |    Char    | NOT NULL |
### Entidad: Candidato
#### Descripción: Almacena la información relacionada con los candidatos que participan en el proceso de reclutamiento y selección.
|  Atributo |              Descripción              | Formato | Naturaleza |  Valores |
|:---------:|:-------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Candidato  | Identificador único de cada candidato. | 999999 |   Int  | NOT NULL |
|   Nombre_Candidato  |          Nombre del candidato.         |   AAA   |   String   | NOT NULL |
|  Apell_Candidato |         Apellido del candidato.        |   AAA   |   String   | NOT NULL |
| Fecha_Nac_Candidato |   Fecha de nacimiento del candidato.   | AAAMMDD |    DATE    | NOT NULL |
|     Dirección_Candidato    |      Dirección de residencia del candidato.     |   999-AAA   |   Varchar  | NOT NULL |
|      Correo_Candidato      | Dirección del correo electrónico del candidato. |   999-AAA   |   Varchar  | NOT NULL |
|     Num_Teléfono     |        Número de teléfono del candidato.        | 999 999 999 |    Char    | NOT NULL |
|  Exp_Lab  |   Experiencia laboral del candidato.   |   AAA   |   String   | NOT NULL |
### Entidad: Currículum
#### Descripción: Información del postulante con sus experiencias y logros (certificados).
|     Atributo    |               Descripción              |   Formato   | Naturaleza |  Valores |
|:---------------:|:--------------------------------------:|:-----------:|:----------:|:--------:|
|  ID_Curriculum  | Identificador único de cada currículum. | 999999 |   Int  | NOT NULL |
| Grado_Educación |      Nivel educativo del candidato.     |     AAA     |   String   | NOT NULL |



### Entidad: Gerente_RRHH
#### Descripción: Almacena la información de los gerentes de recursos humanos.
|      Atributo      |                      Descripción                     |  Formato | Naturaleza |  Valores |
|:------------------:|:----------------------------------------------------:|:--------:|:----------:|:--------:|
|     ID_Gerente     | Identificador único del gerente de recursos humanos. | 999999 |   Int  | NOT NULL |
### Entidad: Especialista
#### Descripción: Almacena la información de los especialistas en relaciones laborales.
|       Atributo      |              Descripción             |  Formato | Naturaleza |  Valores |
|:-------------------:|:------------------------------------:|:--------:|:----------:|:--------:|
|   ID_Especialista   | Identificador único del especialista. | 999999 |   Int  | NOT NULL |
### Entidad: Cuestionario
#### Descripción: Almacena la información relacionada con los cuestionarios.
|    Atributo   |                              Descripción                              | Formato | Naturaleza |  Valores |
|:-------------:|:---------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|  ID_Cuestionario  |                   Identificador único del cuestionario.                  | 999999 |   Int  | NOT NULL |
| Tipo_Cuestionario | Tipo de cuestionario, por ejemplo, de satisfacción, de clima laboral, etc |   AAA   |   String   | NOT NULL |
### Entidad: Retroalimentación.
#### Descripción: Almacena la información relacionada con la charla de retroalimentaciones de los empleados.
|   Atributo   |              Descripción             |  Formato | Naturaleza |  Valores |
|:------------:|:------------------------------------:|:--------:|:----------:|:--------:|
|   ID_Retroalimentación |   Identificador único de la charla.   | 999999 |   Int  | NOT NULL |
| Fecha_Retroalimentación | Fecha en la que se realizó la charla. |  AAAMMDD |    DATE    | NOT NULL |
|  Hora_Retroalimentación |  Hora en la que se realizó la charla. | HH:MM:SS |    TIME    | NOT NULL |
### Entidad: Reporte
#### Descripción: Almacena la información relacionada con los reportes de los empleados.
|        Atributo        |                      Descripción                     | Formato | Naturaleza |  Valores |
|:----------------------:|:----------------------------------------------------:|:-------:|:----------:|:--------:|
|       ID_Reporte       |            Identificador único del reporte.           | 999999 |   Int  | NOT NULL |
| Fecha_Ingreso_Empleado |             Fecha de ingreso del empleado.            | AAAMMDD |    DATE    | NOT NULL |
|  Calificación_Empleado | Calificación o evaluación del desempeño del empleado. |  99.99  |   Double   |  [0.0;+> |
### Entidad: Especialista
#### Descripción: Almacena la información relacionada con los especialistas de reclutamiento que participan en el proceso.
|    Atributo    |                                   Descripción                                   | Formato | Naturaleza |  Valores |
|:--------------:|:-------------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|   Id_Esp_Rec   |            Identificador único de cada especialista de reclutamiento.           | 999999 |   Int  | NOT NULL |
|     Nombre     |                    Nombre del especialista de reclutamiento.                    |   AAA   |   String   | NOT NULL |
|    Apellido    |                   Apellido del especialista de reclutamiento.                   |   AAA   |   String   | NOT NULL |
| Disponibilidad | Disponibilidad del especialista de reclutamiento para participar en el proceso. |   AAA   |   String   | NOT NULL |
|  Área_Especial |                     Área de especialización del reclutador.                     |   AAA   |   String   | NOT NULL |
### Entidad: Reunión
#### Descripción: Almacena datos de la reunión programada
|    Atributo    |                                   Descripción                                   | Formato | Naturaleza |  Valores |
|:--------------:|:-------------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|   Id_Reunion   |            Identificador único de cada reunión.           | 999999 |   Int  | NOT NULL |
|     Fecha_Reunión     |                    Fecha en la que se realizará la reunión.                    |   AAAMMDD   |   DATE   | NOT NULL |
|    Hora_Reunión    |                   Hora en la que se realizará la reunión.                   |   HH:MM:SS   |   TIME   | NOT NULL |
### Entidad: Perfil
#### Descripción: Perfil del personal que se busca contratar.
|    Atributo    |                                   Descripción                                   | Formato | Naturaleza |  Valores |
|:--------------:|:-------------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|   Id_Perfil   |            Identificador único de cada perfil requerido para cierto puesto.           | 999999 |   Int  | NOT NULL |
|     Conocimiento_Req     |                    Nombre del área de dominio necesario para el Cargo.                    |   AAA   |   String   | NOT NULL |
|    Años_Exp    |                   Cantidad de años de experiencia en el puesto.                   |   999   |   INT   | 0<= |
| Titulo_Requerido | Nombre del título de dominio necesario para el Cargo.  |   AAA   |   String   | NOT NULL |
### Entidad: Experiencia_Laboral
#### Descripción: Descripción de la experiencia laboral del postulante
|    Atributo    |                                   Descripción                                   | Formato | Naturaleza |  Valores |
|:--------------:|:-------------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|   Id_Experiencia   |            Identificador único de cada experiencia de un postulante.           | 999999 |   Int  | NOT NULL |
|     Nombre_lugar     |                    Nombre del lugar donde trabajó el postulante.                    |   AAA   |   String   | NOT NULL |
|    Cargo_ejercido    |                   Cargo que ejerció el postulante en dicho lugar.                   |   AAA   |   INT   | 0<= |
| Tiempo_ejercido | Tiempo ejercido en dicho lugar en meses.  |   999   |   INT   | 0<= |
### Entidad: Certificados
#### Descripción: Descripción de los certificados que posee el postulante
|    Atributo    |                                   Descripción                                   | Formato | Naturaleza |  Valores |
|:--------------:|:-------------------------------------------------------------------------------:|:-------:|:----------:|:--------:|
|   Id_Certificado   |            Identificador único de cada certificado de un postulante.           | 999999 |   Int  | NOT NULL |
|     Curso_certificado     |                    Nombre del cursó que completó el postulante.                    |   AAA   |   String   | NOT NULL |
|    Nivel_certificado    |                   Nivel de dominio del curso que tomó (Básico, Intermedio o Avanzado).                   |   AAA   |   Varchar   | NOT NULL |

## Relaciones
| Nombre_Relación |       Entidad Participante 1      |  Entidad Participante 2 | Cardinalidad |                              Atributos Propios de la Evaluación                             | ¿Entidad aparte? |                   Identificador                  |
|:---------------:|:---------------------------------:|:-----------------------:|:------------:|:-------------------------------------------------------------------------------------------:|:----------------:|:------------------------------------------------:|
|     CONTIENE    |             Entrevista            |        Preguntas        |      1:N     |                                              -                                              |        NO        |                 ID_Ent+ID_Factura                |
|     UTILIZA     |      Evaluación_Reclutamiento     |        Entrevista       |      1:1     |                                              -                                              |        NO        |            Id_Eva_Reclutamiento+Id_Ent           |
|     NECESITA    |          Solicitud_Empleo         |        Curriculum       |      1:1     |                                              -                                              |        NO        |               ID_Sol+ID_Curriculum               |
|     PRESENTA    |             Candidato             |     Solicitud_Empleo    |      1:N     |                                              -                                              |        NO        |            ID_Can+ID_Solicitud_Empleo            |
|     CALIFICA    |      Evaluación_Reclutamiento     |        Candidato        |      1:1     |                                     Resultado_Evaluacion                                    |        NO        |               ID_Eva+ID_Ent+ID_Can               |
|     PROCESA     |     Especialista_Reclutamiento    |         Vacante         |      1:N     |                                              -                                              |        NO        |                 ID_Esp+ID_Vacante                |
|     SOLICITA    |            Departamento           |         Vacante         |      1:N     |                                              -                                              |        NO        |            ID_Departamento+ID_Vacante            |
|      SIGUE      |               Sesión              |   Programa_Capacitador  |      N:1     |                                              -                                              |        NO        |                  ID_Sesion+ID_PC                 |
|     SOLICITA    |              Empleado             |          Sesión         |      N:M     |                                          Asistencia                                         |        SI        |                  ID_Sesion+ID_PC                 |
|      DIRIGE     |             Instructor            | Evaluación_Capacitación |      1:N     |                                              -                                              |        NO        |        CodEvaluación+CodSesión+CodEmpleado       |
|     SOLICITA    |              Empleado             |         Licencia        |      1:N     |                                              -                                              |        NO        |             Cod_Licencia+ID_Empleado             |
|       PIDE      |              Empleado             |         Permiso         |      1:N     |                                              -                                              |        NO        |              Cod_Permiso+ID_Empleado             |
|      GENERA     |              Empleado             |        Asistencia       |      1:N     |                                              -                                              |        NO        | Cod_Asistencia+ID_Empleado                       |
|      TIENE      |       Cese       |          Beneficios_Cese          |      1:N     |                                              -                                              |        NO        | ID_Cese+ID_Beneficios_Cese     |
|      GENERA     |              Cese             |  Cuestionario_Salida  |      1:1     |                                              -                                              |        NO        | ID_Cese+ID_Cuestionario_Salida     |
|      GENERA     |                Cuestionario_Salida               |  Pregunta_Salida  |      1:1     |                   -    |        NO        | ID_Cuestionario_Salida+ID_Pregunta_Salida    |
|     CREA    |             Supervisor            |         Cuestionario_Salida         |      1:N     |                                              -                                              |        NO        | ID_Supervisor+ID_Cuestionario_Salida                         |
|    PERTENECE    |             Supervisor            |         Empleado        |      1:1     |                                              -                                              |        NO        | ID_Supervisor+ID_Empleado                        |
|     SOLICITA    |              Empleado             |         Cese        |      1:N     |                                              -                                              |        NO        | ID_Empleado+ID_Cese                          |
|      RECIBE     |              Empleado             |          Nómina         |      1:N     |                                              -                                              |        NO        | ID_Empleado+ID_Nómina                            |
|      POSEE      |               Nómina              |          Pago_Total          |      1:1     |                                              -                                              |        NO        | ID_Nómina+ID_Pago_Total                               |
|      REVISA     |               Pago_Total               |      Sueldo     |      1:1     |                                              -                                              |        NO        | ID_Pago_Total+ID_Sueldo                       |
|    DESCUENTA    |               Pago_Total               |       Modificaciones       |      1:1     |                                              -                                              |        NO        | ID_Pago_Total+ID_Modificaciones                          |
|      POSEE      |              Empleado             |     Cuenta_Bancaria     |      1:1     |                                              -                                              |        NO        | ID_Empleado+ID_Cuenta_Bancaria                   |
|      CUMPLE     |              Empleado             |           Cargo           |      1:1     |                                              -                                              |        NO        | ID_Empleado+ID_Cargo                               |
|    PERTENECE    |              Empleado             |       Departamento      |      1:1     |                                              -                                              |        NO        | ID_Empleado+ID_Departamento                      |
|      TIENE      |              Empleado             |          Sueldo         |      1:1     |                                              -                                              |        NO        | ID_Empleado+ID_Sueldo                            |
|      RECIBE     |              Empleado             |         Cuestionario        |      N:N     |                               Fecha_rellenado, Hora_rellenado                               |        SI        | ID_Empleado+ID_Cuestionario                          |
|      REVISA     |            Gerente_RRHH           |         Cuestionario        |      1:N     | Fecha_envío_gerencia, Hora_envío_gerencia, Fecha_revisión, Hora_revisión, Estado_aprobación |        SI        | ID_Gerente_RRHH+ID_Cuestionario                      |
|      GENERA     |              Cuestionario             |         Reporte         |      1:N     |                                    -                                              |        NO        | ID_Cuestionario+ID_Reporte                           |
|      EVALUA     |              Reporte              |         Empleado        |      N:1     |                                              -                                              |        NO        | ID_Reporte+ID_Empleado                           |
|    PERTENECE    |            Gerente_RRHH           |         Empleado        |      1:1     |                                              -                                              |        NO        | ID_Gerente_RRHH+ID_Empleado                      |
|       CREA      | Especialista |         Cuestionario        |      1:N     |                                              Fecha_creación, Hora_creación, Estado_creación                                              |        SI        | ID_Especialista+ID_Cuestionario |

---
***[Volver al inicio](../../../README.md)***
