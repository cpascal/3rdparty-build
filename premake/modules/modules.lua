--include("ndk/ndk.lua")
--include("vsandroid/android.lua")
include("androidmk/androidmk.lua")

premake.override(premake.vstudio.vc2010, 'programDataBaseFileName', function(base, cfg)
    if cfg.kind == "StaticLib" and cfg.debugformat ~= "c7" and cfg.flags.Symbols then  
        premake.w('<ProgramDataBaseFileName>$(OutDir)$(TargetName).pdb</ProgramDataBaseFileName>')  
    end
end)

filter { "action:android" }
	system "android"

filter {}

