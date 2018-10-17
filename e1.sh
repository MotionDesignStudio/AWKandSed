#!/bin/sh

awk -F, '{
	print $4 ", " $0
}' $* |
sort |
awk -F, '
{
	if ($1==LastState){
		print "\t" $2
	}
	else {
		LastState = $1
		print $1
		print "\t" $2
	}
}
'
