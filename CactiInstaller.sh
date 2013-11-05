#!/bin/bash
echo "        ___           _   _    _____           _        _ _             "        
echo "       / __\__ _  ___| |_(_)   \_   \_ __  ___| |_ __ _| | | ___ _ __   "
echo "      / /  / _\` |/ __| __| |    / /\/ '_ \/ __| __/ _\` | | |/ _ \ '__|  "
echo "     / /__| (_| | (__| |_| | /\/ /_ | | | \__ \ || (_| | | |  __/ |     "
echo "     \____/\__,_|\___|\__|_| \____/ |_| |_|___/\__\__,_|_|_|\___|_|     "
USUARIO=`whoami`
if [ $USUARIO = "root" ]
	then
		rm -rf recargandocactiinstaller.sh 
		if grep "Debian GNU/Linux 6.0" /etc/issue >> /dev/null 
			then
				echo "este sistema es soportado"
				aptitude update
				aptitude install -y apache2
				aptitude install -y php5 php5-gd php5-mysql mysql-sever
				echo "ServerName localhost" >> /etc/apache2/httpd.conf
				/etc/init.d/apache2 restart
				aptitude install -y rrdtool snmp
				aptitude install -y libjpeg62 libjpeg62-dev libpng12-0 libpng12-dev libgd2-xpm-dev
				/etc/init.d/apache2 restart
				aptitude install -y cacti cacti-cactid
				/etc/init.d/apache2 restart
		else
				echo "el instalador no soporta este sistema.."
				echo "espere la proxima actualizacion del programa"
				echo "se planea dar soporte a:"
				echo ""
				echo "1.- CentOS 6.0"
				echo "2.- Gentoo"
				echo "3.- Slackware"
				echo ""	
				echo "por ahora solo Debian 6.0 es soportado"
				echo ""
		fi
else
	echo ""
	echo "     Usted no a iniciado session como root"
	echo "     Porfavor Inicie session como root"
	echo "     y vuelva a ejecutar CactiInstaller"
	echo ""
fi
