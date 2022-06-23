#!/bin/sh

echo "please input Java-file-name which you want to run："
read file
javac $file.java
java $file
