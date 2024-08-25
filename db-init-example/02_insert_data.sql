INSERT INTO autores (nombres, apellidos, fecha_nacimiento, fecha_fallecimiento, pais_nacimiento, biografia) VALUES ('Gabriel', 'García Márquez', '1927-03-06', '2014-04-17', 'Colombia', 'Gabriel García Márquez fue un novelista colombiano, reconocido por su estilo del realismo mágico.');
INSERT INTO autores (nombres, apellidos, fecha_nacimiento, fecha_fallecimiento, pais_nacimiento, biografia) VALUES ('Jane', 'Austen', '1775-12-16', '1817-07-18', 'Reino Unido', 'Jane Austen fue una novelista inglesa conocida principalmente por sus obras que tratan de las preocupaciones y dificultades de las mujeres.');
INSERT INTO autores (nombres, apellidos, fecha_nacimiento, fecha_fallecimiento, pais_nacimiento, biografia) VALUES ('George', 'Orwell', '1903-06-25', '1950-01-21', 'India', 'George Orwell fue un escritor, periodista y ensayista británico, famoso por sus novelas distópicas.');

INSERT INTO libros (nombre, ISBN, fecha_publicacion) VALUES ('Cien años de soledad', '978-3-16-148410-0', '1967-05-30');
INSERT INTO libros (nombre, ISBN, fecha_publicacion) VALUES ('Orgullo y Prejuicio', '978-1-86197-879-9', '1813-01-28');
INSERT INTO libros (nombre, ISBN, fecha_publicacion) VALUES ('1984', '978-0-452-28423-4', '1949-06-08');

INSERT INTO libros_autores (id_libro, id_autor) VALUES (1, 1);
INSERT INTO libros_autores (id_libro, id_autor) VALUES (2, 2);
INSERT INTO libros_autores (id_libro, id_autor) VALUES (3, 3);

INSERT INTO datos_usuarios (nombres, apellidos, domicilio, contacto) VALUES ('Juan', 'Pérez', '{"calle": "Av. Siempre Viva", "numero": "742"}', '{"telefono": "011-1234-5678", "email": "juan.perez@example.com"}');
INSERT INTO datos_usuarios (nombres, apellidos, domicilio, contacto) VALUES ('María', 'González', '{"calle": "Calle Falsa", "numero": "123"}', '{"telefono": "011-8765-4321", "email": ""}');
INSERT INTO datos_usuarios (nombres, apellidos, domicilio, contacto) VALUES ('Carlos', 'Ramírez', '{"calle": "Calle del Sol", "numero": "456"}', '{"telefono": "", "email": "carlos.ramirez@example.com"}');

INSERT INTO usuarios (dni, datos_usuarios_id) VALUES ('12345678', 1);
INSERT INTO usuarios (dni, datos_usuarios_id) VALUES ('94654321', 2);
INSERT INTO usuarios (dni, datos_usuarios_id) VALUES ('11223344', 3);

INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Cien años de soledad'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Cien años de soledad'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Cien años de soledad'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Cien años de soledad'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Cien años de soledad'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Orgullo y Prejuicio'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Orgullo y Prejuicio'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Orgullo y Prejuicio'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Orgullo y Prejuicio'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = 'Orgullo y Prejuicio'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = '1984'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = '1984'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = '1984'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = '1984'));
INSERT INTO ejemplares (libro_id) VALUES ((SELECT id FROM libros WHERE nombre = '1984'));

INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (1, 4, '2024-07-03 00:00:00', NULL);
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (2, 4, '2024-08-17 00:00:00', '2024-08-27 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (2, 1, '2024-07-08 00:00:00', '2024-07-09 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (2, 2, '2024-07-13 00:00:00', NULL);
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (3, 2, '2024-08-18 00:00:00', '2024-09-01 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (3, 3, '2024-08-21 00:00:00', '2024-09-01 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (3, 1, '2024-08-17 00:00:00', '2024-08-19 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (3, 5, '2024-08-18 00:00:00', '2024-08-20 00:00:00');
INSERT INTO prestamos_libros (usuario_id, ejemplar_id, fecha_prestamo, fecha_devolucion) VALUES (3, 4, '2024-07-17 00:00:00', NULL);