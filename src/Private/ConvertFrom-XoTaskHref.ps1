function ConvertFrom-XoTaskHref
{
    <#
    .SYNOPSIS
        Convert a task URL to a task object
    .DESCRIPTION
        Extracts the task ID from a URL and retrieves the task from the API
    .PARAMETER Uri
        The task href URL to convert to an object.
    .EXAMPLE
        ConvertFrom-XoTaskHref -Uri $uri
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string]$Uri
    )

    process
    {
        if ($Uri -notmatch "\/rest\/v0\/tasks\/([0-9a-z]+)")
        {
            throw ("Bad task href format: {0}" -f $Uri)
        }

        $taskId = $matches[1]
        Get-XoTask -TaskId $taskId
    }
}
