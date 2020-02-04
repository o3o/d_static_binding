extern(C) @nogc nothrow {
   int some_c_function(int);
}

void main() {
    import std.stdio;
    writeln(some_c_function(10));
}
