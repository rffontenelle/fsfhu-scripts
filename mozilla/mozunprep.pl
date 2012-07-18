#!/usr/bin/perl

while(<>)

{
if ( (/[.]command[kK]ey/) || (/[.]key/) || (/[.]keybinding/) )
	{
	$_ =~ s/^<!-- (.*) -->/$1/
	} 

if (/[.]access[kK]ey/ || /[.]a[kK]ey/)  
	{
	$_ =~ s/\".*_/\"/
	} 

print $_;
}