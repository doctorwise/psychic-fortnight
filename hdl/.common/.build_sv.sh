#!/usr/bin/env bash

make -f .Makefile_sv

rm -rf __pycache__ sim_build results.xml ../model/__pycache__
