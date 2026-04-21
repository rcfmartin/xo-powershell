---
external help file: xo-powershell-help.xml
Module Name: xo-powershell
online version:
schema: 2.0.0
---

# Get-XoVmTemplateMessage

## SYNOPSIS
List messages for a VmTemplate.

## SYNTAX

```
Get-XoVmTemplateMessage [-VmTemplateUuid] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve messages associated with a specific Xen Orchestra VmTemplate.

## EXAMPLES

### EXAMPLE 1
```
Get-XoVmTemplateMessage -VmTemplateUuid "00000000-0000-0000-0000-000000000000"
```

## PARAMETERS

### -VmTemplateUuid
The UUID of the VmTemplate whose messages to retrieve.

```yaml
Type: String[]
Parameter Sets: (All)
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

### XoPowershell.Message
## NOTES

## RELATED LINKS
