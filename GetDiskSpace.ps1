function Get-DiskSpace {
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n='Size(GB)';e={$_.Used / 1GB -as [int]}}, @{n='FreeSpace(GB)';e={$_.Free / 1GB -as [int]}}
}
