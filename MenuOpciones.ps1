function Menu {
    param (
        [string]$Titulo = 'Menu de opciones con directorios '
    )
    cls
    Write-Host "================ $Titulo ================"

    Write-Host "Pulsa 1 para Crear directorios"
    Write-Host "Pulsa 2 para Copiar directorios con sus archivos"
    Write-Host "Pulsa 3 Borrar directorios"
    Write-Host "Pulsa la tecla Q para Salir"
}
do {
    Menu –Titulo 'Menu de opciones con diretorios '
    $input = Read-Host "Por favor selecciona una opción"
    switch ($input) {
        '1' {
            $nombre = Read-Host "Introduce el nombre del directorio que quieres crear"
            New-Item -ItemType Directory -Force -Path $nombre
        } '2' {
            $origen = Read-Host "Introduce el nombre del directorio que quieres copiar"
            $destino = Read-Host "Introduce el nombre del directorio destino"
            Copy-Item -Path $origen -Destination $destino -Recurse -Force
        } '3' {
            $nombre = Read-Host "Introduce el nombre del directorio que quieres borrar"
            Remove-Item -Path $nombre -Recurse -Force
        } 'q' {
            return
        }
    }
    pause
}
until ($input -eq 'q')
 