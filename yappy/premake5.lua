-- premake5.lua
require "../premake/modules/modules"

workspace "yappy"
    configurations { "Debug", "Release" }
    location "_build_%{_ACTION}"
    if _ACTION == "androidmk" then
        location "_build_%{_ACTION}/jni"
        ndkabi "all"
        ndkplatform "android-9"
    end

project "yappy"
    language "C"
    kind "StaticLib"
    targetdir "_build_%{_ACTION}/%{cfg.buildcfg}"
    files {
        "src/yappy.cpp"
    }

    filter {}

