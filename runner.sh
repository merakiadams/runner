#########################################################################
# File Name: .runner.sh
# Author: 潘一萱
# mail: 1138401083@qq.com
# version: 1.3
# Created Time: 2022年06月19日 星期日 11时00分27秒
#########################################################################
#!/bin/bash

uNames=`uname -s`
osName=${uNames: 0: 4}

if [ "$osName" != "Linu" ]; then
    echo "Sorry, this script only supports Linux."
    exit
fi



function IsSuffix() {
    local filename="$1"
    local suffix="$2"
    if [ "$(FileSuffix ${filename})" = "$suffix" ]; then
        return 0
    else
        return 1
    fi
}

file=$1
if [ "${file##*.}"x = "py"x ];then

   echo "  "  
   python3 $1

elif [ "${file##*.}"x = "java"x ];then
    
    echo "  "    
    javac $1
    java ${file%.*}

elif [ "${file##*.}"x = "c"x ];then

    echo "  "
    gcc $1
    ./a.out

elif [ "${file##*.}"x = "html"x ];then
    
    echo "  "
    firefox $1

elif [ "${file##*.}"x = "md"x ];then

    echo "  "
    typora $1

elif [ "${file##*.}"x = "pdf"x ]||[ "${file##*.}"x = "doc"x ]||[ "${file##*.}"x = "docx"x ]||[ "${file##*.}"x = "xlsx"x ]||[ "${file##*.}"x = "excel"x ]||[ "${file##*.}"x = "mp4"x ];then
    
    echo "  "
    xdg-open $1

elif [ "${file##*.}"x = "png"x ]||[ "${file##*.}"x = "webp"x ]||[ "${file##*.}"x = "jpm"x ];then

    echo "  "
    fim -a $1

elif [ "${file##*.}"x = "mp3"x ];then

    echo " ﱘ "
    play $1 

elif [ "${file##*.}"x = "deb"x ];then
    echo "  "

    a=`uname  -a`

    b="Darwin"
    c="centos"
    d="ubuntu"
    e="archlinux"

    if [[ $a =~ $c ]];then
        echo "Sorry, you can't get it."
    elif [[ $a =~ $d ]];then
        sudo dpkg -i $1
    elif [[ $a =~ $e ]];then
        sudo debtap -q $1
        sudo pacman -U ${file%.*}.tar.xz
    else
        echo $a
        echo "Sorry, this script only supports Linux(debian/arch)"
        exit
    fi

elif [ "${file##*.}"x = "zip"x ]; then
    echo "  "
    unzip $1

elif [ "${file##*.}"x = "tar.xz"x ]; then
    echo "  "
    tar -zxvf $1

fi
