-- Inserción masiva de 100,000 pacientes sintéticos
INSERT INTO pacientes (documento, nombre_completo, fecha_nacimiento)
SELECT 
    'CC' || (1000000 + generate_series),
    'Paciente ' || generate_series,
    DATE '1970-01-01' + (random() * (CURRENT_DATE - DATE '1970-01-01'))::integer
FROM generate_series(1, 100000);