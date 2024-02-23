<#
.SYNOPSIS
This script exports a list of computers from Active Directory to a CSV file.

.DESCRIPTION
The script retrieves a specified set of properties for all computers in the Active Directory domain and exports this information to a uniquely named CSV file. It checks for the availability of the Active Directory module, handles errors gracefully, and prevents overwriting of data by appending a timestamp to the output file name.

.PREREQUISITES
- Active Directory PowerShell module, part of the RSAT (Remote Server Administration Tools) on Windows.
- Necessary permissions in Active Directory to query computer objects.
- Appropriate file system permissions to write to the output directory.

.PARAMETERS
No parameters. Modify the script variables directly to customize as needed.

.USAGE NOTES
- Ensure the user running the script has the necessary permissions in Active Directory and access rights to write to the specified directory.
- Modify the $outputPath variable as needed to specify a different output directory. The default path is set to C:\ with a timestamped file name for uniqueness.
- This script assumes the Active Directory PowerShell module is installed.

.EXAMPLE
No additional steps required for execution. Run the script in a PowerShell session with appropriate privileges.

.NOTES
Author: David Dias
Version: 1.0
Date: 02/23/2024

#>

# Improved Script for Exporting AD Computers List

# Check if the Active Directory module is available and import it
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Error "Active Directory module is not available. Please install RSAT tools."
    exit
}
Import-Module ActiveDirectory

# Define the properties you want to retrieve
$properties = @("Name", "Enabled", "DistinguishedName", "ObjectClass", "LastLogonDate")

# Specify the output file path, incorporating a timestamp for uniqueness
$outputPath = "C:\ADComputersList_{0:yyyyMMddHHmmss}.csv" -f (Get-Date)

# Encapsulate the main logic in a try-catch block for error handling
try {
    # Get the list of all computers from Active Directory
    $computers = Get-ADComputer -Filter * -Properties $properties

    # Check if any computers were found
    if ($computers) {
        # Export the list to a CSV file
        $computers | Select-Object $properties | Export-Csv -Path $outputPath -NoTypeInformation

        Write-Host "Computers list has been exported to $outputPath"
    } else {
        Write-Warning "No computers found in the Active Directory."
    }
} catch {
    Write-Error "An error occurred: $_. Exception message: $($_.Exception.Message)"
}
