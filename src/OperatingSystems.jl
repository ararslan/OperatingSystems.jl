__precompile__()

module OperatingSystems

export
    CURRENT_OS, # Could be Sys.OS if this goes into Base

    # Supertypes
    AbstractOS,
    Unix,
    BSD,

    # Specific systems
    DragonFly,
    FreeBSD,
    Fuchsia,
    Linux,
    MacOS,
    NetBSD,
    OpenBSD,
    Windows,

    # Unknown system
    UnknownOS

abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

struct DragonFly <: BSD end
struct FreeBSD <: BSD end
struct Fuchsia <: AbstractOS end # lol
struct Linux <: Unix end
struct MacOS <: BSD end
struct NetBSD <: BSD end
struct OpenBSD <: BSD end
struct UnknownOS <: AbstractOS end
struct Windows <: AbstractOS end

const CURRENT_OS = let kern = Sys.KERNEL
    if kern === :Linux
        Linux
    elseif kern === :Windows || kern === :NT
        Windows
    elseif kern === :Darwin || kern === :Apple
        MacOS
    elseif kern === :FreeBSD || kern === :OpenBSD || kern === :NetBSD || kern === :DragonFly
        getfield(current_module(), kern)::BSD
    elseif kern === :Magenta
        Fuchsia
    else
        UnknownOS
    end
end

end # module
