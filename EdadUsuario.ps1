do {
    $edad = Read-Host "Edad"; $origen = Read-Host "Directorio origen"; $destino = Read-Host "Directorio destino"
    if ($edad -ge 18) {Copy-Item -Path $origen -Destination $destino -Recurse -Force; Get-ChildItem -Path $destino}
    elseif ($edad -gt 10) {Write-Host ($origen + $destino)}
    else {Write-Host $origen}
    $input = Read-Host "¿Continuar? (s/n)"
} until ($input -eq 'n')
