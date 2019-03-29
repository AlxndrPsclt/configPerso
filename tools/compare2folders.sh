#!/bin/sh

echo "Comparing content of the two following folders: "
echo $1
echo $2

ls $1 > /tmp/list_folder1.txt
ls $2 > /tmp/list_folder2.txt

comm -12 /tmp/list_folder1.txt /tmp/list_folder2.txt
