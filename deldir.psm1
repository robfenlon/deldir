function deldir {
	Param(
		[string]$dir
	)

	if(-not($dir)) { Throw "You must supply a directory as a parameter" }

	if (-Not (Test-Path $dir))
  {
		Write-Host "Directory " -nonewline; Write-Host $dir -f red -nonewline; Write-Host " does not exist...";
		return;
	}

	md temp.dir | out-null
	attrib +h $dir /s /d | out-null
.       attrib +h temp.dir /s /d | out-null
	robocopy temp.dir $dir /MIR | out-null
	Write-Host "Deleting directory " -nonewline; Write-Host $dir -f green -nonewline; Write-Host " ...";
	rm temp.dir | out-null
	rm $dir | out-null
	Write-Host $dir -f green -nonewline; Write-Host " removed!";
}
