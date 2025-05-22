# Verbose Lean Documentation stub

Warning: this repository is work in progress that is very far from being useful yet.

This is the manual for Verbose Lean4. It consists of two Lean packages:
 * `examples` contains example code used in the documentation
 * `manual` contains the documentation itself

The examples rely on Mathlib. Before working on it, please run `lake exe cache get` in `examples`.

To build the documentation, enter `manual` and run:
```
$ lake exe docs
```

To view the documentation, you'll need a web server. Python provides one out of the box that can be run with a command such as:
```
$ python3 -m http.server 8000 --directory _out/html-multi/
```
after which the document can be read at `http://localhost:8000`.
