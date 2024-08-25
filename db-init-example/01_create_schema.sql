CREATE TABLE datos_usuarios (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL,
  domicilio JSONB,
  contacto JSONB,
  fecha_creacion TIMESTAMP DEFAULT NOW(),

  CONSTRAINT check_formato_domicilio CHECK (
    (domicilio ? 'calle') AND (jsonb_typeof(domicilio->'calle') = 'string') AND
    (domicilio ? 'numero') AND (jsonb_typeof(domicilio->'numero') = 'string')
  ),
  CONSTRAINT check_formato_contacto CHECK (
    (contacto ? 'telefono') AND (jsonb_typeof(contacto->'telefono') = 'string') AND
    (contacto ? 'email') AND (jsonb_typeof(contacto->'email') = 'string')
  )
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  dni INT NOT NULL UNIQUE,
  datos_usuarios_id INT UNIQUE,
  CONSTRAINT fk_datos_usuarios_id FOREIGN KEY (datos_usuarios_id) REFERENCES datos_usuarios(id)
);

CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ISBN INT NOT NULL UNIQUE,
  fecha_publicacion TIMESTAMP NOT NULL
);

CREATE TABLE ejemplares (
  id SERIAL PRIMARY KEY,
  libro_id INT NOT NULL,
  
  CONSTRAINT fk_libro_id FOREIGN KEY (libro_id) REFERENCES libros(id)
);

CREATE TABLE prestamos_libros (
  id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL,
  ejemplar_id INT NOT NULL UNIQUE,
  fecha_prestamo TIMESTAMP,
  
  CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  CONSTRAINT fk_ejemplar_id FOREIGN KEY (ejemplar_id) REFERENCES ejemplares(id)  
);

CREATE TABLE autores (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL,
  fecha_nacimiento TIMESTAMP NOT NULL,
  fecha_fallecimiento TIMESTAMP,
  pais_nacimiento VARCHAR(24),
  biografia VARCHAR(256)
);

CREATE TABLE libros_autores (
  id_libro INT NOT NULL,
  id_autor INT NOT NULL,
  
  CONSTRAINT fk_id_libro FOREIGN KEY (id_libro) REFERENCES libros(id),
  CONSTRAINT fk_id_autor FOREIGN KEY (id_autor) REFERENCES autores(id)
);