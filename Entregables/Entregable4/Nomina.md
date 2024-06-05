# Sentencias SQL para el prototipo del módulo Nomina

## 1. Actualizar información de un empleado

| Código requerimiento | R-0002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-007 |
|    Imagen interfaz   |    ![N1](../Entregable3/Front/N1.PNG)   |

#### Acción 1:
Botón 'Actualizar un dato': El asistente de RRHH. actualizará un dato del empleado.

    @Id_empleado = (SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1)+1

## 2. Registrar actualización de información de un empleado

| Código requerimiento | R-0002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-008 |
|    Imagen interfaz   |    ![N2](../Entregable3/Front/N2.PNG)   |

#### Acción 2:
Carga de página: Se llenará la lista de datos del empleado.

    SELECT 
        e.Nombre_Empleado AS nombre,
        e.Apellido_Empleado AS apellido,
        d.Nombre_Departamento AS departamento,
        e.Estado_Civil AS estado_civil,
        e.Cant_Hijos AS cantidad_de_hijos,
        e.Direccion AS direccion,
        c.Nombre AS puesto
    FROM 
        Empleado e
    LEFT JOIN 
        Departamento d ON e.ID_Departamento = d.ID_Departamento
    LEFT JOIN 
        Cargo c ON e.ID_Cargo = c.ID_Cargo
    WHERE 
        e.DNI LIKE <1>;

#### Acción 3:
Botón 'Confirmar': para insertar las modificaciones de datos del empleado.

    UPDATE Empleado
        SET 
            Nombre_Empleado = p_Nombre_Empleado,
            Apellido_Empleado = p_Apellido_Empleado,
            Telefono = p_Telefono,
            Direccion = p_Direccion,
            Correo = p_Correo,
            Estado_Civil = p_Estado_Civil,
            Cant_Hijos = p_Cant_Hijos,
            ID_Departamento = p_ID_Departamento,
            ID_Cargo = p_ID_Cargo
        WHERE DNI = <2>;

## 3. Registro y actualización de ajuste salarial de un empleado

| Código requerimiento | R-0020 |
|:--------------------:|:-----:|
|    Código interfaz   | I-009 |
|    Imagen interfaz   |    ![N3](../Entregable3/Front/N3.PNG)   |

#### Acción 4:
Botón 'Modificar el pago de algún empleado': El asistente de RRHH. actualizará las asignaciones salariasles que pueda presentar un empleado.

    @Id_empleado = (SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1)+1

## 4. Registro y actualización de ajuste salarial de un empleado

| Código requerimiento | R-0020 |
|:--------------------:|:-----:|
|    Código interfaz   | I-010 |
|    Imagen interfaz   |    ![N4](../Entregable3/Front/N4.PNG)   |

#### Acción 5:
Botón 'Confirmar': para insertar las asignaciones salariales del empleado.

    INSERT INTO Modificacion (id_modificacion, tipo_modificacion, monto_modificacion, moneda, fecha_emision)
    VALUES (
        @Id_modificacion,
        @Tipo_modificacion,
        @Monto_modificacion,
        @Moneda,
        @Fecha_emision
    );


## 5. Asignación de concepto a empleados

| Código requerimiento | R-0020 |
|:--------------------:|:-----:|
|    Código interfaz   | I-011 |
|    Imagen interfaz   |    ![N5](../Entregable3/Front/N5.PNG)   |

#### Acción 6:
Botón 'Confirmar': para aplicar la asignar de acuerdo a concepto en los empleados.

    SELECT 
        e.Nombre_Empleado AS nombre,
        e.Apellido_Empleado AS apellido,
        e.DNI,
        c.Nombre AS rol,
        d.Nombre_Departamento AS departamento,
        s.Monto_Salario_Bruto AS monto_salario_bruto
    FROM 
        Empleado e
    LEFT JOIN 
        Departamento d ON e.ID_Departamento = d.ID_Departamento
    LEFT JOIN 
        Cargo c ON e.ID_Cargo = c.ID_Cargo
    LEFT JOIN
        Sueldo s ON e.ID_Empleado = s.ID_Empleado
    LEFT JOIN
        Pago_Total pt ON s.ID_Sueldo = pt.ID_Sueldo
    LEFT JOIN
        Modificacion m ON pt.ID_Modificacion = m.ID_Modificacion
    WHERE 
        m.Tipo_Modificacion LIKE '%Tipo de Modificación%';


