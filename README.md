# Plantilla de PostgreSQL y PgAdmin

¡Hola, soy Nico! Creé esta plantilla que te permite practicar Postgres al montar la base de datos con Docker. Además, incluyo PgAdmin para una practica visual por sino querés hacerlo desde la consola.

## Breve bitáctora

El repositorio surge por 2 motivos:

- La necesidad de profundizar en PostgreSQL y sus buenas prácticas.
- Porque estoy escribiendo un tutorial introductorio a esta base de datos y me pareció un buen recurso para el usuario final.

### ¿Cómo fué mi proceso?

Puse en práctica conocimientos de Docker y aprendí a trabajar con docker-compose; este último fue necesario para configurar el proyecto de forma simple.

</br>

Utilicé varios recursos web para mejorar el proyecto:

- Me inspiro en [Conventional Commits](https://www.conventionalcommits.org/es/v1.0.0-beta.3/) y en [GitMoji](https://gitmoji.dev/) para los mensajes de commits.
- [GitIgnore](https://www.toptal.com/developers/gitignore) es un recurso muy intuitivo.
- La estructura de la licencia la obtuve de [Choose A License](https://choosealicense.com/).
- [GPT 4o](https://chatgpt.com/) me corrige el inglés en los mensajes de commits y errores ortograficos en general.

## ¿Cómo utilizar la plantilla?

Es esencial tener descargado Docker ([documentación oficial](https://docs.docker.com/get-docker/)) y saber manejar lo minimo de la terminal.

### 1. Descarga este repositorio

Abre una nueva terminal en el directorio en el que tengas tus proyectos y ejecuta el siguiente código:

```bash
git clone git@github.com:neecosanudo/template-postgres-pgadmin.git
```

**Nota**: puedes [descargar el repositorio](https://github.com/neecosanudo/template-postgres-pgadmin/archive/refs/heads/main.zip) como un archivo ZIP y descomprimirlo en el directorio de tus proyectos.

</br>

Ingresa al directorio nuevo:

```bash
cd template-postgres-pgadmin
```

### 2. Configura las variables de entorno

Edita las credenciales para ingresar en Postgres y PgAdmin:

1. Crea un archivo **.env** en la raíz de tu proyecto con el comando `touch .env`.
2. Copia el contenido del archivo **.env.example** dentro de **.env**.
3. Edita las credenciales a gusto.

### 3. Inicia Docker

Asegurate de que Docker se esté ejecutando y ejecuta el siguiente código:

```bash
docker-compose up
```

</br>

Espera alrededor de 1 minuto y tendrás Postgres y PgAdmin listos para usar.

### 4. Acceso a Postgres desde consola

Abre una nueva terminal y ejecuta el siguiente código:

```bash
docker-compose exec postgres-database psql -U [nombre de usuario para Postgres]
```

Si usaste los mismas credenciales que estaban en el archivo de ejemplo, el nombre de usuario es: **kimbo**.

</br>

**Nota**: podes editarlo en el archivo **.env** cambiando en `POSTGRES_USER=kimbo` por tu nombre de usuario de preferencia.
