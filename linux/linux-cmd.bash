# pipe
history | grep "sudo chmod " | less
ls /usr/bin | grep java 
cat /etc/apache2/sites-enabled.conf | grep port

# Redirect 
ls /usr/bin | grep java  > file.txt
# Append
ls /usr/bin | grep java  >> file.txt

# one line after another
clear; sleep 10; echo "Hope you are enjoying th lecture"