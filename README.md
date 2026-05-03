# mojo-examples
Mojo programming examples

## How to build
```
<Ubuntu 22.04 LTS>
-------------------
$ git clone https://github.com/ChunghanYi/mojo-examples
$ cd mojo-examples/src

$ pixi init . -c https://conda.modular.com/max-nightly/ -c conda-forge

$ pixi add mojo
✔ Added mojo >=1.0.0b2.dev2026050306,<2

$ pixi run mojo --version
Mojo 1.0.0b2.dev2026050306 (dc0cf636)

$ pixi shell
(src) $ mojo build first.mojo
(src) $ ./first
Who are you? michael
Hi, michael!

```
