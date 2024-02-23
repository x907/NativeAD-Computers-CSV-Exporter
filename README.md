# Export-ADComputersToCSV :sparkles:

This script exports a list of computers from Active Directory to a CSV file.

## Table of Contents :pushpin:

- [Description](#description)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [License](#license)

## Description :page_facing_up:

The script retrieves a specified set of properties for all computers in the Active Directory domain and exports this information to a uniquely named CSV file. It checks for the availability of the Active Directory module, handles errors gracefully, and prevents overwriting of data by appending a timestamp to the output file name.

## Prerequisites :wrench:

- **Active Directory PowerShell module**: This is part of the RSAT (Remote Server Administration Tools) on Windows. You can install it via the "Turn Windows features on or off" dialog in the Control Panel.
- **Permissions in Active Directory**: You need to have the necessary permissions in Active Directory to query computer objects.
- **File system permissions**: You need to have appropriate file system permissions to write to the output directory.

## Usage :computer:

No parameters. Modify the script variables directly to customize as needed. Ensure the user running the script has the necessary permissions in Active Directory and access rights to write to the specified directory. Modify the $outputPath variable as needed to specify a different output directory. The default path is set to C:\ with a timestamped file name for uniqueness. This script assumes the Active Directory PowerShell module is installed.

Run the script in a PowerShell session with appropriate privileges.

## License :scroll:

This project is unlicensed. For more information, see the [Unlicense](http://unlicense.org/) website.