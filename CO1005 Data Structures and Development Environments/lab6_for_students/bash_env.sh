set -a # export all vars
# set -x # debug

# put_classes_in_bin="-d bin"

jars=`echo jars/*`

javac_cp="-cp ${jars// /:}" 

java_cp="-cp ${jars// /:}:bin" # add bin directory for our classes

java_files=`ls src/*.java`