## 6. Programar y gestión de pagos

| Código requerimiento | R-0021 |
|:--------------------:|:-----:|
|    Código interfaz   | I-012 |
|    Imagen interfaz   |    ![N6](../Entregable3/Front/N6.PNG)   |

#### Acción 7:
Botón 'Confirmar': se agregará un registro del pago asignado al empleado.

    INSERT INTO Pago_Total (ID_Pago_Total, Monto_Pagar, Periodo_Pago, Moneda)
    VALUES (
        @Id_pago_total,
        @Monto_pagar,
        @Periodo_pago,
        @Moneda
    );



# Funcionalidad primaria elegida: Nomina de Administración de Beneficios y Compensaciones
## Sustentación
El flujo de las actividades por las que pasa Nomina me pareció muy llamativo ya que en ella se busca determinar todos los beneficios y descuentos que percibirá el empleado. De esa manera se busca lograr determinar de una manera efectiva que se integren todas las actividades que afecten su salario. 

## Mapeo a Nivel de Requerimientos e Interfaces de Usuario
Abarca desde la selección (R-0002 / I-007), modificación y actualización (R-0002 / I-008); selección de modificación de pago (R-0020 / I-009), registro y actualización de pago (R-0020 / I-010), asignación del concepto (R-0020 / I-011) y programación de pago (R-0021 / I-012), cada uno representado por páginas con visualización sencilla y clara. Estas interfaces presentan botones de acción para operaciones como guardar, enviar, editar y eliminar cuestionarios y respuestas. Además, incluyen campos de entrada para la identificación del empleado, el concepto de lo asignado, importe, el tipo de moneda, pago, fecha de emisión, período de pago, entre otros cambios los cuales se podían actualizar los datos si en caso fuera necesarioe en la información del empleado.

## Flujo de actividades
| **Actividad** |                                                                                                                                                                                                                                                                                                      **Descripción**                                                                                                                                                                                                                                                                                                     |
|:-------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|       1       |                                       La "Creación de Cuestionario" facilita a los especialistas en relaciones laborales la elaboración de nuevas evaluaciones de desempeño. Desde la página designada, estos profesionales ingresan su identificación y eligen el tipo de cuestionario a desarrollar, ya sea para subordinados, supervisores, jefes o gerentes. Luego, agregan preguntas relevantes asegurándose de evitar duplicaciones y finalmente guardan el cuestionario creado con el botón correspondiente, permitiendo así su posterior uso en la evaluación del personal. ![N2](../Entregable3/Front/N2.PNG)                                      |
|       2       | La actividad de "Edición de Cuestionario" brinda a los especialistas en relaciones laborales y gerentes de recursos humanos la capacidad de actualizar y mejorar cuestionarios existentes. Desde la página de edición, seleccionan el tipo de cuestionario a modificar y revisan su contenido actual. Aquí, pueden agregar nuevas preguntas, editar las existentes o eliminar aquellas que consideren innecesarias. Además, tienen la opción de ajustar el estado de envío y aprobación del cuestionario para reflejar los cambios realizados, garantizando así la precisión y relevancia del instrumento de evaluación. ![N4](../Entregable3/Front/N4.PNG) |
|       3       |                                                                       La "Aprobación de Cuestionario" permite a los gerentes de recursos humanos validar los cuestionarios elaborados por los especialistas en relaciones laborales antes de su distribución. Desde la página de aprobación, seleccionan el tipo de cuestionario a revisar y visualizan su contenido actual. Aquí, ingresan el estado de aprobación correspondiente, confirmando así la idoneidad del cuestionario para su implementación en el proceso de evaluación del personal. ![N5](../Entregable3/Front/N5.PNG)                                                                      |
|       4       |                         La actividad de "Respuesta al Cuestionario" capacita a los empleados para completar las evaluaciones de desempeño asignadas. Desde la página de respuesta, ingresan su identificación y seleccionan el tipo de cuestionario a completar. Luego, visualizan las preguntas del cuestionario junto con las opciones de respuesta disponibles, seleccionando la más apropiada para cada pregunta. Una vez que han respondido todas las preguntas, envían sus respuestas haciendo clic en el botón correspondiente, lo que completa el proceso de evaluación de su desempeño. ![N6](../Entregable3/Front/N6.PNG)                        |
