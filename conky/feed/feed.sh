cd /home/yubaojun/.feed/
rm -fr feed_*
echo '正在获取天气信息....' > feed_ls
sleep 15
wget -q https://tianqi.moji.com/ -O tqym
wd=`head -111 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}'`
tq=`head -113 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' `
by=`head -122 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}'`
wc=`head -155 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' `
dq=`head -72 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}'`
kqzl=` head -105 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' | awk '{print $1 $2}'`
sd=` head -117 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' | awk '{print $1 $2}'`
fl=`head -118 tqym | tail -1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}'`

rm -fr tqym
echo "$wd°" > feed_wd 
echo "  $tq     $wc" > feed_ls
echo "空气质量：$kqzl    $fl     $sd" > feed_xls
echo "$by" >> feed_xls
cw=`cat feed_wd` 2>/dev/null
cl=`cat feed_ls` 2> /dev/null
cx=`cat feed_xls` 2>/dev/null
if [ "$cw" = '' ] || [ "$cl" = '' ] || [ "$cx" = '' ]
then
	sz=`cat sz`
	if test $sz -lt '9'
	then
		sleep 1
		sz=`expr $sz + 1`
		echo $sz > sz
		sh $0
	else
		exit 0
	fi
fi
echo 1 > sz
