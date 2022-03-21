#!/bin/bash
ls -laF $1 | awk 'BEGIN {
black="\033[0;30m";
red="\033[0;31m";
green="\033[0;32m";
orange="\033[0;33m";
blue="\033[0;34m";
purple="\033[0;35m";
cyan="\033[0;36m";
light_grey="\033[0;37m";
dark_grey="\033[1;30m";
light_red="\033[1;31m";
light_green="\033[1;32m";
yellow="\033[1;33m";
light_blue="\033[1;34m";
light_purple="\033[1;35m";
light_cyan="\033[1;36m";
white="\033[1;37m";

	}
NR==1{out[FNR]="";print;FNR--}
NR>1{ 
	
	split($1,perm,"");
	perms="";
	if (perm[1]=="p") { perms=perms orange } else if ( perm[1]=="l" ) { perms=perms light_cyan } else if ( perm[1]=="d" ) { perms=perms light_purple } else { perms=perms light_grey };
	perms=perms perm[1]; #prints file type 
	perms=perms green perm[2] perm[3] perm[4] # prints user permissions
	perms=perms yellow perm[5] perm[6] perm[7] #prints group permissions		
	perms=perms light_red perm[8] perm [9] perm[10]
	w=length($2)
	S2=sprintf("%4s",w+4, $2);
	user=light_cyan $3
	group=light_cyan $4
	size=$5
	month=light_grey $6
	split($7, tmp,""); if (length(tmp)==1) { day=light_grey " " $7 } else { day=light_grey $7 }
	#day=light_grey $7
	time=light_grey $8
	if (perm[1]=="d"){ name=light_blue $9} else if (perm[1]=="p") { name=orange $9 } else if (perm[1]=="l") { name=light_cyan $9} else { name= white $9 } 
	arrow= white $10 
	split($11, tmp, ""); 
	if (tmp[length(tmp)]=="/"){ linkedTo=light_blue $11 } else if (tmp[length(tmp)]=="|") {linkedTo=orange $11} else if (perm[4]="x") { linkedTo=light_green $11 } else { linkedTo=white $11}

	
	print perms " " user " " group " " month " " day " " time "  " name " " arrow " " linkedTo

} 
'

