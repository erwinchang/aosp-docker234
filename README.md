# aosp-234

docker build aosp 2.3.4

## docker command

docker run
```
docker run -v /lib/modules:/lib/modules -v $HOME:/mnt/aosp -v $HOME/ssd1:/mnt/ssd1 -v $HOME/ssd2:/mnt/ssd2 -it --rm --name aosp-234 erwinchang/aosp-234 /bin/bash
```

enable aosp ccache
```
export CCACHE_DIR=/mnt/ssd1/workspace/xx/ccache
prebuilt/linux-x86/ccache/ccache -M 5G
```

build
```
source build/envsetup.sh
lunch aosp_arm-eng
make -j4
```

## 參考來源


- [sameersbn/docker-ubuntu][2]
- [在TI-Omap3530上移植Android GingerBread 2.3.4][1]


[1]:https://blog.csdn.net/gqb_driver/article/details/8443219
[2]:https://github.com/sameersbn/docker-ubuntu/tree/12.04

