BEGIN {
   printf "%-10s %-12s %-8s %-20s %-10s %s\n", "JOB_ID , "QUEUE", "STATUS", "SUBMIT_TIME", "DURATION", EXEC_CWD";
   printf "%-10s %-12s %-8s %-20s %-10s %s\n", "---------" , "-----------", "--------", "--------------------", "----------", "----------";
}

NR == 1 { next }

{
   # bjobs -o "jobid queue stat submit_time runtime exec_cwd job_name"
   # 1:JOBID 2:QUEUE 3:STAT 4..6:SUBMIT_TIME 7:RUN_TIME 8:EXEC_CWD 9..NF:JOB_NAME

   if (NF < 8) next

   joib_id = $1
   queue   = $2
   status  = $3
   submit_time = $4 " " $5 " " $6
   duration    = $7

   exec_cwd = $8
   task_name = ""
   if (NF >=9) {
      task_name = $9
      for (i = 10; i <= NF; i++) {
         task_name = task_name " " $i
      }
   }

   if (exec_cwd == "-" || exec_cwd == "" || exec_cwd == "N/A") {
      if (task_name != "") {
         exec_cwd = task_name
      }
   }

   printf "%-10s %-12s %-8s %-20s %-10s %s\n", job_id, queue, status, submit_time, duration, exec_cwd;
}