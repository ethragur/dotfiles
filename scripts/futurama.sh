 
#!/bin/bash
pkill mpv
FILES="/home/effi/data/Movies/Futurama/*"
i=0
sudo shutdown -c
ep1=""
ep2=""
let rnd1=$RANDOM%128
let rnd2=$RANDOM%128
if [ $rnd1 = $rnd2 ]; then
  let rnd2=rnd2+1
  
fi
echo $rnd1 $rnd2
for f in $FILES
do
  if [ "$i" = "$rnd1" ]
  then
    ep1="$f"
  fi
  if [ "$i" = "$rnd2" ]
  then
    ep2="$f"
  fi
  let "i += 1"
done
mpv "$ep1" "$ep2"
sleep 3000
#sudo systemctl suspend
