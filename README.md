#Foxy Proxy

This is a small script to start Firefox in a given profile allowing it to connect through a SSH tunnel. The script uses autossh to keep the tunnel alive. It will check if autossh is installed and install it if not. 

##First setup autossh to work
For autossh to work propery you will need to first set up passwordless login to your server. This can be achieved with the following commands. 
```
$ssh-keygen
$ssh-copy-id user@example.com -p [portnumber]
```

After that is running try and login to your server without the password. 
If you get a message which says `SSH Agent admitted failure to sign using the key` Run the following command to fix it. 
```
ssh-add
```
##After that setup firefox 

Simply click on **preferences** and fill in details as shown on the image below. Port 9000 is setup within the script but if you change this port don't forget to change it here and within the script. 

![Firefox screen](https://bitbucket.org/repo/A4KRrr/images/2132384567-Selection_015.png)

After that is set up change the permissions on the script and run it.

```
$chmod +x foxyproxy.sh
$bash foxyproxy.sh user@example.com 22
```
Change port `22` to what ever port you use to log into your server. 

