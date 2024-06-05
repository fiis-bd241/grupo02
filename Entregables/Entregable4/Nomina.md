# Sentencias SQL para el prototipo del módulo Nomina

## 1. Actualizar información de un empleado

| Código requerimiento | R-0002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-007 |
|    Imagen interfaz   |    ![N1](../Entregable3/Front/N1.PNG)   |

#### Acción 1:
Elegir la opción de actualizar un dato en la intranet del asistente de RRHH.

    @Id_empleado = (SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1)+1

## 2. Registrar actualización de información de un empleado

| Código requerimiento | R-0002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-008 |
|    Imagen interfaz   |    ![N2](../Entregable3/Front/N2.PNG)   |

#### Acción 2:
Seleccionar en DNI/Código de empleado para obtener los datos que le corresponden al empleado.

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
        e.DNI LIKE 'INGRESO%';

#### Acción 3:
Botón 'confirmar' para modificar o actualizar datos del empleado.

    CREATE OR REPLACE PROCEDURE ActualizarDatosEmpleado(
        p_DNI CHAR(8),
        p_Nombre_Empleado VARCHAR(32),
        p_Apellido_Empleado VARCHAR(32),
        p_Telefono VARCHAR(15),
        p_Direccion VARCHAR(64),
        p_Correo VARCHAR(32),
        p_Estado_Civil VARCHAR(16),
        p_Cant_Hijos INTEGER,
        p_ID_Departamento INTEGER,
        p_ID_Cargo INTEGER
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
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
        WHERE DNI = p_DNI;
    END;
    $$;

## 3. Registro y actualización de ajuste salarial de un empleado

| Código requerimiento | R-0020 |
|:--------------------:|:-----:|
|    Código interfaz   | I-009 |
|    Imagen interfaz   |    ![N3](../Entregable3/Front/N3.PNG)   |

#### Acción 4:
Elegir la opción de modificar el pago de algún empleado en la intranet del asistente de RRHH.

    @Id_empleado = (SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1)+1

## 4. Registro y actualización de ajuste salarial de un empleado

| Código requerimiento | R-0020 |
|:--------------------:|:-----:|
|    Código interfaz   | I-010 |
|    Imagen interfaz   |    ![N4](../Entregable3/Front/N4.PNG)   |

#### Acción 5:
Insertar las remuneraciones o descuentos en el salario del empleado.

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



## 6. Programar y gestión de pagos

| Código requerimiento | R-0021 |
|:--------------------:|:-----:|
|    Código interfaz   | I-012 |
|    Imagen interfaz   |    ![N6](../Entregable3/Front/N6.PNG)   |

#### Acción 7:
