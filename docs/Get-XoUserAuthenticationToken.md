---
external help file: xo-powershell-help.xml
Module Name: xo-powershell
online version:
schema: 2.0.0
---

# Get-XoUserAuthenticationToken

## SYNOPSIS
List user authentication tokens.

## SYNTAX

### Self (Default)
```
Get-XoUserAuthenticationToken [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### UserId
```
Get-XoUserAuthenticationToken [-UserId] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve authentication tokens for a specific user or the currently authenticated caller.

## EXAMPLES

### EXAMPLE 1
```
Get-XoUserAuthenticationToken
```

### EXAMPLE 2
```
Get-XoUserAuthenticationToken -UserId "722d17b9-699b-49d2-8193-be1ac573d3de"
```

## PARAMETERS

### -UserId
The ID of the user whose tokens to retrieve.
If omitted, returns the caller's own tokens.

```yaml
Type: String[]
Parameter Sets: UserId
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

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

### XoPowershell.UserAuthenticationToken
## NOTES

## RELATED LINKS
