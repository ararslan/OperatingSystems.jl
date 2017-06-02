__precompile__()

module OperatingSystems

export
    CURRENT_OS,

    # Supertypes
    OS,
    UnixBasedOS,
    BSDBasedOS,

    # Specific systems
    Dragonfly,
    FreeBSD,
    Fuchsia,
    Linux,
    MacOS,
    NetBSD,
    OpenBSD,
    Windows,

    # Unknown system
    UnknownOS

abstract type OS end
abstract type UnixBasedOS <: OS end
abstract type BSDBasedOS <: UnixBasedOS end

struct Dragonfly <: BSDBasedOS end
struct FreeBSD <: BSDBasedOS end
struct Fuchsia <: OS end # lol
struct Linux <: UnixBasedOS end
struct MacOS <: BSDBasedOS end
struct NetBSD <: BSDBasedOS end
struct OpenBSD <: BSDBasedOS end
struct UnknownOS <: OS end
struct Windows <: OS end

const CURRENT_OS = let kern = Sys.KERNEL
    if kern === :Linux
        Linux
    elseif kern === :Windows || kern === :NT
        Windows
    elseif kern === :Darwin || kern === :Apple
        MacOS
    elseif kern === :FreeBSD || kern === :OpenBSD || kern === :NetBSD || kern === :Dragonfly
        eval(kern)::BSDBasedOS
    elseif kern === :Magenta
        Fuchsia
    else
        UknownOS
    end
end

end # module
