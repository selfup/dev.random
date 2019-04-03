#!/usr/bin/env bash

echo 'main.exs' | entr -rs 'mix format && elixir main.exs'
