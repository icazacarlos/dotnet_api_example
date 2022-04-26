# dotnet-api-example

## Descripción

Esta práctica está diseñada para ejecutar un API de .NET 6.0 usando Docker.

Entorno es DockerLabs.

## Tutorial
- https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-6.0&tabs=visual-studio

## Repositorio Git:
- https://github.com/icazacarlos/dotnet_api_example

## Instrucciones

Usando la terminal de DockerLabs ejecute los siguientes pasos:

1. Clonar el repositorio

```
$ git clone https://github.com/icazacarlos/dotnet_api_example
```

Nota:
- El paso anterior crea el directorio dotnet_api_example

2. Cámbiese al directorio dotnet_api_example

```
$ cd dotnet_api_example
```

3. Ejecute el siguiente comando para crear la imagen

```
$ docker build --no-cache -t dotnet_api_example:1.0.0 .
```

4. Ejecute la imagen como un contenedor:

```
$ docker run -d -p 8080:80 --name dotnet_001 --rm dotnet_api_example:1.0.0
```

## Prueba del API

- Path: /WeatherForecast
- Method: GET

1. Dentro de DockerLabs

```
$ curl -s http://localhost:8080/WeatherForecast | jq
```

Ejecute la imagen como otro contenedor:

```
$ docker run -p 8082:80 dotnet_api_example:1.0.0
```

Pruebe el mismo API ejecutándose en el segundo contenedor

```
$ curl -s http://localhost:8082/WeatherForecast | jq
```

2. Fuera de DockeLabs y en su propio equipo

Haga clic en el puerto abierto, copie la URL y reemplace la IP o Host en su comando curl

Ejemplo:

```
$ curl -s http://ip172-18-0-52-c9k1onc33d5g00f02jg0-8080.direct.labs.play-with-docker.com/WeatherForecast | jq
```

Respuesta del API

```json
[
  {
    "date": "2022-04-27T16:37:25.4443926+00:00",
    "temperatureC": 7,
    "temperatureF": 44,
    "summary": "Chilly"
  },
  {
    "date": "2022-04-28T16:37:25.4444168+00:00",
    "temperatureC": 3,
    "temperatureF": 37,
    "summary": "Bracing"
  },
  {
    "date": "2022-04-29T16:37:25.4444185+00:00",
    "temperatureC": -16,
    "temperatureF": 4,
    "summary": "Scorching"
  },
  {
    "date": "2022-04-30T16:37:25.4444201+00:00",
    "temperatureC": 22,
    "temperatureF": 71,
    "summary": "Bracing"
  },
  {
    "date": "2022-05-01T16:37:25.4444277+00:00",
    "temperatureC": -5,
    "temperatureF": 24,
    "summary": "Cool"
  }
]
```

## Publicar la imagen en DockerHub

Esto no se recomienda en el entorno de DockerLabs, debe hacerlo en su casa.

Inicie sesión en DockerHub

```
$ docker login -u USERNAME -p PASSWORD
```

```
$ docker tag dotnet_api_example:1.0.0 USER_NAME/dotnet_api_example:1.0.0
```

```
$ docker push USER_NAME/dotnet_api_example:1.0.0
```

Donde:
 - *USER_NAME* es su nombre de usuario en DockerHub
 - *PASSWORD* es su contraseña en DockerHub
