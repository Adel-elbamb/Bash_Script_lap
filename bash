#! /usr/bin/bash


# awk -F: 'BEGIN { print "START" } 
#      { print $5 } 
#      END { print "END" }' /etc/passwd

# awk -F: 'BEGIN { print "START" } 
#      { print NR, $1, $5, $6 }
#      END { print "END" }' /etc/passwd


# awk -F: 'BEGIN { print "START" } 
#      { if ($3 > 500 ) {
#       { print NR, $1, $5, $6 }
#      } }
#      END { print "END" }' /etc/passwd


# awk -F: 'BEGIN { print "START" } 
#      { if ($3 == 500 ) {
#       { print NR, $1, $5, $6 }
#      } }
#      END { print "END" }' /etc/passwd


# awk -F: 'BEGIN { print "START" } 
#      { 
#       if (NR>=5 && NR<=15)
#      {print $0 }
#      }
#      END { print "END" }' /etc/passwd

# awk -F: '{
     
#     for (i = 1; i <= NF; i++) {
#         if ($i == "lp"){
#           $i="mylp"
#         }
#     }
#     print $0;
# }' /etc/passwd


# awk -F: '
# BEGIN { max = -1 }
# {
#     if ($3 > max) {
#         max = $3;
#         line = $0;
#     }
# }
# END { print line }' /etc/passwd


# awk -F: '
# BEGIN { sum=0 ,sumgrop = 0}
# {
#    if($3) {
#    sum = sum +1 
#    for(i=1 ; i< sum ; i++) {
#      x= i +1 
#      if($4[i] == $4[x]) {
#      sumgrop = sumgrop +1 
#      }
#    }
#    }
# }
# END { print sumgrop }' /etc/passwd

awk -F: '
BEGIN { sumgrop = 0 }
{
    group[$4] += $3  
}
END {
    for (gid in group) {
        sumgrop= sumgrop +1
    }
}END { print sumgrop }' /etc/passwd
