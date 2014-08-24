#!/bin/sh

get_host () {
  echo "$1" | sed -n -e 's/[^@]*@\([^:]*\).*/\1/p'
}

if [ $# -ne 2 ]; then
  echo "Usage: $0 <from> <to>" >&2
  exit 1
fi

HOST=$(get_host "$1")
if [ "$HOST" == ""  ]; then
  HOST=$(get_host "$2")
fi
 
OPTIONS=`vagrant ssh-config $HOST | awk -v ORS=' ' '{print "-o " $1 "=" $2}'`
  
CMD="scp ${OPTIONS} $1 $2"
#echo "$CMD"
$CMD
