
CREATE DATABASE Nueva_Bd_Trabajo_Practico;
USE Nueva_Bd_Trabajo_Practico;
CREATE TABLE Provincias (
    id_provincia INT PRIMARY KEY,
    nombre_provincia VARCHAR(50)
);


INSERT INTO Provincias (id_provincia, nombre_provincia) VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Corrientes'),
(4, 'Santa Fe'),
(5, 'San Luis'),
(6, 'Salta'),
(7, 'Neuquén');


CREATE TABLE Localidades (
    id_localidad INT PRIMARY KEY,
    id_provincia INT,
    nombre_localidad VARCHAR(50),
    FOREIGN KEY (id_provincia) REFERENCES Provincias(id_provincia)
);


INSERT INTO Localidades (id_localidad, id_provincia, nombre_localidad) VALUES
(1, 2, 'Malagueño'),
(2, 2, 'Cruz del Eje'),
(3, 1, 'Glew'),
(4, 1, 'Merlo'),
(5, 1, 'Caseros'),
(6, 2, 'Toledo'),
(7, 4, 'Rosario'),
(8, 6, 'Salta'),
(9, 7, 'Neuquén');


CREATE TABLE Alumnos (
    id_alumno INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES Localidades(id_localidad)
);


INSERT INTO Alumnos (id_alumno, nombre, apellido, id_localidad) VALUES
(1, 'Clara', 'Romero', 6),
(2, 'Francisco', 'Tapía', 6),
(3, 'Julia', 'Guruy', 3),
(4, 'Mariana', 'Méndez', 4),
(5, 'Marcos', 'Hernández', 5),
(6, 'Eleonora', 'Borda', 1),
(7, 'Guadalupe', 'Paez', 2),
(8, 'Luciano', 'Palotti', 7),
(9, 'Javier', 'Alvarez', 8),
(10, 'Felipe', 'Capdevila', 9);


CREATE VIEW AlumnosVista AS
SELECT A.id_alumno, A.nombre AS NombreAlumno, A.apellido AS ApellidoAlumno, L.nombre_localidad AS NombreLocalidad, P.nombre_provincia AS NombreProvincia
FROM Alumnos A
JOIN Localidades L ON A.id_localidad = L.id_localidad
JOIN Provincias P ON L.id_provincia = P.id_provincia;


CREATE VIEW LocalidadesProvinciasVista AS
SELECT L.id_localidad, L.nombre_localidad AS NombreLocalidad, P.id_provincia, P.nombre_provincia AS NombreProvincia
FROM Localidades L
JOIN Provincias P ON L.id_provincia = P.id_provincia;


DELIMITER //


CREATE PROCEDURE AgregarAlumno(IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_id_localidad INT)
BEGIN
    INSERT INTO Alumnos (nombre, apellido, id_localidad) VALUES (p_nombre, p_apellido, p_id_localidad);
END//

CREATE PROCEDURE ModificarAlumno(IN p_id_alumno INT, IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_id_localidad INT)
BEGIN
    UPDATE Alumnos SET nombre = p_nombre, apellido = p_apellido, id_localidad = p_id_localidad WHERE id_alumno = p_id_alumno;
END//
CREATE PROCEDURE EliminarAlumno(IN p_id_alumno INT)
BEGIN
    DELETE FROM Alumnos WHERE id_alumno = p_id_alumno;
END//

CREATE PROCEDURE SeleccionarAlumnos()
BEGIN
    SELECT * FROM Alumnos;
END//

DELIMITER ;
