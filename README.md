## homm3lua <a href="https://travis-ci.org/radekmie/homm3lua"><img align="right" alt="Build Status" src="https://travis-ci.org/radekmie/homm3lua.svg"></a>

Lua API for [homm3tools](https://github.com/potmdehex/homm3tools).

### Quick Start

```shell
$ make
$ make doc # requires ldoc
$ lua homm3luatest/init.lua
```

### FAQ

* If compilation fail, set `LUAC` and `LUAL` variables in `Makefile` accordingly to your setup.
* If map crashes game at any moment, open it in editor and save it.
