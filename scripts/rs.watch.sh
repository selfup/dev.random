#!/usr/bin/env bash

# pass -r to the watch script for release mode

if [[ $1 == "-r" ]]
then
  echo 'main.rs' | entr -rs 'rustc -C debuginfo=0 -C opt-level=3 main.rs && time ./main'
else
  echo 'main.rs' | entr -rs 'rustc main.rs && ./main'
fi
