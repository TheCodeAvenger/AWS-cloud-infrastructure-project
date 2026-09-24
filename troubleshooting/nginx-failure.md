# Nginx Service Failure — Troubleshooting

Q. Problem :
- The website became unavailable after the Nginx service was stopped.

Q. Detection :
- My Bash health-check script detected:

- Nginx: FAIL
- Website: FAIL
- Disk: PASS

Q. Investigation :
-I checked the Nginx service:

used : ( sudo systemctl status nginx )

-The service showed:

[ Active: inactive (dead)]

Q. Root Cause :
-Nginx was not running.
-This was an intentional failure test to verify that my health-check script could detect a web server failure.

Q. Fix
-I started Nginx again:

used : ( sudo systemctl start nginx )

Q. Verification
-I ran the health-check script again:

Nginx: PASS
Website: PASS
Disk: PASS

Q. What I Learned :
- How to check a Linux service using systemctl
- How to identify an Nginx service failure
- How to use a Bash health-check script
- How to troubleshoot and recover a simple web-server failure