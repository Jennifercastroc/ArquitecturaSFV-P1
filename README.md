# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Jennifer Castro
- **Código:** A00400253
- **Fecha:** 6/08/2025

## Resumen de la Solución
Primero se creo el Dockerfile que se encarga de definir la imagen a partir de **node:20-alpine**, luego instala las dependencias y ejecuta la aplicación en el puerto 8080. Luego se crea el script de automatización que se encarga de verificar si docker está instalado, construye la imagen y elimina un contenedor previo si lo hay, esto para que no haya un error si ejecuto el script varias veces al intentar crear un contenedor nuevo con el mismo nombre. Ejecuta el contenedor con las variables de entorno y verifica que el servicio responde correctamente con un Invoke-WebRequest. 

## Dockerfile
Se usó una imagen (node:20-alpine), se definió el directorio de trabajo, luego se copiaron los archivos necesarios, se instalaron solo dependencias de producción y finalmente se expuso el puerto 8080.

## Script de Automatización
Verifica si Docker está instalado, construye la imagen, elimina el contenedor anterior si existe, ejecuta uno nuevo con variables de entorno y valida la respuesta del servicio con Invoke-WebRequest.

## Principios DevOps Aplicados
Automatización del despliegue de la aplicación.
Eliminación de conflictos para permitir integración continua.
Validación del servicio después del despliegue.

## Captura de Pantalla
![captura](.\image.png)

## Mejoras Futuras
[Describe al menos 3 mejoras que podrían implementarse en el futuro]

## Instrucciones para Ejecutar
Abrir la terminal de powershell, estar parado dentro de la carpeta **ARQUITECTURASFV-P1** y ejecutar el comando .\script.ps1
