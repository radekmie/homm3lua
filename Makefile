CC ?= gcc

INC := -I homm3tools/h3m/h3mlib -I homm3tools/3rdparty/uthash/src
LIBDIR := homm3tools/OUTPUT/gcc
STATICLIBS := $(LIBDIR)/h3mlib.a $(LIBDIR)/h3mtilespritegen.a

LUAC ?= $(shell pkg-config --cflags lua)
LUAL ?= $(shell pkg-config --libs   lua)

CFLAGS := $(LUAC) -W -Wall -Wextra -O3 -fPIC -shared -std=c99 $(INC)
LDLIBS := $(LUAL)
LFLAGS := -L $(LIBDIR)

SRC := $(shell find homm3lua -type f -name '*.c')
OBJ := $(addprefix dist/,$(notdir $(SRC:.c=.o)))

all: dist/homm3lua.so

.PHONY: clean
clean:
	$(MAKE) -C homm3tools/h3m/h3mtilespritegen/BUILD/gcc clean
	$(MAKE) -C homm3tools/h3m/h3mlib/BUILD/gcc clean
	rm -rf dist doc

.PHONY: libs
libs:
	$(MAKE) -C homm3tools/h3m/h3mtilespritegen/BUILD/gcc install
	$(MAKE) -C homm3tools/h3m/h3mlib/BUILD/gcc install

dist/homm3lua.so: $(OBJ) | libs
	$(CC) $^ $(STATICLIBS) $(CFLAGS) $(LDLIBS) -o $@

dist/%.o: homm3lua/%.c homm3lua/%.h | dist
	$(CC) $< -c $(CFLAGS) -o $@

dist:
	mkdir -p dist

doc: doc/index.html
doc/index.html: $(SRC)
	ldoc -c /dev/null homm3lua
