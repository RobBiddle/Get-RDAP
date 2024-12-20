<#
.SYNOPSIS
    Get-RDAP is a PowerShell cmdlet which retrieves RDAP information via the RDAP.org API.
.DESCRIPTION
    Get-RDAP is a PowerShell cmdlet which retrieves RDAP information via the RDAP.org API.
    RDAP (Registration Data Access Protocol) is an IETF standard for querying registration data for domain names, IP addresses, and autonomous system numbers.
    RDAP is intended to replace the WHOIS protocol.
    RDAP.org is a free RDAP service provided by the Internet Systems Consortium (ISC).
    For more information on RDAP, see https://rdap.org.
.EXAMPLE
    Get-RDAP -Domain example.com
    Retrieves RDAP information for the domain example.com.
.EXAMPLE
    Get-RDAP -IPAddress 8.8.8.8
    Retrieves RDAP information for the IP address
.EXAMPLE
    Get-RDAP -AutonomousSystemNumber 15169
    Retrieves RDAP information for the autonomous system number 15169.
.LINK
    https://github.com/RobBiddle/Get-RDAP
.NOTES
    Author: Robert D. Biddle
    Date: 2024-09-25
    Get-RDAP - PowerShell Module to lookup RDAP information for a domain name.
    Copyright (C) 2024 Robert D. Biddle

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
.PARAMETER Domain
    The domain name for which to retrieve RDAP information.
.PARAMETER IPAddress
    The IP address for which to retrieve RDAP information.
.PARAMETER AutonomousSystemNumber
    The autonomous system number for which to retrieve RDAP information.
.PARAMETER Entity
    The entity identifier for which to retrieve RDAP information.
.OUTPUTS
    Selected.System.Management.Automation.PSCustomObject
#>
function Get-RDAP {
    [CmdletBinding(DefaultParameterSetName='Domain')]
    param (
        [Parameter(Mandatory=$true, ParameterSetName='Domain')]
        [ValidatePattern('^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')]
        [string]$Domain,

        [Parameter(Mandatory=$true, ParameterSetName='IP')]
        [string]$IPAddress,

        [Parameter(Mandatory=$true, ParameterSetName='Autnum')]
        [ValidatePattern('^\d+$')]
        [string]$AutonomousSystemNumber,

        [Parameter(Mandatory=$true, ParameterSetName='Entity')]
        [ValidatePattern('^[a-zA-Z0-9]+$')]
        [string]$Entity
    )

    # Determine the object based on the parameter set
    switch ($PSCmdlet.ParameterSetName) {
        'Domain' { $Object = $Domain }
        'IP' { $Object = $IPAddress }
        'Autnum' { $Object = $AutonomousSystemNumber }
        'Entity' { $Object = $Entity }
    }

    # Determine the type based on the parameter set
    switch ($PSCmdlet.ParameterSetName) {
        'Domain' { $Type = 'domain' }
        'IP' { $Type = 'ip' }
        'Autnum' { $Type = 'autnum' }
        'Entity' { $Type = 'entity' }
    }

    # Construct the RDAP URL
    $Url = "https://rdap.org/$Type/$Object"

    # Send the HTTP request
    try {
        $Response = Invoke-RestMethod -Uri $Url
    } catch {
        # If 404 and $Type is 'domain', parse the domain, if it is a subdomain, try the parent domain
        if ($_.Exception.Response.StatusCode -eq 404 -and $Type -eq 'domain') {
            $DomainParts = $Domain.Split('.')
            if ($DomainParts.Count -gt 2) {
                Write-Warning "RDAP info for Domain $Domain was not found. Trying parent domain."
                # Recursively try the parent domain until a response is received, with a maximum of 10 attempts
                for ($i = 1; $i -lt $DomainParts.Count -and $i -lt 10; $i++) {
                    $ParentDomain = $DomainParts[$i..$DomainParts.Count] -join '.'
                    $Response = Get-RDAP -Domain $ParentDomain
                    if ($Response) {
                        break
                    }
                }
            }
        }
    }

    # Return the response
    $Response
}