if [ "$1" = "" ]; then 
    exit 1
fi

ids=$(xinput --list | awk -v search="$1" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    echo $1
    xinput set-prop $i 'libinput Accel Speed' 1.0
    xinput set-prop $i 'libinput Click Method Enabled' 0 1
    #xinput set-prop $i 'libinput Click Method Enabled Default' 1
    #xinput set-prop $i 'Device Accel Constant Deceleration' 2.5
    #xinput set-prop $i 'Device Accel Velocity Scaling' 1.0
done
