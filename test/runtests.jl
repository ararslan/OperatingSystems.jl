using OperatingSystems
using Base.Test

@test CURRENT_OS <: AbstractOS

if is_windows()
    @test CURRENT_OS == Windows
else
    @test CURRENT_OS <: Unix
    if is_apple()
        @test CURRENT_OS == MacOS
        @test CURRENT_OS <: BSD
    elseif is_linux()
        @test CURRENT_OS == Linux
    elseif is_bsd()
        @test CURRENT_OS == eval(OperatingSystems, Sys.KERNEL)
        @test CURRENT_OS <: BSD
    end
end
