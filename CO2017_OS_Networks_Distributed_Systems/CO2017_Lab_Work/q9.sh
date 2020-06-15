#! /bin/bash
for i in {0..23}
do
echo $i
ssh-keygen -G /tmp/mods-X.candidate -b 768
done
