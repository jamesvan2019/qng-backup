!/bin/sh
# how often to back up
period=$1
# qng data directory
datadir=$2
if [ ! -n "$period" ]; then
  echo "period is null"
  exit
fi
if [ ! -n "$datadir" ]; then
    echo "datadir is null"
  exit
fi
while true
do
backuptime=$(date "+%Y-%m-%d-%H%M%S")

# backup a temporary directory
backupname="qng-${backuptime}"
echo "cp -rf ${datadir} ${backupname}"
cp -rf $datadir $backupname
backupfilename="${backupname}.tar.gz"

# backup
echo "tar -zcvf ${backupfilename} ${datadir}"
tar -zcvf $backupfilename $datadir
echo "rm -rf ${backupname}"
rm -rf $backupname
echo "success ${backupname}"
sleep $period
done

