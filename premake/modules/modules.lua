--include("ndk/ndk.lua")
--include("vsandroid/android.lua")
include("androidmk/androidmk.lua")

premake.override(premake.vstudio.vc2010, 'programDataBaseFileName', function(base, cfg)
    if cfg.kind == "StaticLib" and cfg.debugformat ~= "c7" and cfg.flags.Symbols then  
        premake.w('<ProgramDataBaseFileName>$(OutDir)$(TargetName).pdb</ProgramDataBaseFileName>')  
    end
end)

editandcontinue "Off"

filter { "action:vs*", "language:C or C++" }
    defines { "WIN32" }

filter { "action:android*" }
    system "android"

filter { "configurations:Debug" }
    defines { "DEBUG", "_DEBUG" }
    flags { "Symbols" }

filter { "configurations:Release" }
    defines { "NDEBUG" }
    optimize "On"

filter { "system:android" }

filter {}

