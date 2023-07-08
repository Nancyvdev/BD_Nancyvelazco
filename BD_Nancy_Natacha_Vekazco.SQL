CREATE DATABASE Bd_Nancy_Velazco;
USE Bd_Nancy_Velazco;

CREATE TABLE alumnos (
  id_alumno INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  FechaNacimiento DATE,
  FechaAlta DATE
);

CREATE TABLE provincias (
  id_provincia INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE localidades (
  id_localidad INT PRIMARY KEY,
  id_provincia INT,
  nombre VARCHAR(50)
);

INSERT INTO alumnos (nombre, apellido) VALUES
('Clara', 'Romero'),
('Francisco', 'Tapía'),
('Julia', 'Guruy'),
('Mariana', 'Méndez'),
('Marcos', 'Hernández'),
('Eleonora', 'Borda'),
('Guadalupe', 'Paez'),
('Luciano', 'Palotti'),
('Javier', 'Alvarez'),
('Felipe', 'Capdevila');

INSERT INTO provincias (id_provincia, nombre) VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Tucumán'),
(4, 'Santa Fe'),
(5, 'San Luis'),
(6, 'Salta'),
(7, 'Neuquén');

INSERT INTO localidades (id_localidad, id_provincia, nombre) VALUES
(1, 2, 'Malagueño'),
(2, 2, 'Cruz del Eje'),
(3, 1, 'Glew'),
(4, 1, 'Merlo'),
(5, 1, 'Caseros'),
(6, 2, 'Toledo'),
(7, 4, 'Rosario'),
(8, 6, 'Salta'),
(9, 7, 'Neuquén');

UPDATE alumnos
SET FechaNacimiento =
    CASE
        WHEN id_alumno = 1 THEN '1999-07-12'
        WHEN id_alumno = 2 THEN '2000-04-28'
        WHEN id_alumno = 3 THEN '2001-02-15'
        WHEN id_alumno = 4 THEN '1999-09-03'
        WHEN id_alumno = 5 THEN '2000-12-06'
        WHEN id_alumno = 6 THEN '1999-11-21'
        WHEN id_alumno = 7 THEN '2001-07-30'
        WHEN id_alumno = 8 THEN '2000-02-10'
        WHEN id_alumno = 9 THEN '1999-06-17'
        WHEN id_alumno = 10 THEN '2001-05-02'
    END;

UPDATE alumnos
SET FechaAlta =
    CASE
        WHEN id_alumno = 1 THEN '2022-12-06'
        WHEN id_alumno = 2 THEN '2023-02-01'
        WHEN id_alumno = 3 THEN '2023-01-17'
        WHEN id_alumno = 4 THEN '2023-01-22'
        WHEN id_alumno = 5 THEN '2022-12-27'
        WHEN id_alumno = 6 THEN '2023-01-06'
        WHEN id_alumno = 7 THEN '2022-12-14'
        WHEN id_alumno = 8 THEN '2022-12-31'
        WHEN id_alumno = 9 THEN '2023-01-29'
        WHEN id_alumno = 10 THEN '2023-02-09'
    END;

DELETE FROM provincias WHERE nombre = 'Tucumán';

INSERT INTO provincias (id_provincia, nombre) VALUES (3, 'Corrientes');

SELECT pr.id_provincia AS pr_id,
       lo.id_provincia AS lo_id,
       pr.nombre AS pr_nombre,
       lo.nombre AS lo_nombre
FROM provincias AS pr
INNER JOIN localidades AS lo ON pr.id_provincia = lo.id_provincia;

SELECT pr.id_provincia AS pr_id,
       lo.id_localidad AS lo_id,
       pr.nombre AS pr_nombre,
       lo.nombre AS lo_nombre
FROM provincias AS pr
INNER JOIN localidades AS lo ON pr.id_provincia = lo.id_provincia;

SELECT ia AS id_alumno,
       na AS nombre_alumno,
       aa AS apellido_alumno
FROM alumnos
ORDER BY na ASC, aa ASC, pr ASC, lo ASC 
FROM alumnos;
