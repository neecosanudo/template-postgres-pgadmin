CREATE SCHEMA data;

CREATE TABLE data.datos_usuarios (
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

CREATE TABLE data.usuarios (
  id SERIAL PRIMARY KEY,
  dni VARCHAR(8) NOT NULL UNIQUE,
  datos_usuarios_id INT UNIQUE,
  CONSTRAINT fk_datos_usuarios_id FOREIGN KEY (datos_usuarios_id) REFERENCES data.datos_usuarios(id)
);

CREATE TABLE data.libros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ISBN VARCHAR(17) NOT NULL UNIQUE,
  fecha_publicacion DATE NOT NULL
);

CREATE TABLE data.ejemplares (
  id SERIAL PRIMARY KEY,
  libro_id INT NOT NULL,
  
  CONSTRAINT fk_libro_id FOREIGN KEY (libro_id) REFERENCES data.libros(id)
);

CREATE TABLE data.prestamos_libros (
  id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL,
  ejemplar_id INT NOT NULL,
  fecha_prestamo TIMESTAMP NOT NULL DEFAULT NOW(),
  fecha_devolucion TIMESTAMP,
  
  CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES data.usuarios(id),
  CONSTRAINT fk_ejemplar_id FOREIGN KEY (ejemplar_id) REFERENCES data.ejemplares(id)  
);

CREATE TABLE data.autores (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL,
  fecha_nacimiento TIMESTAMP NOT NULL,
  fecha_fallecimiento TIMESTAMP,
  pais_nacimiento VARCHAR(24),
  biografia TEXT
);

CREATE TABLE data.libros_autores (
  id_libro INT NOT NULL,
  id_autor INT NOT NULL,
  
  CONSTRAINT pk_libros_autores PRIMARY KEY (id_libro, id_autor),

  CONSTRAINT fk_id_libro FOREIGN KEY (id_libro) REFERENCES data.libros(id),
  CONSTRAINT fk_id_autor FOREIGN KEY (id_autor) REFERENCES data.autores(id)
);


-----------------------------------------------------------------------------
--- DATA_VIEWS: ESQUEMA PARA VISTAS DE CONSULTAS FRECUENTES
-----------------------------------------------------------------------------

CREATE SCHEMA data_views;

--- NOMBRE: resumen_usuarios
--- Contiene id, nombre completo y ejemplares que tiene en su posesión.

CREATE VIEW data_views.resumen_usuarios AS
SELECT u.id, du.nombres, du.apellidos, pl.ejemplar_id, l.nombre
FROM data.usuarios AS u 
JOIN data.datos_usuarios AS du ON du.id = u.datos_usuarios_id
JOIN data.prestamos_libros AS pl ON pl.usuario_id = u.id
JOIN data.ejemplares AS ej ON ej.id = pl.ejemplar_id
JOIN data.libros AS l ON l.id = ej.libro_id
WHERE pl.fecha_devolucion IS NULL;