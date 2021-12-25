
md5=`md5sum files/linux-5.15.11.tar.xz | awk '{print $1}'`
echo $md5
echo "7fcbea316f8439d092040996295c8f9d"

if [ $md5 = "7fcbea316f8439d092040996295c8f9d" ]
then
	echo "pass"
	exit 0
else
	echo "fail"
	exit -1
fi

