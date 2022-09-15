#!/usr/bin/env bash

make -f .Makefile_sv
make -f .Makefile_vhdl

rm -rf __pycache__ sim_build results.xml ../model/__pycache__
