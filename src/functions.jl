#==============================================================================================#
#                            functions.jl -- TypeTree functionality                            #
#==============================================================================================#

using InteractiveUtils: subtypes

"""
`function tt(TY::Type, pref=("",); uni=true, concrete=true)`\n
Returns a `Vector{String}` of type entries formatted as a tree for human (programmer)
inspection.

- The `TY` argument is the type for which to produce the tree;
- The `pref` optional argument is a text prefix;
- The `uni` optional keyword argument controls whether Unicode characters will be used;
- The `concrete` optional keyword argument controls whether to filter off concrete subtypes.
"""
function tt(TY::Type, pref=("",); uni=true, concrete=true)
    ret = Array{String,1}()
    ELL, FRK, BAR = uni ? (" └─ ", " ├─ ", " │  ") : (" \\-- ", " +-- ", " |  ")
    SPC = "    "
    LEN = length(pref) - 1
    PREF = LEN > 0 ? ( i == ELL ? SPC : i == FRK ? BAR : i for i in pref[1:LEN]) : ("",)
    append!(ret, ["$(join((PREF..., pref[end])))$(TY)\n"])
    ST = [i for i in subtypes(TY) if isabstracttype(i) || concrete]
    LE = length(ST)
    for i in 1:LE
        append!(
            ret, tt(ST[i], (pref..., i < LE ? FRK : ELL), uni=uni, concrete=concrete)
        )
    end
    ret
end
