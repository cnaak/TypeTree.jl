#==============================================================================================#
#                              runtests.jl -- TypeTree test file                               #
#==============================================================================================#

using TypeTree
using Test


#==============================================================================================#
#                                          Test Data                                           #
#==============================================================================================#

#----------------------------------------------------------------------------------------------#
#                                        Abstract types                                        #
#----------------------------------------------------------------------------------------------#

abstract type tyTree <: Any end
abstract type A <: tyTree end
abstract type Aa <: A end
abstract type Ab <: A end
abstract type B <: tyTree end
abstract type Ba <: B end


#----------------------------------------------------------------------------------------------#
#                                        Concrete types                                        #
#----------------------------------------------------------------------------------------------#

struct Aα <: A end
struct Aaα <: Aa end
struct Aaβ <: Aa end
struct Abα <: Ab end


#==============================================================================================#
#                                            Tests                                             #
#==============================================================================================#

@testset "quiz.type.abstract:                                                     " begin
    # All types
    @test length(tt(A)) == 7
    @test length(tt(Aa)) == 3
    @test length(tt(Ab)) == 2
    @test length(tt(B)) == 2
    @test length(tt(Ba)) == 1
    @test length(tt(tyTree)) == 10
    # Abstract types only
    @test length(tt(A, concrete=false)) == 3
    @test length(tt(Aa, concrete=false)) == 1
    @test length(tt(Ab, concrete=false)) == 1
    @test length(tt(B, concrete=false)) == 2
    @test length(tt(Ba, concrete=false)) == 1
    @test length(tt(tyTree, concrete=false)) == 6
end
