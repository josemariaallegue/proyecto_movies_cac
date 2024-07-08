
# Proyecto "Movies" del grupo 18

Proyecto de para el curso de "Codo a codo 2024" de backend en node.js, comision 24140.

## Autores

- [Samuel Villalba](https://github.com/SamuelVillalba7)
- [Jose Maria Allegue](https://github.com/josemariaallegue)
- [Melisa Oro](https://github.com/melocotonoro)
- [Gonzalo Corrales Ruis](https://github.com/Gonzalo-CR)

## Variables de entorno

Para correr este proyecto, es necesario agregar las siguientes variables de entorno al archivo .env.

`DB_HOST` - en la mayoria de los casos va a ser 'localhost'

`DB_USER` - el usuario de la base de datos mysql

`DB_PASS` - el password de la base de datos mysql

`DB_NAME` - en este caso se utilizara 'mymovies'

`DB_PORT` - el puerto de la base de datos

`SERVER_PORT` - el puerto del servidor


## Instalación

Clonar el proyecto con git. Luego de la descarga situarse en el directorio del proyecto
```bash
  cd proyecto
```

Instalar los modulos de node requeridos 
```bash
  npm install
```

Correr el script 'init' para inicializar la base de datos, crear las tablas necesarias y cargarlas con los datos de prueba
```bash
  npm run init
```

Iniciar el servidor
```bash
  npm run start
```
    
## API Reference

#### Get para todas las peliculas

```http
  GET /movies
```

#### Get para pelicula individual

```http
  GET /movies/{id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id de la pelicula a buscar |

```http
  POST /movies
```

| Body | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `title`      | `string` | **Required**. Titulo de la pelicula |
| `director`      | `string` | **Required**. Director de la pelicula |
| `date`      | `integer` | **Required**. Fecha de la pelicula, formato valido "yyyy" |
| `cover`      | `string` | **Required**. Ubicacion de la portada |
| `country`      | `integer` | **Required**. Id del pais |
| `genre`      | `integer` | **Required**. Id del genero |


```http
  DELETE /movies/{id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id de la pelicula a eliminar |

```http
  PUT /movies/{id}
```

| Body | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `title`      | `string` | **Required**. Titulo de la pelicula |
| `director`      | `string` | **Required**. Director de la pelicula |
| `date`      | `integer` | **Required**. Fecha de la pelicula, formato valido "yyyy" |
| `cover`      | `string` | **Required**. Ubicacion de la portada |
| `country`      | `integer` | **Required**. Id del pais |
| `genre`      | `integer` | **Required**. Id del genero |