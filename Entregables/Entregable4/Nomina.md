# Sentencias SQL para el prototipo del módulo Nomina

## 1. Modificar información de un empleado

| Código requerimiento | R-0002 |
|:--------------------:|:-----:|
|    Código interfaz   | I-007 |
|    Imagen interfaz   |    ![N1](../Entregable3/Front/N1.PNG)   |

#### Acción 1:
Elegir la opción de actualizar dato en la intranet del asistente de RRHH.

    @Id_empleado = (SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1)+1

