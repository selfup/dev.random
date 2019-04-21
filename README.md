# dev.random

Spike ideas in multiple languages and have your scripts rerun on save. Uses entr to watch and rerun.

Please install `entr` for the watch scripts to work :smile:

1. mac: `brew install entr`
1. ubuntu: `sudo apt install entr`

### Use

Pick a language. Say ruby.

`./scripts/rb.watch.sh`

Now start editing the `main.rb` file. On every save, it will re run the script!

For Rust you more than likely want to run in release mode for benchmarking stuff so you can pass a `-r` flag to the `./scripts/rs.watch.sh -r` script

Have fun :tada:
