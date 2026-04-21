---
external help file: xo-powershell-help.xml
Module Name: xo-powershell
online version:
schema: 2.0.0
---

# Test-XoPing

## SYNOPSIS
Ping the Xen Orchestra REST API.

## SYNTAX

```
Test-XoPing [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Test reachability of the Xen Orchestra REST API by hitting the /ping endpoint.
Returns $true if the endpoint responds successfully, $false otherwise.

## EXAMPLES

### EXAMPLE 1
```
Test-XoPing
```

## PARAMETERS

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES

## RELATED LINKS
