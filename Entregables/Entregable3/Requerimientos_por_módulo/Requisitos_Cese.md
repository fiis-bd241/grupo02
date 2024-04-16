## Requisitos para el Cese de Personal:

1. **Registro de Cese:**
   - El sistema debe permitir el registro del cese de un empleado, incluyendo la fecha de fin de contrato, motivo del cese y cualquier información relevante.
   - Debe ser posible registrar diferentes tipos de cese, como renuncia voluntaria, despido o retiro.

2. **Documentación de Finiquito:**
   - El sistema debe generar automáticamente los documentos de finiquito y liquidación correspondientes al cese de un empleado.
   - Deben incluirse detalles como indemnizaciones, prestaciones laborales, vacaciones no disfrutadas y cualquier otro pago pendiente.

3. **Gestión de Trámites Administrativos:**
   - Debe ser posible gestionar todos los trámites administrativos necesarios para el cese de un empleado, como la entrega de la carta de renuncia, el cálculo de prestaciones y la liquidación final.
   - El sistema debe guiar al usuario a través de estos procesos y asegurar su cumplimiento conforme a la legislación laboral vigente.

4. **Entrevistas de Salida:**
   - Debe facilitarse la realización de entrevistas de salida con los empleados que cesan, con el fin de recopilar retroalimentación sobre su experiencia laboral y las razones de su salida.
   - El sistema debe registrar y almacenar las respuestas obtenidas durante estas entrevistas para su posterior análisis y mejora continua.

5. **Notificación a Departamentos Relevantes:**
   - El sistema debe notificar automáticamente a los departamentos relevantes, como Recursos Humanos, Nómina y Administración, sobre el cese de un empleado.
   - Deben actualizarse los registros internos y procedimientos correspondientes para reflejar el cambio en el estado del empleado.

6. **Seguridad y Confidencialidad:**
   - Se deben implementar medidas de seguridad robustas para proteger la información confidencial relacionada con el cese de los empleados.
   - Solo los usuarios autorizados deben tener acceso a los datos del cese, garantizando la privacidad y confidencialidad de la información.

7. **Historial de Ceses:**
   - El sistema debe mantener un historial completo de todos los ceses de empleados, incluyendo detalles como fechas, motivos y trámites realizados.
   - Debe ser posible acceder a esta información para consultas futuras y análisis de tendencias.

8. **Informes y Estadísticas:**
   - Deben generarse informes periódicos sobre los ceses de personal, proporcionando estadísticas relevantes sobre los motivos de salida, tasas de rotación y otros indicadores clave.
   - Estos informes pueden ayudar a identificar áreas problemáticas y tomar medidas correctivas para mejorar la retención de empleados.

9. **Seguimiento de Indicadores:**
   - Debe ser posible realizar un seguimiento de indicadores relacionados con los ceses de personal, como el tiempo promedio de permanencia en la empresa y la frecuencia de ceses por departamento o área.
   - Estos indicadores pueden ayudar a identificar patrones y tendencias que requieran atención especial.

## Caso de uso 5 : Registrar cese de personal

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
|            6             | Guarda el registro.                                                                                                                              
#### Prototipo

![ ](../Front/RegistrarCese.png)