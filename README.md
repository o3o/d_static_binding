# Static binding in D
_Static binding__ of a _C static library_ in D language

From [Static vs. Dynamic Bindings](https://www.gamedev.net/articles/programming/general-and-gameplay-programming/binding-d-to-c-r3122/)

> By static, I mean a binding that allows linking with C libraries or object files directly at compile time. By dynamic, I mean a binding that does not allow linking at compile time, but instead loads a shared library (DLL/so/dylib/framework) at runtime
> ...
> So with a static binding in D, a program can be linked at compile time with the static library libBar.a (Posix) for static linkage, or the  libBar.so for dynamic linkage.
> A dynamic binding can not be linked to anything at compile time. No static libraries, no import libraries, no shared objects.



For more information see:
- [Michael Parker](https://www.packtpub.com/application-development/learning-d)
- [The D and C Series](https://dlang.org/blog/the-d-and-c-series/)


## Build clib
The file must be compiled into object file for linking with the D programs:

```
$ cd ./c
$ make
$ ls -1
clib.c
clib.o
libclib.a
makefile
```

## Build D example

We have two ways:
1. include clib into exacutable
1. pass the necessary information to the linker

these two ways are defined in dub as configuration `mode1` and mode2:

```
name "staticbind"
description "Stating binding example"
authors "Orfeo Da Vià"
targetType "executable"

configuration "mode1" {
  targetName "mode1"
  sourceFiles "c/libclib.a"
}

configuration "mode2" {
   targetName "mode2"
   lflags "-L./c" "-lclib"
}
```

## Mode 1
In order to build
```
dub build -c=mode1
```

## Mode 2
```
dub build -c=mode2
```

Linker flags:
```
   lflags "-L./c" "-lclib"
```
means:

- `-L/path/to/libraries`: the linker searches a standard list of directories for the library. The directories searched include several standard system directories plus any that you specify with `-L``.
- `-lfoo` Search the library named `foo` (or libfoo.a) when linking.

