#!/usr/bin/perl

while(<>)

{
if ( (/[.]command[kK]ey/) || (/[.]key[ 2cs]/) || (/[.]keybinding/) )
	{
	$_ =~ s/^(.*>)/<!-- $1 -->/
	} 

if (/[.]access[kK]ey/ || /[.]a[kK]ey/)  
	{
	$_ =~ s/<!ENTITY\s+([-\w\.]+)(\s+)\"(.{1})\"\s*>/<!ENTITY $1$2\"$1_$3\">/
	} 


print $_;
}