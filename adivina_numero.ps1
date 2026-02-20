Clear-Host

# Generar número secreto
$numeroSecreto = Get-Random -Minimum 1 -Maximum 101
$intentosMaximos = 7
$intento = 0

Write-Host "==============================="
Write-Host "  ADIVINA EL NÚMERO   "
Write-Host "==============================="
Write-Host "Estoy pensando un número del 1 al 100."
Write-Host "Tienes $intentosMaximos intentos.`n"

do {
    $intento++
    $respuesta = Read-Host "Intento #$intento - ¿Cuál es tu número?"

    # Validar que sea número entre 1 y 100
    if (-not [int]::TryParse($respuesta, [ref]$null) -or
        [int]$respuesta -lt 1 -or
        [int]$respuesta -gt 100) {
        Write-Host "Por favor escribe un número entre 1 y 100.`n" -ForegroundColor Yellow
        $intento--
        continue
    }

    $guess = [int]$respuesta

    if ($guess -lt $numeroSecreto) {
        Write-Host "Demasiado bajo. 😄`n" -ForegroundColor Cyan
    } elseif ($guess -gt $numeroSecreto) {
        Write-Host "Demasiado alto. 😅`n" -ForegroundColor Magenta
    }

} until ($guess -eq $numeroSecreto -or $intento -ge $intentosMaximos)

if ($guess -eq $numeroSecreto) {
    Write-Host "`n¡¡Correcto!! El número era $numeroSecreto." -ForegroundColor Green
    Write-Host "¡Lo lograste en $intento intento(s)!"
} else {
    Write-Host "`nTe quedaste sin intentos. 😢" -ForegroundColor Red
    Write-Host "El número correcto era $numeroSecreto."
}

Write-Host "`nPulsa ENTER para salir..."
[void][System.Console]::ReadLine()
