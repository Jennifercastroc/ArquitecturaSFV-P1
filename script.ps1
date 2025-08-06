# Nombre de imagen y contenedor
$ImageName = "my-node-app"
$ContainerName = "my-node-app-container"
$Port = 8080


# Verificar si Docker está instalado
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker no esta instalado"
    exit 1
}

# Construir la imagen
docker build -t $ImageName .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al construir la imagen."
    exit 1
}

Write-Host "Imagen construida exitosamente: $ImageName"

# Eliminar contenedor previo si existe
if ((docker ps -a -q -f name=$ContainerName) -ne "") {
    Write-Host "Eliminando contenedor previo"
    docker rm -f $ContainerName | Out-Null
}

# Ejecutar el contenedor
docker run -d --name $ContainerName -p ${Port}:8080 -e "PORT=8080" -e "NODE_ENV=production" $ImageName


if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al ejecutar el contenedor."
    exit 1
}

# Esperar a que arranque
Start-Sleep -Seconds 5

# Probar si el servicio responde
Write-Host "Probando el servicio en http://localhost:$Port"
try {
    $response = Invoke-WebRequest -Uri "http://localhost:$Port" -UseBasicParsing -TimeoutSec 5
    $statusCode = $response.StatusCode
} catch {
    $statusCode = $_.Exception.Response.StatusCode.Value__
}

# Verificar resultado
if ($statusCode -eq 200) {
    Write-Host " El servicio esta funcionando correctamente. Codigo HTTP: $statusCode"
    $Status = "Exito"
} else {
    Write-Host "El servicio no respondio correctamente. Codigo HTTP: $statusCode"
    $Status = "Error"
}

# Mostrar resumen final
Write-Host "-------------------------"
Write-Host "Resumen:"
Write-Host "Imagen: $ImageName"
Write-Host "Contenedor: $ContainerName"
Write-Host "Puerto: $Port"
Write-Host "Estado del servicio: $Status"
Write-Host "-------------------------"
