#==============================================================================================#
#                              runtests.jl -- TypeTree test file                               #
#==============================================================================================#

using TypeTree
using Test


#==============================================================================================#
#                                          Test Data                                           #
#==============================================================================================#

module M

#----------------------------------------------------------------------------------------------#
#                                        Abstract types                                        #
#----------------------------------------------------------------------------------------------#

export Ab

abstract type tyTree <: Any end
abstract type A <: tyTree end
abstract type Aa <: A end
abstract type Ab <: A end
abstract type B <: tyTree end
abstract type Ba <: B end


#----------------------------------------------------------------------------------------------#
#                                        Concrete types                                        #
#----------------------------------------------------------------------------------------------#

export Aα

struct Aα <: A end
struct Aaα <: Aa end
struct Aaβ <: Aa end
struct Abα <: Ab end

end # module M


#==============================================================================================#
#                                            Tests                                             #
#==============================================================================================#

using Main.M

@testset "quiz.type.abstract:                                                     " begin
    # All types
    @test length(tt(M.A)) == 7
    @test length(tt(M.Aa)) == 3
    @test length(tt(Ab)) == 2
    @test length(tt(M.B)) == 2
    @test length(tt(M.Ba)) == 1
    @test length(tt(M.tyTree)) == 10
    # Abstract types only
    @test length(tt(M.A, concrete=false)) == 3
    @test length(tt(M.Aa, concrete=false)) == 1
    @test length(tt(Ab, concrete=false)) == 1
    @test length(tt(M.B, concrete=false)) == 2
    @test length(tt(M.Ba, concrete=false)) == 1
    @test length(tt(M.tyTree, concrete=false)) == 6

    @test contains(join(tt(M.tyTree)), " Main.M.Aa\n")
    @test contains(join(tt(M.tyTree)), " Ab\n")
    @test contains(join(tt(M.tyTree)), " Aα\n")

    @test !contains(join(tt(M.tyTree)), " Aa\n")
    @test !contains(join(tt(M.tyTree)), " Main.M.Ab\n")
    @test !contains(join(tt(M.tyTree)), " Main.M.Aα\n")

    @test contains(join(tt(M.tyTree; mod=Main.M)), " Aa\n")
    @test contains(join(tt(M.tyTree; mod=Main.M)), " Ab\n")
    @test contains(join(tt(M.tyTree; mod=Main.M)), " Aα\n")

    @test !contains(join(tt(M.tyTree; mod=Main.M)), " Main.M.Aa\n")
    @test !contains(join(tt(M.tyTree; mod=Main.M)), " Main.M.Ab\n")
    @test !contains(join(tt(M.tyTree; mod=Main.M)), " Main.M.Aα\n")
end
