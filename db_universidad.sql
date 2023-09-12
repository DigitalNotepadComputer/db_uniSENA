CREATE DATABASE db_universidad;
USE db_universidad;

CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE profesor (
    id INT PRIMARY KEY,
    init VARCHAR(10),
    nombre VARCHAR(255),
    apellido1 VARCHAR(255),
    apellido2 VARCHAR(255),
    ciudad VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    sexo ENUM('H', 'M') NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE asignatura (
    id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    creditos INT,
    tipo ENUM('basica', 'obligatoria', 'optativa') NOT NULL,
    curso INT NOT NULL,
    cuatrimestre INT,
    id_profesor INT NOT NULL,
    id_grado INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id),
    FOREIGN KEY (id_grado) REFERENCES grado(id)
);

CREATE TABLE alumno_matricula_asignatura (
    id INT PRIMARY KEY NOT null,
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);

CREATE TABLE grado (
    id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(255)
);

CREATE TABLE alumno (
    id INT PRIMARY KEY NOT NULL,
    nit VARCHAR(15) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255),
    ciudad VARCHAR(255),
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE,
    sexo ENUM('H', 'M') NOT NULL
);

CREATE TABLE curso_escolar (
    id INT PRIMARY KEY NOT NULL,
    anyo_inicio INT NOT NULL,
    anyo_fin INT NOT NULL
);


#Tabla departamento
INSERT INTO departamento (id, nombre)
VALUES
    (1, 'Departamento de Matemáticas'),
    (2, 'Departamento de Historia'),
    (3, 'Departamento de Ciencias de la Computación'),
    (4, 'Departamento de Lenguas Extranjeras'),
    (5, 'Departamento de Física');

#Tabla profesor
INSERT INTO profesor (id, init, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento)
VALUES
    (1, 'Dr.', 'Juan', 'González', 'Pérez', 'Ciudad A', 'Calle 123', '555-1234', '1980-05-15', 'H', 1),
    (2, 'Dra.', 'María', 'López', 'Sánchez', 'Ciudad B', 'Avenida 456', '555-5678', '1975-10-22', 'M', 2),
    (3, 'Mtro.', 'Carlos', 'Martínez', 'Gómez', 'Ciudad C', 'Carrera 789', '555-9876', '1988-02-08', 'H', 3),
    (4, 'Dra.', 'Ana', 'Ramírez', 'Díaz', 'Ciudad A', 'Calle 789', '555-2345', '1973-12-03', 'M', 4),
    (5, 'Mtra.', 'Laura', 'Fernández', 'Luna', 'Ciudad B', 'Avenida 1011', '555-8765', '1992-08-17', 'M', 5);

#Tabla asignatura
INSERT INTO asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
VALUES
    (1, 'Matemáticas Básicas', 3, 'basica', 101, 1, 1, 1),
    (2, 'Historia del Arte', 4, 'obligatoria', 201, 2, 2, 2),
    (3, 'Programación Avanzada', 5, 'obligatoria', 301, 1, 3, 3),
    (4, 'Inglés Intermedio', 3, 'optativa', 102, 2, 4, 4),
    (5, 'Física Moderna', 4, 'obligatoria', 202, 1, 5, 5);

#Tabla alumno_matricula_asignatura
INSERT INTO alumno_matricula_asignatura (id, id_alumno, id_asignatura, id_curso_escolar)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 1),
    (4, 4, 4, 2),
    (5, 5, 5, 1);


#Tabla grado
INSERT INTO grado (id, nombre)
VALUES
    (1, 'Licenciatura en Matemáticas'),
    (2, 'Licenciatura en Historia'),
    (3, 'Ingeniería en Informática'),
    (4, 'Estudios de Idiomas'),
    (5, 'Licenciatura en Física');

#Tabla alumno
INSERT INTO alumno (id, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo)
VALUES
    (1, '123456-7', 'Luis', 'Pérez', 'Gómez', 'Ciudad D', 'Calle 555', '555-1111', '1998-03-25', 'H'),
    (2, '987654-3', 'Ana', 'Sánchez', 'Martínez', 'Ciudad E', 'Avenida 777', '555-2222', '1999-07-10', 'M'),
    (3, '456789-0', 'Javier', 'López', 'Díaz', 'Ciudad F', 'Carrera 888', '555-3333', '1997-11-30', 'H'),
    (4, '765432-1', 'María', 'González', 'Ramírez', 'Ciudad D', 'Calle 999', '555-4444', '2000-02-15', 'M'),
    (5, '234567-8', 'Carlos', 'Martínez', 'Fernández', 'Ciudad E', 'Avenida 1112', '555-5555', '1996-05-05', 'H');

#Tabla curso_escolar
INSERT INTO curso_escolar (id, anyo_inicio, anyo_fin)
VALUES
    (1, 2023, 2024),
    (2, 2022, 2023),
    (3, 2021, 2022),
    (4, 2020, 2021),
    (5, 2019, 2020);

SELECT*FROM alumno;
SELECT*FROM alumno_matricula_asignatura;
SELECT*FROM asignatura;
SELECT*FROM curso_escolar;
SELECT*FROM departamento;
SELECT*FROM grado;
SELECT*FROM profesor;

