#!/usr/bin/env bash

echo 'main.ex' | entr -rs 'mix format && elixirc main.ex'
