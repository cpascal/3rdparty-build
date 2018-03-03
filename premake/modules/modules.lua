--include("ndk/ndk.lua")
--include("vsandroid/android.lua")
include("androidmk/androidmk.lua")

if premake.vstudio.vc2010 ~= nil then
    premake.override(premake.vstudio.vc2010, 'programDataBaseFileName', function(base, cfg)
        if cfg.kind == "StaticLib" and cfg.debugformat ~= "c7" and cfg.flags.Symbols then  
            premake.w('<ProgramDataBaseFileName>$(OutDir)$(TargetName).pdb</ProgramDataBaseFileName>')  
        end
    end)
end

editandcontinue "Off"

filter { "action:vs*", "language:C or C++" }
    defines { "WIN32" }

filter { "action:android*" }
    system "android"

filter { "action:androidmk" }
    ndkabi "all"
    ndkplatform "android-9"
    ndktoolchainversion "4.9"

filter { "configurations:Debug" }
    defines { "DEBUG", "_DEBUG" }
    symbols "On"

filter { "configurations:Release" }
    defines { "NDEBUG" }
    optimize "On"

filter { "system:android" }

filter {}
