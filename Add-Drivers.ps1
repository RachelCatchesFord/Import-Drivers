param(
    [Parameter(Mandatory)][String]$Path = "$PSScriptRoot",
    [Parameter()][String]$Depth = 10

)

Get-ChildItem -Path $Path -Filter "*.inf" -Recurse -Depth $Depth -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Fullname | ForEach-Object{
    cmd /c "pnputil.exe -a $_"
}