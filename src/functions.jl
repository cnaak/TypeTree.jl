#==============================================================================================#
#                            functions.jl -- typeTree functionality                            #
#==============================================================================================#

using InteractiveUtils: subtypes

function tt(TY::Type, pref=("",); uni=true, concrete=false)
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
