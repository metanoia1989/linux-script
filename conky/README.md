移动到用户家目录
```sh
mv conkyrc $HOME/.conkyrc  
mv feed $HOME/.feed    
```

配置开机启动
```sh
echo 'conky &' >> $HOME/.profile
echo "sh $HOME/.feed/feed.sh &" >> $HOME/.profile

cat $HOME/.feed/feed.sh | sed -i "/cd/c cd $HOME\/.feed" $HOME/.feed/feed.sh
```

修改网络监控的网卡
```sh
vim $HOME/.conkyrc
# 最后三行修改自己的网卡名
下载速度:$alignr${downspeed wlp2s0} k/s
上传速度:$alignr${upspeed wlp2s0} k/s
${downspeedgraph wlp2s0 324D23 77B753}
```
