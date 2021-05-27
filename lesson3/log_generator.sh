#!/bin/bash
WORDFILE=/usr/share/dict/words
RANDOM=$$;

for i in {1..1000}
do
  lines=$(cat $WORDFILE  | wc -l);
  rnum=$((RANDOM*RANDOM%$lines+1));
  modulo=$((i % 65))
  if [[ $modulo == 0 ]]
  then
    RANDOM_WORD="hello"
  else
    RANDOM_WORD=$(sed -n "$rnum p" $WORDFILE;)
  fi
  echo $RANDOM_WORD >> grep.log
done
