## Week 5 Homework Submission File: Archiving and Logging Data

Please edit this file by adding the solution commands on the line below the prompt.

Save and submit the completed file for your homework submission.

---

### Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1. Command to **extract** the `TarDocs.tar` archive to the current directory:
tar -xvvf TarDocs.tar 

2. Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directory:
 tar -cvvWf Javaless_Docs.tar --exclude=Java ~/Projects/TarDocs/Documents

3. Command to ensure `Java/` is not in the new `Javaless_Docs.tar` archive:
tar -tvvf Javaless_Docs.tar | grep -i java 

**Bonus** 
- Command to create an incremental archive called `logs_backup_tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory:
sudo tar -czvf logs_backup.tar.gz --listed-incremental=snapshot.snar --level=0 /var/log

#### Critical Analysis Question

- Why wouldn't you use the options `-x` and `-c` at the same with `tar`?
Because -x option extracts while -c creats an archive. There's no point extracting and creating an archive. In the instance where a tarball already exists, there's no point extracting it then compressing it. 
---

### Step 2: Create, Manage, and Automate Cron Jobs

1. Cron job for backing up the `/var/log/auth.log` file:
0 6 * * 3 tar -czvf /authlog.tgz /var/log/auth.log
---

### Step 3: Write Basic Bash Scripts

1. Brace expansion command to create the four subdirectories:
mkdir -p ~/backups/{freemen,diskuse,openlist,freedisk}
2. Paste your `system.sh` script edits below:

    ```bash
    #!/bin/bash
# Free memory output to a free_mem.txt file
free -h > ~/backups/freemem/free_mem.txt

# Disk usage output to a disk_usage.txt file

df -h > ~/backups/diskuse

# List open files to a open_list.txt file
lsof > ~/backups/openlist

# Free disk space to a free_disk.txt file
df-kh > ~/backups/freedisk
    ```

3. Command to make the `system.sh` script executable:
chmod +x system.sh

**Optional**
- Commands to test the script and confirm its execution:
./system.sh && ls -lR ~/backups
**Bonus**
- Command to copy `system.sh` to system-wide cron directory:
sudo cp ~/system.sh /etc/cron.weekly
---

### Step 4. Manage Log File Sizes
 
1. Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file. 

    Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.

    - Add your config file edits below:

    ```bash
    /var/log/auth.log {
        weekly
        rotate 7
        notifempty
        delaycompress
        missingok
}
    ```
---

### Bonus: Check for Policy and File Violations

1. Command to verify `auditd` is active:
systemctl status auditd
2. Command to set number of retained logs and maximum log file size:

    - Add the edits made to the configuration file below:

    ```bash

local_events = yes
write_logs = yes
log_file = /var/log/audit/audit.log
log_group = adm
log_format = RAW
flush = INCREMENTAL_ASYNC
freq = 50
max_log_file = 35
num_logs = 7 
priority_boost = 4
disp_qos = lossy
dispatcher = /sbin/audispd
name_format = NONE

    ```

3. Command using `auditd` to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:


    - Add the edits made to the `rules` file below:

    ```bash
    -w /etc/shadow -p wra -k hashpass_audit
    -w /etc/passwd -p wra -k userpass_audit
    -w /var/log/auth.log -p wra -k authlog_audit

    ```

4. Command to restart `auditd`:
sudo systemctl restart auditd
5. Command to list all `auditd` rules:
sudo auditctl -l
6. Command to produce an audit report:
sudo aureport --auth
7. Create a user with `sudo useradd attacker` and produce an audit report that lists account modifications:
sudo aureport -m
8. Command to use `auditd` to watch `/var/log/cron`:
sudo auditctl -w /var/log/cron
9. Command to verify `auditd` rules:
sudo auditctl -l
---

### Bonus (Research Activity): Perform Various Log Filtering Techniques

1. Command to return `journalctl` messages with priorities from emergency to error:
sudo journalctl -o verbose -p 0..3
2. Command to check the disk usage of the system journal unit since the most recent boot:
sudo journalctl -u systemd.journald -S today | du | less
3. Comand to remove all archived journal files except the most recent two:
journalctl --vacuum-file=2
4. Command to filter all log messages with priority levels between zero and two, and save output to `/home/sysadmin/Priority_High.txt`:
sudo journalctl -o verbose -p 0..2 > /home/sysadmin/Priority_High.txt

5. Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:

    ```bash
    0 17 * * * journalctl -o verbose -p 0..2 >> /home/sysadmin/Priority_High.txt
    ```

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
