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

objectClassName : domain
handle          : 2336799_DOMAIN_COM-VRSN
ldhName         : EXAMPLE.COM
links           : {@{value=https://rdap.verisign.com/com/v1/domain/EXAMPLE.COM; rel=self; href=https://rdap.verisign.com/com/v1/domain/EXAMPLE.COM; type=application/rdap+json}}
status          : {client delete prohibited, client transfer prohibited, client update prohibited}
entities        : {@{objectClassName=entity; handle=376; roles=System.Object[]; publicIds=System.Object[]; vcardArray=System.Object[]; entities=System.Object[]}}
events          : {@{eventAction=registration; eventDate=8/14/1995 4:00:00 AM}, @{eventAction=expiration; eventDate=8/13/2025 4:00:00 AM}, @{eventAction=last changed;
                  eventDate=8/14/2024 7:01:34 AM}, @{eventAction=last update of RDAP database; eventDate=9/25/2024 11:07:33 PM}}
secureDNS       : @{delegationSigned=True; dsData=System.Object[]}
nameservers     : {@{objectClassName=nameserver; ldhName=A.IANA-SERVERS.NET}, @{objectClassName=nameserver; ldhName=B.IANA-SERVERS.NET}}
rdapConformance : {rdap_level_0, icann_rdap_technical_implementation_guide_0, icann_rdap_response_profile_0}
notices         : {@{title=Terms of Use; description=System.Object[]; links=System.Object[]}, @{title=Status Codes; description=System.Object[]; links=System.Object[]},
                  @{title=RDDS Inaccuracy Complaint Form; description=System.Object[]; links=System.Object[]}}
```

### Retrieve RDAP Information for an IP Address

```powershell
Get-RDAP -IPAddress 8.8.8.8

rdapConformance              : {nro_rdap_profile_0, rdap_level_0, cidr0, arin_originas0}
notices                      : {@{title=Terms of Service; description=System.Object[]; links=System.Object[]}, @{title=Whois Inaccuracy Reporting; description=System.Object[];
                               links=System.Object[]}, @{title=Copyright Notice; description=System.Object[]}}
handle                       : NET-8-8-8-0-2
startAddress                 : 8.8.8.0
endAddress                   : 8.8.8.255
ipVersion                    : v4
name                         : GOGL
type                         : DIRECT ALLOCATION
parentHandle                 : NET-8-0-0-0-0
events                       : {@{eventAction=last changed; eventDate=12/28/2023 5:24:56 PM}, @{eventAction=registration; eventDate=12/28/2023 5:24:33 PM}}
links                        : {@{value=https://rdap.arin.net/registry/ip/8.8.8.8; rel=self; type=application/rdap+json; href=https://rdap.arin.net/registry/ip/8.8.8.0},
                               @{value=https://rdap.arin.net/registry/ip/8.8.8.8; rel=alternate; type=application/xml; href=https://whois.arin.net/rest/net/NET-8-8-8-0-2}}
entities                     : {@{handle=GOGL; vcardArray=System.Object[]; roles=System.Object[]; remarks=System.Object[]; links=System.Object[]; events=System.Object[];
                               entities=System.Object[]; port43=whois.arin.net; objectClassName=entity}}
port43                       : whois.arin.net
status                       : {active}
objectClassName              : ip network
cidr0_cidrs                  : {@{v4prefix=8.8.8.0; length=24}}
arin_originas0_originautnums : {}
```

### Retrieve RDAP Information for an ASN

```powershell
Get-RDAP -AutonomousSystemNumber 12345

handle          : AS12345
startAutnum     : 12345
endAutnum       : 12345
name            : AS12345
status          : {active}
entities        : {@{handle=AS12345-MNT; vcardArray=System.Object[]; roles=System.Object[]; links=System.Object[]; objectClassName=entity}, @{handle=LG1196-ORG;
                  vcardArray=System.Object[]; roles=System.Object[]; links=System.Object[]; objectClassName=entity}, @{handle=ORG-GSs1-RIPE; vcardArray=System.Object[];
                  roles=System.Object[]; links=System.Object[]; objectClassName=entity}, @{handle=PG12821-RIPE; vcardArray=System.Object[]; roles=System.Object[];
                  links=System.Object[]; objectClassName=entity}…}
remarks         : {@{description=System.Object[]}}
links           : {@{value=https://rdap.db.ripe.net/autnum/12345; rel=self; href=https://rdap.db.ripe.net/autnum/12345},
                  @{value=http://www.ripe.net/data-tools/support/documentation/terms; rel=copyright; href=http://www.ripe.net/data-tools/support/documentation/terms}}
events          : {@{eventAction=registration; eventDate=1/2/2019 9:55:51 AM}, @{eventAction=last changed; eventDate=5/13/2020 1:44:31 PM}}
rdapConformance : {nro_rdap_profile_asn_flat_0, cidr0, rdap_level_0, nro_rdap_profile_0…}
notices         : {@{title=Filtered; description=System.Object[]}, @{title=Whois Inaccuracy Reporting; description=System.Object[]; links=System.Object[]}, @{title=Source;
                  description=System.Object[]}, @{title=Terms and Conditions; description=System.Object[]; links=System.Object[]}}
port43          : whois.ripe.net
objectClassName : autnum
redacted        : {@{name=; reason=; prePath=$.entities[?(@.handle=='LG1196-ORG')].vcardArray[1][?(@[0]=='e-mail')]; method=removal}, @{name=; reason=;
                  prePath=$.entities[?(@.handle=='ORG-GSs1-RIPE')].vcardArray[1][?(@[0]=='e-mail')]; method=removal}, @{name=; reason=;
                  prePath=$.entities[?(@.handle=='AR15783-RIPE')].vcardArray[1][?(@[0]=='e-mail')]; method=removal}}
```

## Parameters

- `-Domain`: Specifies the domain name for which to retrieve RDAP information.
- `-IPAddress`: Specifies the IP address for which to retrieve RDAP information.
- `-AutonomousSystemNumber`: Specifies the Autonomous System Number for which to retrieve RDAP information.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or issues, please open an issue on the [GitHub repository](https://github.com/RobBiddle/Get-RDAP).
