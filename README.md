# Hospital

Se desea diseñar una base de datos para guardar la información sobre médicos, empleados y pacientes de un centro de salud. De los médicos se desea saber su nombre, dirección, teléfono, población, provincia, código postal, NIF, número de la seguridad social, número de colegiado y si es médico titular, médico interino o médico sustituto. Cada médico tiene un horario en el que pasa consulta, pudiendo ser diferente cada día de la semana. Los datos de los médicos sustitutos no desaparecen cuando finalizan una sustitución, se les da una fecha de baja. Así, cada sustituto puede tener varias fechas de alta y fechas de baja, dependiendo de las sustituciones que haya realizado. Si la última fecha de alta es posterior a la última fecha de baja, el médico está realizando una sustitución en la actualidad en el centro de salud. El resto de empleados son los ATS, ATS de zona, auxiliares de enfermería, celadores y administrativos. De todos ellos se desea conocer su nombre, dirección, teléfono, población, provincia, código postal, NIF y número de la seguridad social. De todos, médicos y empleados, se mantiene también información sobre los períodos de vacaciones que tienen planificados y de los que ya han disfrutado. Por último, de los pacientes se conoce su nombre, dirección, teléfono, código postal, NIF, número de la seguridad social y médico que les corresponde.



# Consultas

### 1. Número de pacientes atendidos por cada médico

```sql
    SELECT 

        m.nombre AS nombre_medico,

        COUNT(p.id) AS numero_pacientes

    FROM 

        medico m

    LEFT JOIN 

        paciente p ON m.id = p.medico_id

    GROUP BY 

        m.id, m.nombre;
```

### 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado

```sql
SELECT 

    e.nombre AS nombre_empleado,

    SUM(DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1) AS dias_planificados,

    SUM(CASE WHEN ve.disfrutadas = 1 THEN DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1 ELSE 0 END) AS dias_disfrutados

FROM 

    empleado e

LEFT JOIN 

    vacaciones_empleado ve ON e.id = ve.empleado_id

GROUP BY 

    e.id, e.nombre;



```

### 3. Médicos con mayor cantidad de horas de consulta en la semana

```sql
    SELECT 

        m.nombre AS nombre_medico,

        SUM(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS horas_consulta

    FROM 

        medico m

    LEFT JOIN 

        horario_medico hm ON m.id = hm.medico_id

    GROUP BY 

        m.id, m.nombre

    ORDER BY 

        horas_consulta DESC

    LIMIT 1;
```

### 4.  Número de sustituciones realizadas por cada médico sustituto

```sql
    SELECT 

        m.nombre AS nombre_medico,

        COUNT(s.id) AS numero_sustituciones

    FROM 

        medico m

    LEFT JOIN 

        sustitucion s ON m.id = s.medico_id

    GROUP BY 

        m.id, m.nombre;

```

### 5.  Número de médicos que están actualmente en sustitución

```sql
    SELECT 

        COUNT(DISTINCT m.id) AS numero_medicos

    FROM 

        medico m

    INNER JOIN 

        sustitucion s ON m.id = s.medico_id

    WHERE 

        s.fecha_baja IS NULL OR s.fecha_baja > CURDATE();
```

### 6. Horas totales de consulta por médico por día de la semana

```sql
    SELECT 

        m.nombre AS nombre_medico,

        hm.dia_semana,

        SUM(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS horas_consulta

    FROM 

        medico m

    LEFT JOIN 

        horario_medico hm ON m.id = hm.medico_id

    GROUP BY 

        m.id, hm.dia_semana, m.nombre;
```

### 7.  Médico con mayor cantidad de pacientes asignados

```sql
    SELECT 

        m.nombre AS nombre_medico,

        COUNT(p.id) AS numero_pacientes

    FROM 

        medico m

    LEFT JOIN 

        paciente p ON m.id = p.medico_id

    GROUP BY 

        m.id, m.nombre

    ORDER BY 

        numero_pacientes DESC

    LIMIT 1;
```

### 8. Empleados con más de 10 días de vacaciones disfrutadas

```sql

    SELECT 

        e.nombre AS nombre_empleado,

        SUM(DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1) AS dias_disfrutados

    FROM 

        empleado e

    LEFT JOIN 

        vacaciones_empleado ve ON e.id = ve.empleado_id

    WHERE 

        ve.disfrutadas = 1

    GROUP BY 

        e.id, e.nombre

    HAVING 

        dias_disfrutados > 10;
```

### 9.  Médicos que actualmente están realizando una sustitución

```sql
SELECT 

    m.nombre AS nombre_medico

FROM 

    medico m

INNER JOIN 

    sustitucion s ON m.id = s.medico_id

WHERE 

    s.fecha_baja IS NULL OR s.fecha_baja > CURDATE();

```

### 10.  Promedio de horas de consulta por médico por día de la semana

```sql
    SELECT 

        m.nombre AS nombre_medico,

        hm.dia_semana,

        AVG(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS promedio_horas

    FROM 

        medico m

    LEFT JOIN 

        horario_medico hm ON m.id = hm.medico_id

    GROUP BY 

        m.id, hm.dia_semana, m.nombre;
```

