#!/usr/bin/env bash

echo 'main.rs' | entr -rs 'rustc main.rs && ./main'
