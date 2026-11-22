-- Activar extensión para geolocalización avanzada
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE zonas (
    id_zona SERIAL PRIMARY KEY,
    nombre_zona VARCHAR(100) NOT NULL
);

CREATE TABLE centros_salud (
    id_centro SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    id_zona INT REFERENCES zonas(id_zona),
    ubicacion GEOMETRY(Point, 4326) NOT NULL
);

CREATE TABLE pacientes (
    id_paciente SERIAL PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE historias_clinicas (
    id_historia SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES pacientes(id_paciente),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalles_medicos JSONB NOT NULL
);