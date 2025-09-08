cob -zg -U -C errformat=3 $1
if [[ $? -eq 0 ]]
then
   echo "compilation ok"
   mv ${1%%.*}.so ./build
   mv ${1%%.*}.lst ./Listing
   rm ${1%%.*}.int
   rm ${1%%.*}.o
fi
