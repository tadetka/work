#!/bin/bash
#

if [ ! "$UID" ] ; then
	echo "Please run this script as root!"
	exit 1
fi

#rm -rf /etc/gtivpn/
#rm -rf /etc/gnutls/



filesource="http://www.gratex.com/vpn/vpn_install.tar.gz"
filesource2="http://rico.hq.gratex.com/vpn/vpn_install.tar.gz"
idtmpfile=`date +%N`
filedest="/tmp/$idtmpfile"
dwncheck=0
vpnfolder="/etc/gtivpn/"
opencon="/usr/sbin/openconnect"
PIDFILE="$vpnfolder/openconnect"
gnutl="/etc/gnutls"
stav=0
run="/usr/local/bin/"



    if [ ! -d $filedest ] ; then
      mkdir $filedest
      cd $filedest
      
	ping -c 4 rico.hq.gratex.com >/dev/null
	if [ $? -eq 0 ] ; then
	   wget --no-proxy $filesource2
	else 
	   wget --no-proxy $filesource
	fi
      if [ $? -ne 0 ] ; then 
	echo -e "\n\n\t Download failed\n"
	exit 2
      else
         dwncheck=1
      fi
	if [ $dwncheck -ne 0 ]; then 
	 tar -xf vpn_install.tar.gz
	  dpkg -i $filedest/*.deb
	 ./install*.sh
	 echo -e "\n\n\tInstallation of packages completed\n"
	
	
	
############################################################################	
	




	
	      if [ ! -d ${vpnfolder} ] ; then
		echo -e "\n\n\tCreating VPN folder"
		 mkdir ${vpnfolder}
	      fi	
	      if [ ! -d ${PIDFILE} ] ; then	      
		  echo -e "\n\n\tCreating PID folder"
		mkdir ${PIDFILE}
		chmod 777 ${PIDFILE}
	      fi

		if [ -d ${vpnfolder} ] ; then 
		 chmod 777 ${vpnfolder}
		  cp $filedest/*.sh $run
		   chmod 555 $run/gtivpn*.sh
		  
		  if [ ! -d $gnutl ]; then 
		    echo -e "\n\n\tConfiguring gnuts-bin\n"
		     mkdir /etc/gnutls
		     touch /etc/gnutls/pkcs11.conf
		     echo "load=/usr/lib/libeTPkcs11.so" >> /etc/gnutls/pkcs11.conf
		      if [ -x ${opencon} ] ; then 
			stav=1
			echo -e "\n\n\tSetting \n"
			 echo "%sudo ALL=(ALL) NOPASSWD: /usr/sbin/openconnect" >> /etc/sudoers
			echo -e "\n\n\tINSTALLATION COMPLETED ENJOY!\n"
		      else echo -e "\nOpenconnect not installed, please install Openconnect version 4.07 \n\t" 
		      fi
		  else echo -e "\n\n\t Gnutls already installed, carrying on... \n"
		  fi
		else echo -e "\t\n\n Vpn propably installed because of exisitng /etc/gtivpn directory \n"
		fi
	


############################################################################
	
	
	rm -rf $filedest

        else echo -e "\n\n\tInstallation of packages failed\n"; exit 1 
      fi
   else echo -e "\n\n\t Download Failed, check your proxy settings and Internet connection\n"
  fi  


     









	
	
	 
	
    
