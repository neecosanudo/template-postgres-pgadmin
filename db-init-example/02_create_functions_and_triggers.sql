CREATE OR REPLACE FUNCTION fecha_prestamo_ejemplar()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_prestamo := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_fecha_prestamo_ejemplar
BEFORE INSERT ON prestamos_libros
FOR EACH ROW
EXECUTE FUNCTION fecha_prestamo_ejemplar();
