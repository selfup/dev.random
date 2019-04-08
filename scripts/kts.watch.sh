#!/usr/bin/env bash

echo 'main.kts' | entr -rs 'kotlinc -script main.kts'
