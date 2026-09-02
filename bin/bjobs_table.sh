#!/bin/bash

loc="$(hostname)"
now="$(date '+%Y-%m-%d %H:%M:%S %Z')"
script_dir="$(dirname "$0")"

echo "Location: $loc"
echo "Time:     $now"
echo "Script:   $script_dir"

bjobs "$@" -o "jobid queue stat submit_time run_time exec_cwd job_name" | awk "$script_dir/bjobs_table.awk"