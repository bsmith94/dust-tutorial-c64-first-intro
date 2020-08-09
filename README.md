# Dust Tutorial 002 #

(c) actraiser/Dustlayer

Dustlayer WHQ: http://dustlayer.com
Contact: actraiser@dustlayer.com
Twitter: https://twitter.com/actraiser

This tutorial is part of a blog dedicated to C64 programming. It should be used with [dust](https://github.com/actraiser/dustlayer "Dustlayer Repository holds the dust command line tool"), the command line tool for C64 cross development on Mac OSX. Win/Linux User can clone the repository of course but must take care to set up their system to compile and run the code.


# Makefile

Makefile allows use of GNU make to build this project in lieu of the dust bundle.

1. Copy make.defs.sample to make.defs. The paths to acme, pucrunch and x64 will need to be adjusted, per your environment.
2. Execute: 'make' to build the PRG.
3. Execute: 'make run' to execute the PRG in the x64 emulator.

The logic of Makefile is largely influenced by c64-devit. https://github.com/cliffordcarnmo/c64-devkit
