#!/usr/bin/env bash

startingDir=`pwd`

function cleanup () {
  cd $startingDir
  rm -f testOutput.txt
  printf "\r\r  \nCtrl+C pressed. Exiting.\n\n"
  exit 0
}

trap 'cleanup' 2

rm -f testOutput.txt
touch testOutput.txt
printf "\n\n"
for directory in `find . -name "tests" | sort`; do
	cd $directory;
  printf "\tRunning tests for $directory\n"
	make &>> ../../testOutput.txt;
	cd ../..;
done;

printf "\n\n\t   Results Summary\n\n"
printf "\t=====================\n\n"
grep -e "PASS" -e "FAIL" testOutput.txt | grep -v "TESTS" | \
  awk '{gsub("PASS", "\033[0;32mPASS\033[0m"); gsub("FAIL", "\033[0;31mFAIL\033[0m"); print "\t"$2"\t"$3}'
printf "\n\t=====================\n\n"
rm -f testOutput.txt
