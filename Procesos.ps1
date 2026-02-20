do {
    Get-Process | Format-Table Name, Id
    $proceso = Read-Host "Proceso a detener"
    if ($proceso -eq 'salir') { exit }
    try { Stop-Process -Name $proceso -ErrorAction Stop }
    catch { Write-Host "No se pudo detener el proceso $proceso." }
} while ($true)
