---
external help file: xo-powershell-help.xml
Module Name: xo-powershell
online version:
schema: 2.0.0
---

# Get-XoUserAuthenticationToken

## SYNOPSIS
List authentication tokens for the current user or a specific user.

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
Retrieves the API authentication tokens owned by a user (or the caller, if no -UserId is given).
Each token includes the client id, description, creation/expiration timestamps and most recent use.
Useful for auditing long-lived tokens created via xo-cli.

## EXAMPLES

### EXAMPLE 1
```
Get-XoUserAuthenticationToken
```

### EXAMPLE 2
```
Get-XoUserAuthenticationToken -UserId '722d17b9-699b-49d2-8193-be1ac573d3de'
```

## PARAMETERS

### -UserId
Optional user UUID.
When supplied, returns tokens belonging to that user.
When omitted, returns the caller's own tokens via /users/authentication_tokens.

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
