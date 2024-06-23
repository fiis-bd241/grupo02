# Generación de Informes de Empleados Cesados

## Descripción
Este proceso de batch se encarga de generar un informe mensual de los empleados cesados, guardándolo en una carpeta de la máquina. El informe se genera en formato CSV.

## Importancia
- **Automatización**: Reduce la carga de trabajo manual.
- **Precisión**: Asegura la consistencia y precisión de los datos generados.
- **Disponibilidad**: Facilita el acceso a información relevante y actualizada.

## Código

### Script de Batch: `generate_cese_report.py`

```python
import os
import csv
from datetime import datetime, timedelta
from django.db import connection
from django.conf import settings

def generate_cese_report():
    # Definir el rango de los datos para el reporte
    today = datetime.today()
    first_day_of_month = today.replace(day=1)
    last_day_of_last_month = first_day_of_month - timedelta(days=1)
    first_day_of_last_month = last_day_of_last_month.replace(day=1)

    query = """
        SELECT E.DNI, E.nombre_empleado, E.apellido_empleado, D.nombre_departamento, C.fecha_inicio_cese, C.tipo_cese
        FROM cese AS C
        INNER JOIN empleado AS E ON C.id_empleado = E.id_empleado
        INNER JOIN departamento AS D ON E.id_departamento = D.id_departamento
        WHERE C.fecha_inicio_cese BETWEEN %s AND %s
    """

    with connection.cursor() as cursor:
        cursor.execute(query, [first_day_of_last_month, last_day_of_last_month])
        empleados_cesados = cursor.fetchall()

    # Definir la dirección de almacén del reporte
    report_file_path = os.path.join(settings.BASE_DIR, 'reports', f'cese_report_{last_day_of_last_month.strftime("%Y_%m")}.csv')

    # Creación de un directorio de almacén
    os.makedirs(os.path.dirname(report_file_path), exist_ok=True)

    # Escribir los datos en un archivo csv
    with open(report_file_path, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['DNI', 'Nombre', 'Apellido', 'Departamento', 'Fecha de Cese', 'Tipo de Cese'])
        for empleado in empleados_cesados:
            writer.writerow(empleado)

if __name__ == '__main__':
    generate_cese_report()
```

## Configuración de Tareas Programadas en Windows

1. Abrir el Programador de tareas.
2. Crear una tarea básica.
3. Programar la tarea para que se ejecute mensualmente.
4. Configurar la acción para ejecutar el script Python con el intérprete de Python.

## Demostración

![batch](batch.png)

# Creacion automatica de sesiones si el existen sesiones con esado 'Pendiente'

Se preve que este proceso se pueda ejecutar dirariamente revisando si existen sesiones que aun tienen estados pendientes

    CREATE OR REPLACE FUNCTION insert_into_dynamic_tables()
    RETURNS VOID AS $$
    DECLARE
        session_id INTEGER;
    BEGIN
        FOR session_id IN
            SELECT id_sesion
            FROM Sesion
            WHERE Estado = 'Pendiente'
              AND id_sesion NOT IN (SELECT id_sesion FROM Empleado_Sesion)
        LOOP
            INSERT INTO Empleado_Sesion (id_sesion, id_empleado, asistencia)
            SELECT lm.id_programa_c, lm.id_empleado, 'Pendiente'
            FROM Lista_Matricula lm
            WHERE lm.id_programa_c IN (
                SELECT pc.id_programa_c
                FROM Programa_Capacitador pc
                WHERE pc.id_programa_c IN (
                    SELECT s.id_programa_c
                    FROM Sesion s
                    WHERE s.id_sesion = session_id
                )
            ) AND lm.id_empleado NOT IN (
                SELECT es.id_empleado
                FROM Empleado_Sesion es
                WHERE es.id_sesion = session_id
            );
    
            INSERT INTO Evaluacion_Sesion (ID_Evaluacion, ID_Sesion, Resultado)
            SELECT ec.id_evaluacion, s.id_sesion, 'Pendiente'
            FROM Evaluacion_Capacitacion ec
            CROSS JOIN Sesion s
            WHERE s.id_sesion = session_id
            AND ec.id_evaluacion NOT IN (
                SELECT es.ID_Evaluacion
                FROM Evaluacion_Sesion es
                WHERE es.ID_Sesion = session_id
            );
    

            INSERT INTO Evaluacion_Empleado (ID_Evaluacion, ID_Empleado, Resultado)
            SELECT ec.id_evaluacion, lm.id_empleado, 'Pendiente'
            FROM Evaluacion_Capacitacion ec
            JOIN Lista_Matricula lm ON ec.id_evaluacion = lm.id_programa_c
            WHERE ec.id_evaluacion IN (
                SELECT ec.id_evaluacion
                FROM Evaluacion_Capacitacion ec
                JOIN Sesion s ON ec.id_evaluacion = s.id_programa_c
                WHERE s.id_sesion = session_id
            ) AND lm.id_empleado NOT IN (
                SELECT ee.ID_Empleado
                FROM Evaluacion_Empleado ee
                WHERE ee.ID_Evaluacion = ec.id_evaluacion
            );
    
        END LOOP;
    
    
    END;
    $$ LANGUAGE plpgsql;

### Explicación:
Condición en la columna Estado:

Se agregó WHERE Estado = 'Pendiente' a la consulta seleccionando id_sesion de Sesion. Esto asegura que la función procese sesiones solo cuando su estado sea 'Pendiente'.
Recorriendo sesiones:

La función itera sobre sesiones (session_id) que tienen un estado de 'Pendiente'.
Comprueba si el ID de la sesión no existe ya en Empleado_Sesion, asegurando que cada sesión se procese solo una vez.
Insertar declaraciones:

Las inserciones en Empleado_Sesion, Evaluacion_Sesion y Evaluacion_Empleado se ejecutan solo para sesiones que cumplen con la condición de estado 'Pendiente'.
Tipo de devolución:

La función aún devuelve VOID, lo que indica que realiza acciones basadas en la condición del estado sin devolver ningún valor específico.
### Uso:
Llame a insert_into_dynamic_tables() después de insertar nuevos datos en Sesion, Lista_Matricula y potencialmente Evaluacion_Capacitacion, asegurando que solo las sesiones con estado 'Pendiente' activen actualizaciones en tablas relacionadas (Empleado_Sesion, Evaluacion_Sesion, Evaluacion_Empleado).
Este enfoque garantiza que su función funcione de manera eficiente al centrarse solo en sesiones relevantes según su estado, manteniendo la coherencia e integridad de los datos en su base de datos. Ajuste la función y las consultas según el esquema y los requisitos específicos de su base de datos.