### 11.  Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión

```sql
SELECT 

    e.nombre AS nombre_empleado,

    COUNT(p.id) AS numero_pacientes

FROM 

    empleado e

LEFT JOIN 

    supervision s ON e.id = s.empleado_id

LEFT JOIN 

    medico m ON s.medico_id = m.id

LEFT JOIN 

    paciente p ON m.id = p.medico_id

GROUP BY 

    e.id, e.nombre

ORDER BY 

    numero_pacientes DESC;
```

### 12.  Médicos con más de 5 pacientes y total de horas de consulta en la semana

```sql
SELECT 

    m.nombre AS nombre_medico,

    COUNT(p.id) AS numero_pacientes,

    SUM(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS horas_consulta

FROM 

    medico m

LEFT JOIN 

    paciente p ON m.id = p.medico_id

LEFT JOIN 

    horario_medico hm ON m.id = hm.medico_id

GROUP BY 

    m.id, m.nombre

HAVING 

    numero_pacientes > 5;
```

### 13.  Total de días de vacaciones planificadas y disfrutadas por cada tipo de empleado

```sql
SELECT 

    te.nombre AS tipo_empleado,

    SUM(DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1) AS dias_planificados,

    SUM(CASE WHEN ve.disfrutadas = 1 THEN DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1 ELSE 0 END) AS dias_disfrutados

FROM 

    tipo_empleado te

LEFT JOIN 

    empleado e ON te.id = e.tipo_empleado_id_fk

LEFT JOIN 

    vacaciones_empleado ve ON e.id = ve.empleado_id

GROUP BY 

    te.id, te.nombre;
```

### 14. Total de pacientes por cada tipo de médico

```sql
SELECT 

    tm.nombre AS tipo_medico,

    COUNT(p.id) AS numero_pacientes

FROM 

    tipo_medico tm

LEFT JOIN 

    medico m ON tm.id = m.tipo_medico_id_fk

LEFT JOIN 

    paciente p ON m.id = p.medico_id

GROUP BY 

    tm.id, tm.nombre;
```

### 15. Total de horas de consulta por médico y día de la semana

```sql
SELECT 

    m.nombre AS nombre_medico,

    hm.dia_semana,

    SUM(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS horas_consulta

FROM 

    medico m

LEFT JOIN 

    horario_medico hm ON m.id = hm.medico_id

GROUP BY 

    m.id, hm.dia_semana, m.nombre;
```

### 16. Número de sustituciones por tipo de médico

```sql
SELECT 

    tm.nombre AS tipo_medico,

    COUNT(s.id) AS numero_sustituciones

FROM 

    tipo_medico tm

LEFT JOIN 

    medico m ON tm.id = m.tipo_medico_id_fk

LEFT JOIN 

    sustitucion s ON m.id = s.medico_id

GROUP BY 

    tm.id, tm.nombre;
```

### 17. Total de pacientes por médico y por provincia

```sql
SELECT 

    m.nombre AS nombre_medico,

    m.provincia,

    COUNT(p.id) AS numero_pacientes

FROM 

    medico m

LEFT JOIN 

    paciente p ON m.id = p.medico_id

GROUP BY 

    m.id, m.provincia, m.nombre;

```

### 18. Empleados y médicos con más de 20 días de vacaciones planificadas

```sql
SELECT 

    'Empleado' AS tipo,

    e.nombre AS nombre,

    SUM(DATEDIFF(ve.fecha_fin, ve.fecha_inicio) + 1) AS dias_planificados

FROM 

    empleado e

LEFT JOIN 

    vacaciones_empleado ve ON e.id = ve.empleado_id

GROUP BY 

    e.id, e.nombre

HAVING 

    dias_planificados > 20



UNION



SELECT 

    'Medico' AS tipo,

    m.nombre AS nombre,

    SUM(DATEDIFF(vm.fecha_fin, vm.fecha_inicio) + 1) AS dias_planificados

FROM 

    medico m

LEFT JOIN 

    vacaciones_medico vm ON m.id = vm.medico_id

GROUP BY 

    m.id, m.nombre

HAVING 

    dias_planificados > 20;
```

### 19. Médicos con el mayor número de pacientes actualmente en sustitución

```sql

SELECT 

    m.nombre AS nombre_medico,

    COUNT(p.id) AS numero_pacientes

FROM 

    medico m

LEFT JOIN 

    paciente p ON m.id = p.medico_id

LEFT JOIN 

    sustitucion s ON m.id = s.medico_id

WHERE 

    s.fecha_baja IS NULL OR s.fecha_baja > CURDATE()

GROUP BY 

    m.id, m.nombre

ORDER BY 

    numero_paciente

s DESC

LIMIT 1;

```

### 20. Total de horas de consulta por provincia y día de la semana

```sql

SELECT 

    m.provincia,

    hm.dia_semana,

    SUM(TIMESTAMPDIFF(HOUR, hm.hora_inicio, hm.hora_fin)) AS horas_consulta

FROM 

    medico m

LEFT JOIN 

    horario_medico hm ON m.id

```
