# Get-RDAP

`Get-RDAP` is a PowerShell cmdlet that retrieves Registration Data Access Protocol (RDAP) information for domain names, IP addresses, and Autonomous System Numbers (ASNs).

## Installation

To install the `Get-RDAP` cmdlet, you can use the following command:

```powershell
Install-Module -Name Get-RDAP
```

## Usage

### Retrieve RDAP Information for a Domain

```powershell
Get-RDAP -Domain example.com
```

### Retrieve RDAP Information for an IP Address

```powershell
Get-RDAP -IPAddress 192.0.2.1
```

### Retrieve RDAP Information for an ASN

```powershell
Get-RDAP -ASN 12345
```

## Parameters

- `-Domain`: Specifies the domain name for which to retrieve RDAP information.
- `-IPAddress`: Specifies the IP address for which to retrieve RDAP information.
- `-ASN`: Specifies the Autonomous System Number for which to retrieve RDAP information.

## Examples

### Example 1: Retrieve RDAP Information for a Domain

```powershell
Get-RDAP -Domain example.com
```

### Example 2: Retrieve RDAP Information for an IP Address

```powershell
Get-RDAP -IPAddress 192.0.2.1
```

### Example 3: Retrieve RDAP Information for an ASN

```powershell
Get-RDAP -ASN 12345
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or issues, please open an issue on the [GitHub repository](https://github.com/RobBiddle/Get-RDAP).
