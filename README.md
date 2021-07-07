# typeTree.jl
Julia type tree displaying micro package

# Description
`typeTree.jl` is a microscopic package written in the Julia language aimed at providing the
simple utility of text-based visual type tree inspection to the human eye, i.e., programmers. It
defines and exports the `tt` function:

```julia
julia> using typeTree

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


