CREATE TABLE datos_usuarios (
  id SERIAL PRIMARY KEY
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL,
  datos_usuarios_id INT NOT NULL UNIQUE,
  CONSTRAINT fk_datos_usuarios_id FOREIGN KEY (datos_usuarios_id) REFERENCES datos_usuarios(id)
);

CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE prestamos_libros (
  id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL,
  libro_id INT NOT NULL,
  fecha_prestamo TIMESTAMP DEFAULT NOW(),
  
  CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  CONSTRAINT fk_libro_id FOREIGN KEY (libro_id) REFERENCES libros(id)  
);

CREATE TABLE autores (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL
);

CREATE TABLE libros_autores (
  id_libro INT NOT NULL,
  id_autor INT NOT NULL,
  
  CONSTRAINT fk_id_libro FOREIGN KEY (id_libro) REFERENCES libros(id),
  CONSTRAINT fk_id_autor FOREIGN KEY (id_autor) REFERENCES autores(id)
);