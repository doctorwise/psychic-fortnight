#!/usr/bin/env bash

for directory in `find . -name "tests"`; do
	cd $directory;
	make;
	cd ../..;
done;

cd $PWD
