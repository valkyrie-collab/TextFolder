# Refresh all environment variables from Machine and User scope
$envTargets = [System.EnvironmentVariableTarget]::Machine, [System.EnvironmentVariableTarget]::User
foreach ($target in $envTargets) {
    $envVars = [System.Environment]::GetEnvironmentVariables($target)
    foreach ($name in $envVars.Keys) {
        Set-Item -Path "Env:$name" -Value $envVars[$name]
    }
}

# Reload PATH from system-wide environment variable
$env:Path = [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)

Write-Host ">> Environment variables refreshed successfully."
