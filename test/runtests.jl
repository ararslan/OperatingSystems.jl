using OperatingSystems
using Base.Test

@test CURRENT_OS <: OS

if is_windows()
    @test CURRENT_OS == Windows
else
    @test CURRENT_OS <: UnixBasedOS
    if is_apple()
        @test CURRENT_OS == MacOS
        @test CURRENT_OS <: BSDBasedOS
    elseif is_linux()
        @test CURRENT_OS == Linux
    elseif is_bsd()
        @test CURRENT_OS == eval(OperatingSystems, Sys.KERNEL)
        @test CURRENT_OS <: BSDBasedOS
    end
end
