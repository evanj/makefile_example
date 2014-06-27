# Correct incremental rebuilds with GNU Make

This repository contains example source code for [Correct incremental builds with Makefiles](http://www.evanjones.ca/makefile-dependencies.html). It contains the following directories:

* `1_simple`: A simple Makefile that doesn't rebuild correctly.
* `2_manual`: Manually specifies dependencies.
* `3_transitive`: Automatic dependencies with a header that includes a header. Breaks on renames.
* `4_renamed_input`: Automatic dependencies that handle renamed files.

In each directory, run `./demo.sh` to see a demonstration of how it works.
