#==============================================================================================#
#                              runtests.jl -- typeTree test file                               #
#==============================================================================================#

using typeTree
using Test

@testset "quiz.type.abstract:                                                     " begin
    # All types
    @test length(tt(typeTree.A)) == 7
    @test length(tt(typeTree.Aa)) == 3
    @test length(tt(typeTree.Ab)) == 2
    @test length(tt(typeTree.B)) == 2
    @test length(tt(typeTree.Ba)) == 1
    @test length(tt(typeTree.tyTree)) == 10
    # Abstract types only
    @test length(tt(typeTree.A, concrete=false)) == 3
    @test length(tt(typeTree.Aa, concrete=false)) == 1
    @test length(tt(typeTree.Ab, concrete=false)) == 1
    @test length(tt(typeTree.B, concrete=false)) == 2
    @test length(tt(typeTree.Ba, concrete=false)) == 1
    @test length(tt(typeTree.tyTree, concrete=false)) == 6
end
