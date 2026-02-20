$usuarios = @{}

do {
    
    $opcion = Read-Host "Por favor elige una opción"
    Write-Host "Pulsa 1 para Crear un nuevo usuario"
    Write-Host "Pulsa 2 para Ver usuarios existentes"
    Write-Host "Pulsa 3 para  Salir"
   

    switch ($opcion) {
        '1' {
            $nombreUsuario = Read-Host "Introduce el nombre de usuario"
            $contraseña = Read-Host "Introduce la contraseña" -AsSecureString
            $usuarios[$nombreUsuario] = $contraseña
            Write-Host "El usuario $nombreUsuario creado"
        }
        '2' {
            Write-Host "Usuarios existentes:"
            $usuarios.Keys
        }
        '3' {
            exit
        }
        default {
            Write-Host "Opción incorrecta. Por favor, elige una opción del menú."
        }
    }
} while ($true)
