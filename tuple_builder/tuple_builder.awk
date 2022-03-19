# awk script implemented using mawk
#
# Purpose of this script is to process n number of files and merge lines into tuples with smallest
# possible complexity which is O(2n).
# 
# Motivation: my first approach when solving this problem was using nested loops in bash. 
# I ended up with an exponential complexity.  
#
# input: n files all with the same number of lines 
# $ cat hosts.txt
# localhost
# 127.0.0.1
# 10.0.2.15
#
# $ cat ports.txt 
# 22
# 80
# 25
#
# output of awk -f <this_script> hosts.txt ports.txt would be 
# localhost 22
# 127.0.0.1 80
# 10.0.2.15 25
#
# If having a third file protocols.txt
# $ cat protocols.txt
# ssh
# http
# smtp 
#
# output of awk -f <this_script> hosts.txt ports.txt protocols.txt would be 
# localhost 22 ssh
# 127.0.0.1 80 http
# 10.0.2.15 25 smtp
#
# 
BEGIN	{ done=1}
FNR==1 	{ fd++ }
FNR==1 && FNR<NR && done==1 {r=NR-1; f=NR-1; done=0}
       	{ lines[fd FS FNR]=$0; } 
END    	{
	 s="";
	 j=1;
	 do {
	    i++; 
            s=s""lines[i FS j]" " ;
	    if (fd==i) {j++; i=0;print s; s=""};
	     
	    } while (i<=fd && j<=f) 
	}
