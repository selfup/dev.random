#!/usr/bin/env bash

echo 'main.kt' | entr -rs 'kotlinc main.kt -include-runtime -d main.jar && java -jar main.jar'
