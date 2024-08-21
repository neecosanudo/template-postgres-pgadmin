CREATE TABLE datos_usuarios (
  id SERIAL PRIMARY KEY,
  libros_en_posesion JSONB
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(24) NOT NULL,
  apellidos VARCHAR(24) NOT NULL,
  datos_usuarios_id INT NOT NULL UNIQUE,
  CONSTRAINT fk_datos_usuarios_id FOREIGN KEY (datos_usuarios_id) REFERENCES datos_usuarios(id)
);