#!/usr/bin/env bash

echo 'main.java' | entr -rs 'javac Main.java && java -jar Main.jar'
