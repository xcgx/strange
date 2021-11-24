Add-Type -AssemblyName System.Windows.Forms

# 你可以根据你的实际情况修改间隔时间
New-Variable -name INTERVAL -Value (60 * 3) -Option Constant -Description 'for 5mins lock default'

get-date
echo `start`

while ($true) {
    $key = '{SCROLLLOCK}'
    get-date
    echo  "press key $key`n"
    try {
        [System.Windows.Forms.SendKeys]::SendWait($key)
        [System.Windows.Forms.SendKeys]::SendWait($key)
    }
    catch {
        Write-Host "An error occurred:"
        Write-Host $_
        Write-Host $_.ScriptStackTrace
    }
    sleep -s $INTERVAL
}
