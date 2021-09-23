#!/bin/bash - 
#===============================================================================
#
#          FILE: sftp.sh
# 
#         USAGE: ./sftp.sh 
# 
#   DESCRIPTION: This script, has copy to sftp command to local directory to remote
#				 directory.
# 
#       OPTIONS: Paths and Remote Users, and Change EXAMPLE_FILEs for a real files.
#  REQUIREMENTS: RHEL,CentOS,OEL
#          BUGS: Report to bug a omar.vela.condor@gmail.com
#         NOTES: Adatp to use a script a diferent port.
#		LICENSE: GNU General Public License v3.0
#        AUTHOR: Omar Vela (VeLinux)
#  ORGANIZATION: CIS
#       CREATED: 24/02/16 17:34
#      REVISION: -
#===============================================================================
#COPY SFTP LOCAL TO REMOTE

####################################################################################################
#VARIABLES EXEC
####################################################################################################

###DIRECTORYS
#Local Directory 
SLOCALDIR=""
#Remote Directory
REMOTEDIR=""

###USERS & PASSWD
#Remote User & Password
RUSER=""
RPASS=""
#Adition Data a Remote Port
RPORT=""
#IP
RIP=""

####################################################################################################
#PROGRAM
####################################################################################################

cd  $SLOCALDIR

for archivo in `ls EXAMPLE_FILE201???.txt` EXAMPLE_FILE2.csv OTHER_FILE.xls
do
#Convert FILES to UNIX2DOS
unix2dos $archivo
lftp sftp://$RUSER:$RPASS@$RIP  -e "put $archivo; bye"
done

####################################################################################################
#FINISH
####################################################################################################
exit 0;
