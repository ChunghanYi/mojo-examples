# mojo-examples
Mojo programming examples based on Mojo 1.0.0b2

## How to build and run mojo codes
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

## My blog posting for this project
  For more information, please refer to my blog post below.<br>
  https://slowbootkernelhacks.blogspot.com/2026/05/mojo-programming-language.html
  <br>
  <br>
