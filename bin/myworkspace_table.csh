#!/bin/csh -f
#
# myworkspace_table.csh - Format `myworkspace` output into a table
# Usage : myworkspace | myworkspace_table.csh

printf "%-5s %-50s  %-12s %-60s \n" "#" "CLIENT" "DATE" "ROOT"
print  "%-5s %-50s  %-12s %-60s \n" \
  "-----" \
  "------------------------------------------------------------" \
  "------------" \
  "----------------------------------------------------------------------" \

awk 'BEGIN { idx = 0 } /^Client / { \
   idx++;       \
   client = $2; \
   dt     = $3; \
   root   = $5; \
   n      = split($0, a, "\x27"); \
   printf "%-5d  %-50s  %-12s %-60s \n", idx, client, dt, root \
}'
