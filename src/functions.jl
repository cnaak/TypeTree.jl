#==============================================================================================#
#                            functions.jl -- TypeTree functionality                            #
#==============================================================================================#

using InteractiveUtils: subtypes

"""
`function tt(TY::Type, pref=("",); uni=true, concrete=true, mod=nothing)`\n
Returns a `Vector{String}` of type entries formatted as a tree for human (programmer)
inspection.

- The `TY` argument is the type for which to produce the tree;
- The `pref` optional argument is a text prefix;
- The `uni` optional keyword argument controls whether Unicode characters will be used;
- The `concrete` optional keyword argument controls whether to filter off concrete subtypes.
- The `mod` optional keyword argument removes module prefixes from type names.
"""
function tt(TY::Type, pref=("",); uni=true, concrete=true, mod=nothing)
    ret = Array{String,1}()
    ELL, FRK, BAR = uni ? (" └─ ", " ├─ ", " │  ") : (" \\-- ", " +-- ", " |  ")
    SPC = "    "
    LEN = length(pref) - 1
    PREF = LEN > 0 ? ( i == ELL ? SPC : i == FRK ? BAR : i for i in pref[1:LEN]) : ("",)
    append!(ret, ["$(join((PREF..., pref[end])))$(typename(TY, mod))\n"])
    ST = [i for i in subtypes(TY) if isabstracttype(i) || concrete]
    LE = length(ST)
    for i in 1:LE
        append!(
            ret, tt(ST[i], (pref..., i < LE ? FRK : ELL); uni, concrete, mod)
        )
    end
    ret
end

"""
    typename(SomeModule.SomeType) -> "SomeModule.SomeType"
    typename(SomeModule.SomeType, SomeModule) -> "SomeType"

Returns the name of SomeType in the context of SomeModule.
"""
function typename(TY::Type, mod)
    io = IOBuffer()
    show(mod == nothing ? io : IOContext(io, :module => mod), TY)
    String(take!(io))
end
