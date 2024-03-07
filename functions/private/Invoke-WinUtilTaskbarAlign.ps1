Function Invoke-WinUtilTaskbarAlign {
    <#

    .SYNOPSIS
        Sets the taskbar alignment.

    .PARAMETER Alignment 
        Indicates the current Mouse Acceleration State

    #>
    Param($Alignment)
    Try{
        if ($Alignment -eq $false){
            Write-Host "Setting taskbar alignment to centered."
            $justify = 0
        } 
        else {
            Write-Host "Setting taskbar alignment to left."
           $justify = 1 
        }

        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $Path -Name TaskbarAl -Value $justify
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
