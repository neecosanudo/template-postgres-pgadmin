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

INSERT INTO datos_usuarios(libros_en_posesion) VALUES (
  '[
  {"id": "0001", "fecha-prestamo": "01-01-2001"},
  {"id": "0010", "fecha-prestamo": "02-02-2002"}
  ]'
);
INSERT INTO usuarios(nombres, apellidos, datos_usuarios_id) VALUES ('kimbo', 'berna', 1);

SELECT 
  usuarios.nombres,
  usuarios.apellidos,
  libro->>'id' AS id_libro,
  libro->>'fecha-prestamo' AS fecha_prestamo
FROM usuarios JOIN datos_usuarios
ON usuarios.datos_usuarios_id = datos_usuarios.id,
jsonb_array_elements(datos_usuarios.libros_en_posesion) AS libro;