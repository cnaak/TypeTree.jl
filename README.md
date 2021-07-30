# TypeTree.jl
Julia type tree displaying micro package

# Description
`TypeTree.jl` is a microscopic package written in the Julia language aimed at providing the
simple utility of text-based visual type tree inspection to the human eye, i.e., programmers. It
defines and exports the `tt` function:

```julia
julia> using TypeTree

julia> tt
tt (generic function with 2 methods)
```

The `tt` function returns a `Vector{String}` of type entries formatted as a tree for human
(programmer) inspection:

```julia
julia> tt(Signed)
7-element Vector{String}:
 "Signed\n"
 " ├─ BigInt\n"
 " ├─ Int128\n"
 " ├─ Int16\n"
 " ├─ Int32\n"
 " ├─ Int64\n"
 " └─ Int8\n"
```

Its output can be simply read on the Julia `REPL` screen, or be printed:

```julia
julia> print(join(tt(Integer), ""))
Integer
 ├─ Bool
 ├─ Signed
 │   ├─ BigInt
 │   ├─ Int128
 │   ├─ Int16
 │   ├─ Int32
 │   ├─ Int64
 │   └─ Int8
 └─ Unsigned
     ├─ UInt128
     ├─ UInt16
     ├─ UInt32
     ├─ UInt64
     └─ UInt8
```

Concrete types can be filtered off and `ASCII`-only outputs can be produced:

```julia
julia> print(join(tt(Number, uni=false, concrete=false), ""))
Number
 \-- Real
     +-- AbstractFloat
     +-- AbstractIrrational
     \-- Integer
         +-- Signed
         \-- Unsigned
```

Type names can be displayed without module prefixes by using the `mod=` option.

```julia
julia> print(tt(Base.LibuvStream)...)
Base.LibuvStream
 ├─ Base.BufferStream
 ├─ Base.PipeEndpoint
 ├─ Base.TTY
 ├─ Sockets.TCPSocket
 └─ Sockets.UDPSocket

julia> print(tt(Base.LibuvStream; mod=Base)...)
LibuvStream
 ├─ BufferStream
 ├─ PipeEndpoint
 ├─ TTY
 ├─ Sockets.TCPSocket
 └─ Sockets.UDPSocket
```

# About

## Author

Prof. C. Naaktgeboren, PhD. [Lattes](http://lattes.cnpq.br/8621139258082919).

Federal University of Technology, Paraná
[(site)](http://portal.utfpr.edu.br/english), Guarapuava Campus.

`NaaktgeborenC <dot!> PhD {at!} gmail [dot!] com`

## License

This project is [licensed](https://github.com/cnaak/TypeTree.jl/blob/main/LICENSE) under
the MIT license.

## Citations

How to cite this project:

```bibtex
@Misc{2021-NaaktgeborenC-TypeTree,
  author       = {C. Naaktgeboren},
  title        = {{TypeTree.jl} -- Julia type tree displaying micro package},
  howpublished = {Online},
  year         = {2021},
  journal      = {GitHub repository},
  publisher    = {GitHub},
  url          = {https://github.com/cnaak/TypeTree.jl},
}
```
